import {Component, OnInit} from '@angular/core';
import {GroupeEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/grpe/GroupeEtudiantCollaborator.service';
import {GroupeEtudiantDto} from 'src/app/shared/model/grpe/GroupeEtudiant.model';
import {GroupeEtudiantCriteria} from 'src/app/shared/criteria/grpe/GroupeEtudiantCriteria.model';


import {ConfirmationService, MessageService,MenuItem} from 'primeng/api';
import {FileTempDto} from 'src/app/zynerator/dto/FileTempDto.model';
import {DatePipe} from '@angular/common';
import {Router} from '@angular/router';
import {Inject, Injectable, PLATFORM_ID} from '@angular/core';

import {environment} from 'src/environments/environment';

import {RoleService} from 'src/app/zynerator/security/shared/service/Role.service';
import {AbstractService} from 'src/app/zynerator/service/AbstractService';
import {BaseDto} from 'src/app/zynerator/dto/BaseDto.model';
import {BaseCriteria} from 'src/app/zynerator/criteria/BaseCriteria.model';
import {StringUtilService} from 'src/app/zynerator/util/StringUtil.service';
import {ServiceLocator} from 'src/app/zynerator/service/ServiceLocator';

import {AuthService} from 'src/app/zynerator/security/shared/service/Auth.service';
import {ExportService} from 'src/app/zynerator/util/Export.service';


import {ParcoursDto} from 'src/app/shared/model/course/Parcours.model';
import {ParcoursCollaboratorService} from 'src/app/shared/service/collaborator/course/ParcoursCollaborator.service';
import {GroupeEtatDto} from 'src/app/shared/model/grpe/GroupeEtat.model';
import {GroupeEtatCollaboratorService} from 'src/app/shared/service/collaborator/grpe/GroupeEtatCollaborator.service';
import {GroupeEtudiantDetailDto} from 'src/app/shared/model/grpe/GroupeEtudiantDetail.model';
import {GroupeEtudiantDetailCollaboratorService} from 'src/app/shared/service/collaborator/grpe/GroupeEtudiantDetailCollaborator.service';
import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantCollaboratorService} from 'src/app/shared/service/collaborator/inscription/EtudiantCollaborator.service';
import {GroupeTypeDto} from 'src/app/shared/model/grpe/GroupeType.model';
import {GroupeTypeCollaboratorService} from 'src/app/shared/service/collaborator/grpe/GroupeTypeCollaborator.service';
import {GroupeEtudeDto} from 'src/app/shared/model/grpe/GroupeEtude.model';
import {GroupeEtudeCollaboratorService} from 'src/app/shared/service/collaborator/grpe/GroupeEtudeCollaborator.service';
import {ProfDto} from 'src/app/shared/model/prof/Prof.model';
import {ProfCollaboratorService} from 'src/app/shared/service/collaborator/prof/ProfCollaborator.service';


@Component({
  selector: 'app-groupe-etudiant-list-collaborator',
  templateUrl: './groupe-etudiant-list-collaborator.component.html'
})
export class GroupeEtudiantListCollaboratorComponent implements OnInit {

    protected fileName = 'GroupeEtudiant';

    protected findByCriteriaShow = false;
    protected cols: any[] = [];
    protected excelPdfButons: MenuItem[];
    protected exportData: any[] = [];
    protected criteriaData: any[] = [];
    protected _totalRecords = 0;
    private _pdfName: string;


    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    protected authService: AuthService;
    protected exportService: ExportService;
    protected excelFile: File | undefined;
    protected enableSecurity = false;


    groupeEtudes: Array<GroupeEtudeDto>;
    groupeTypes: Array<GroupeTypeDto>;
    groupeEtats: Array<GroupeEtatDto>;
    parcourss: Array<ParcoursDto>;
    profs: Array<ProfDto>;


    constructor( private service: GroupeEtudiantCollaboratorService  , private parcoursService: ParcoursCollaboratorService, private groupeEtatService: GroupeEtatCollaboratorService, private groupeEtudiantDetailService: GroupeEtudiantDetailCollaboratorService, private etudiantService: EtudiantCollaboratorService, private groupeTypeService: GroupeTypeCollaboratorService, private groupeEtudeService: GroupeEtudeCollaboratorService, private profService: ProfCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.authService = ServiceLocator.injector.get(AuthService);
        this.exportService = ServiceLocator.injector.get(ExportService);
    }

    ngOnInit(): void {
        this.findPaginatedByCriteria();
        this.initExport();
        this.initCol();
        this.loadGroupeEtude();
        this.loadGroupeType();
        this.loadGroupeEtat();
        this.loadParcours();
        this.loadProf();

    }




    public onExcelFileSelected(event: any): void {
        const input = event.target as HTMLInputElement;
        if (input.files && input.files.length > 0) {
            this.excelFile = input.files[0];
        }
    }

    public importExcel(): void {
        if (this.excelFile) {
            this.service.importExcel(this.excelFile).subscribe(
                response => {
                    console.log('File uploaded successfully!', response);
                },
                error => {
                    console.error('Error uploading file:', error);
                }
            );
        }
    }

    public findPaginatedByCriteria() {
        this.service.findPaginatedByCriteria(this.criteria).subscribe(paginatedItems => {
            this.items = paginatedItems.list;
            this.totalRecords = paginatedItems.dataSize;
            this.selections = new Array<GroupeEtudiantDto>();
        }, error => console.log(error));
    }

    public onPage(event: any) {
        this.criteria.page = event.page;
        this.criteria.maxResults = event.rows;
        this.findPaginatedByCriteria();
    }

    public async edit(dto: GroupeEtudiantDto) {
        this.service.findByIdWithAssociatedList(dto).subscribe(res => {
            this.item = res;
            console.log(res);
            this.editDialog = true;
        });

    }

    public async view(dto: GroupeEtudiantDto) {
        this.service.findByIdWithAssociatedList(dto).subscribe(res => {
            this.item = res;
            this.viewDialog = true;
        });
    }

    public async openCreate() {
        this.item = new GroupeEtudiantDto();
        this.createDialog = true;
    }

    public async deleteMultiple() {
        this.confirmationService.confirm({
            message: 'Voulez-vous supprimer ces éléments ?',
            header: 'Confirmation',
            icon: 'pi pi-exclamation-triangle',
            accept: () => {
                this.service.deleteMultiple().subscribe(() => {
                    this.items = this.items.filter(item => !this.selections.includes(item));
                    this.selections = new Array<GroupeEtudiantDto>();
                    this.messageService.add({
                        severity: 'success',
                        summary: 'Succès',
                        detail: 'Les éléments sélectionnés ont été supprimés',
                        life: 3000
                    });

                }, error => console.log(error));
            }
        });
    }


    public isSelectionDisabled(): boolean {
        return this.selections == null || this.selections.length == 0;
    }


    public async delete(dto: GroupeEtudiantDto) {

        this.confirmationService.confirm({
            message: 'Voulez-vous supprimer cet élément ?',
            header: 'Confirmation',
            icon: 'pi pi-exclamation-triangle',
            accept: () => {
                this.service.delete(dto).subscribe(status => {
                    if (status > 0) {
                        const position = this.items.indexOf(dto);
                        position > -1 ? this.items.splice(position, 1) : false;
                        this.messageService.add({
                            severity: 'success',
                            summary: 'Succès',
                            detail: 'Element Supprimé',
                            life: 3000
                        });
                    }

                }, error => console.log(error));
            }
        });

    }

    public async duplicate(dto: GroupeEtudiantDto) {
        this.service.findByIdWithAssociatedList(dto).subscribe(
            res => {
                this.initDuplicate(res);
                this.item = res;
                this.item.id = null;
                this.createDialog = true;
            });
    }

    // TODO : check if correct
    public initExport(): void {
        this.excelPdfButons = [
            {
                label: 'CSV', icon: 'pi pi-file', command: () => {
                    this.prepareColumnExport();
                    this.exportService.exporterCSV(this.criteriaData, this.exportData, this.fileName);
                }
            },
            {
                label: 'XLS', icon: 'pi pi-file-excel', command: () => {
                    this.prepareColumnExport();
                    this.exportService.exporterExcel(this.criteriaData, this.exportData, this.fileName);
                }
            },
            {
                label: 'PDF', icon: 'pi pi-file-pdf', command: () => {
                    this.prepareColumnExport();
                    this.exportService.exporterPdf(this.criteriaData, this.exportData, this.fileName);
                }
            }
        ];
    }

    public exportPdf(dto: GroupeEtudiantDto): void {
        this.service.exportPdf(dto).subscribe((data: ArrayBuffer) => {
            const blob = new Blob([data], {type: 'application/pdf'});
            const url = window.URL.createObjectURL(blob);
            const link = document.createElement('a');
            link.href = url;
            link.download = this.pdfName;
            link.setAttribute('target', '_blank'); // open link in new tab
            link.click();
            window.URL.revokeObjectURL(url);
        }, (error) => {
            console.error(error); // handle any errors that occur
        });
    }

    public showSearch(): void {
        this.findByCriteriaShow = !this.findByCriteriaShow;
    }


    update() {
        this.service.edit().subscribe(data => {
            const myIndex = this.items.findIndex(e => e.id === this.item.id);
            this.items[myIndex] = data;
            this.editDialog = false;
            this.item = new GroupeEtudiantDto();
        } , error => {
            console.log(error);
        });
    }

    public save() {
        this.service.save().subscribe(item => {
            if (item != null) {
                this.items.push({...item});
                this.createDialog = false;


                this.item = new GroupeEtudiantDto();
            } else {
                this.messageService.add({severity: 'error', summary: 'Erreurs', detail: 'Element existant'});
            }
        }, error => {
            console.log(error);
        });
    }

// add


    public initCol() {
        this.cols = [
            {field: 'libelle', header: 'Libelle'},
            {field: 'type', header: 'Type'},
            {field: 'dateDebut', header: 'Date debut'},
            {field: 'dateFin', header: 'Date fin'},
            {field: 'nombrePlace', header: 'Nombre place'},
            {field: 'nombrePlacevide', header: 'Nombre placevide'},
            {field: 'nombrePlaceNonVide', header: 'Nombre place non vide'},
            {field: 'groupeEtude?.libelle', header: 'Groupe etude'},
            {field: 'groupeType?.libelle', header: 'Groupe type'},
            {field: 'groupeEtat?.libelle', header: 'Groupe etat'},
            {field: 'parcours?.libelle', header: 'Parcours'},
            {field: 'prof?.ref', header: 'Prof'},
            {field: 'nreCoursesComing', header: 'Nre courses coming'},
            {field: 'nreCoursesCompleted', header: 'Nre courses completed'},
            {field: 'nreCourses', header: 'Nre courses'},
        ];
    }


    public async loadGroupeEtude(){
        this.groupeEtudeService.findAllOptimized().subscribe(groupeEtudes => this.groupeEtudes = groupeEtudes, error => console.log(error))
    }
    public async loadGroupeType(){
        this.groupeTypeService.findAllOptimized().subscribe(groupeTypes => this.groupeTypes = groupeTypes, error => console.log(error))
    }
    public async loadGroupeEtat(){
        this.groupeEtatService.findAllOptimized().subscribe(groupeEtats => this.groupeEtats = groupeEtats, error => console.log(error))
    }
    public async loadParcours(){
        this.parcoursService.findAllOptimized().subscribe(parcourss => this.parcourss = parcourss, error => console.log(error))
    }
    public async loadProf(){
        this.profService.findAllOptimized().subscribe(profs => this.profs = profs, error => console.log(error))
    }


	public initDuplicate(res: GroupeEtudiantDto) {
        if (res.groupeEtudiantDetails != null) {
             res.groupeEtudiantDetails.forEach(d => { d.groupeEtudiant = null; d.id = null; });
        }
	}



   public prepareColumnExport(): void {
        this.exportData = this.items.map(e => {
            return {
                 'Libelle': e.libelle ,
                 'Type': e.type ,
                'Date debut': this.datePipe.transform(e.dateDebut , 'dd/MM/yyyy hh:mm'),
                'Date fin': this.datePipe.transform(e.dateFin , 'dd/MM/yyyy hh:mm'),
                 'Nombre place': e.nombrePlace ,
                 'Nombre placevide': e.nombrePlacevide ,
                 'Nombre place non vide': e.nombrePlaceNonVide ,
                'Groupe etude': e.groupeEtude?.libelle ,
                'Groupe type': e.groupeType?.libelle ,
                'Groupe etat': e.groupeEtat?.libelle ,
                'Parcours': e.parcours?.libelle ,
                'Prof': e.prof?.ref ,
                 'Nre courses coming': e.nreCoursesComing ,
                 'Nre courses completed': e.nreCoursesCompleted ,
                 'Nre courses': e.nreCourses ,
            }
        });

        this.criteriaData = [{
            'Libelle': this.criteria.libelle ? this.criteria.libelle : environment.emptyForExport ,
            'Type': this.criteria.type ? this.criteria.type : environment.emptyForExport ,
            'Date debut Min': this.criteria.dateDebutFrom ? this.datePipe.transform(this.criteria.dateDebutFrom , this.dateFormat) : environment.emptyForExport ,
            'Date debut Max': this.criteria.dateDebutTo ? this.datePipe.transform(this.criteria.dateDebutTo , this.dateFormat) : environment.emptyForExport ,
            'Date fin Min': this.criteria.dateFinFrom ? this.datePipe.transform(this.criteria.dateFinFrom , this.dateFormat) : environment.emptyForExport ,
            'Date fin Max': this.criteria.dateFinTo ? this.datePipe.transform(this.criteria.dateFinTo , this.dateFormat) : environment.emptyForExport ,
            'Nombre place Min': this.criteria.nombrePlaceMin ? this.criteria.nombrePlaceMin : environment.emptyForExport ,
            'Nombre place Max': this.criteria.nombrePlaceMax ? this.criteria.nombrePlaceMax : environment.emptyForExport ,
            'Nombre placevide Min': this.criteria.nombrePlacevideMin ? this.criteria.nombrePlacevideMin : environment.emptyForExport ,
            'Nombre placevide Max': this.criteria.nombrePlacevideMax ? this.criteria.nombrePlacevideMax : environment.emptyForExport ,
            'Nombre place non vide Min': this.criteria.nombrePlaceNonVideMin ? this.criteria.nombrePlaceNonVideMin : environment.emptyForExport ,
            'Nombre place non vide Max': this.criteria.nombrePlaceNonVideMax ? this.criteria.nombrePlaceNonVideMax : environment.emptyForExport ,
        //'Groupe etude': this.criteria.groupeEtude?.libelle ? this.criteria.groupeEtude?.libelle : environment.emptyForExport ,
        //'Groupe type': this.criteria.groupeType?.libelle ? this.criteria.groupeType?.libelle : environment.emptyForExport ,
        //'Groupe etat': this.criteria.groupeEtat?.libelle ? this.criteria.groupeEtat?.libelle : environment.emptyForExport ,
        //'Parcours': this.criteria.parcours?.libelle ? this.criteria.parcours?.libelle : environment.emptyForExport ,
        //'Prof': this.criteria.prof?.ref ? this.criteria.prof?.ref : environment.emptyForExport ,
            'Nre courses coming Min': this.criteria.nreCoursesComingMin ? this.criteria.nreCoursesComingMin : environment.emptyForExport ,
            'Nre courses coming Max': this.criteria.nreCoursesComingMax ? this.criteria.nreCoursesComingMax : environment.emptyForExport ,
            'Nre courses completed Min': this.criteria.nreCoursesCompletedMin ? this.criteria.nreCoursesCompletedMin : environment.emptyForExport ,
            'Nre courses completed Max': this.criteria.nreCoursesCompletedMax ? this.criteria.nreCoursesCompletedMax : environment.emptyForExport ,
            'Nre courses Min': this.criteria.nreCoursesMin ? this.criteria.nreCoursesMin : environment.emptyForExport ,
            'Nre courses Max': this.criteria.nreCoursesMax ? this.criteria.nreCoursesMax : environment.emptyForExport ,
        }];
      }



    get items(): Array<GroupeEtudiantDto> {
        return this.service.items;
    }

    set items(value: Array<GroupeEtudiantDto>) {
        this.service.items = value;
    }

    get selections(): Array<GroupeEtudiantDto> {
        return this.service.selections;
    }

    set selections(value: Array<GroupeEtudiantDto>) {
        this.service.selections = value;
    }

    get item(): GroupeEtudiantDto {
        return this.service.item;
    }

    set item(value: GroupeEtudiantDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get viewDialog(): boolean {
        return this.service.viewDialog;
    }

    set viewDialog(value: boolean) {
        this.service.viewDialog = value;
    }

    get criteria(): GroupeEtudiantCriteria {
        return this.service.criteria;
    }

    set criteria(value: GroupeEtudiantCriteria) {
        this.service.criteria = value;
    }

    get dateFormat() {
        return environment.dateFormatList;
    }


    get totalRecords(): number {
        return this._totalRecords;
    }

    set totalRecords(value: number) {
        this._totalRecords = value;
    }

    get pdfName(): string {
        return this._pdfName;
    }

    set pdfName(value: string) {
        this._pdfName = value;
    }

    get createActionIsValid(): boolean {
        return this.service.createActionIsValid;
    }

    set createActionIsValid(value: boolean) {
        this.service.createActionIsValid = value;
    }


    get editActionIsValid(): boolean {
        return this.service.editActionIsValid;
    }

    set editActionIsValid(value: boolean) {
        this.service.editActionIsValid = value;
    }

    get listActionIsValid(): boolean {
        return this.service.listActionIsValid;
    }

    set listActionIsValid(value: boolean) {
        this.service.listActionIsValid = value;
    }

    get deleteActionIsValid(): boolean {
        return this.service.deleteActionIsValid;
    }

    set deleteActionIsValid(value: boolean) {
        this.service.deleteActionIsValid = value;
    }


    get viewActionIsValid(): boolean {
        return this.service.viewActionIsValid;
    }

    set viewActionIsValid(value: boolean) {
        this.service.viewActionIsValid = value;
    }

    get duplicateActionIsValid(): boolean {
        return this.service.duplicateActionIsValid;
    }

    set duplicateActionIsValid(value: boolean) {
        this.service.duplicateActionIsValid = value;
    }

    get createAction(): string {
        return this.service.createAction;
    }

    set createAction(value: string) {
        this.service.createAction = value;
    }

    get listAction(): string {
        return this.service.listAction;
    }

    set listAction(value: string) {
        this.service.listAction = value;
    }

    get editAction(): string {
        return this.service.editAction;
    }

    set editAction(value: string) {
        this.service.editAction = value;
    }

    get deleteAction(): string {
        return this.service.deleteAction;
    }

    set deleteAction(value: string) {
        this.service.deleteAction = value;
    }

    get viewAction(): string {
        return this.service.viewAction;
    }

    set viewAction(value: string) {
        this.service.viewAction = value;
    }

    get duplicateAction(): string {
        return this.service.duplicateAction;
    }

    set duplicateAction(value: string) {
        this.service.duplicateAction = value;
    }

    get entityName(): string {
        return this.service.entityName;
    }

    set entityName(value: string) {
        this.service.entityName = value;
    }
}
