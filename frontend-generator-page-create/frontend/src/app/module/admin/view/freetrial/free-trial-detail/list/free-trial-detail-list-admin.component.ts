import {Component, OnInit} from '@angular/core';
import {FreeTrialDetailAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialDetailAdmin.service';
import {FreeTrialDetailDto} from 'src/app/shared/model/freetrial/FreeTrialDetail.model';
import {FreeTrialDetailCriteria} from 'src/app/shared/criteria/freetrial/FreeTrialDetailCriteria.model';


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


import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantAdminService} from 'src/app/shared/service/admin/inscription/EtudiantAdmin.service';
import {FreeTrialDto} from 'src/app/shared/model/freetrial/FreeTrial.model';
import {FreeTrialAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialAdmin.service';


@Component({
  selector: 'app-free-trial-detail-list-admin',
  templateUrl: './free-trial-detail-list-admin.component.html'
})
export class FreeTrialDetailListAdminComponent implements OnInit {

    protected fileName = 'FreeTrialDetail';

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


     yesOrNoPresence: any[] = [];
     yesOrNoWhatsUpMessageSent: any[] = [];
     yesOrNoEmailMessageSent: any[] = [];
     yesOrNoAbonne: any[] = [];
    freeTrials: Array<FreeTrialDto>;
    etudiants: Array<EtudiantDto>;


    constructor( private service: FreeTrialDetailAdminService  , private etudiantService: EtudiantAdminService, private freeTrialService: FreeTrialAdminService, @Inject(PLATFORM_ID) private platformId?) {
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
        this.loadFreeTrial();
        this.loadEtudiant();
        this.yesOrNoPresence =  [{label: 'Presence', value: null},{label: 'Oui', value: 1},{label: 'Non', value: 0}];
        this.yesOrNoWhatsUpMessageSent =  [{label: 'WhatsUpMessageSent', value: null},{label: 'Oui', value: 1},{label: 'Non', value: 0}];
        this.yesOrNoEmailMessageSent =  [{label: 'EmailMessageSent', value: null},{label: 'Oui', value: 1},{label: 'Non', value: 0}];
        this.yesOrNoAbonne =  [{label: 'Abonne', value: null},{label: 'Oui', value: 1},{label: 'Non', value: 0}];

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
            this.selections = new Array<FreeTrialDetailDto>();
        }, error => console.log(error));
    }

    public onPage(event: any) {
        this.criteria.page = event.page;
        this.criteria.maxResults = event.rows;
        this.findPaginatedByCriteria();
    }

    public async edit(dto: FreeTrialDetailDto) {
        this.service.findByIdWithAssociatedList(dto).subscribe(res => {
            this.item = res;
            console.log(res);
            this.editDialog = true;
        });

    }

    public async view(dto: FreeTrialDetailDto) {
        this.service.findByIdWithAssociatedList(dto).subscribe(res => {
            this.item = res;
            this.viewDialog = true;
        });
    }

    public async openCreate() {
        this.item = new FreeTrialDetailDto();
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
                    this.selections = new Array<FreeTrialDetailDto>();
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


    public async delete(dto: FreeTrialDetailDto) {

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

    public async duplicate(dto: FreeTrialDetailDto) {
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

    public exportPdf(dto: FreeTrialDetailDto): void {
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
            this.item = new FreeTrialDetailDto();
        } , error => {
            console.log(error);
        });
    }

    public save() {
        this.service.save().subscribe(item => {
            if (item != null) {
                this.items.push({...item});
                this.createDialog = false;


                this.item = new FreeTrialDetailDto();
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
            {field: 'freeTrial?.reference', header: 'Free trial'},
            {field: 'etudiant?.id', header: 'Etudiant'},
            {field: 'presence', header: 'Presence'},
            {field: 'whatsUpMessageSent', header: 'Whats up message sent'},
            {field: 'dateEnvoiwhatsUpMessage', header: 'Date envoiwhats up message'},
            {field: 'emailMessageSent', header: 'Email message sent'},
            {field: 'dateEnvoiEmailMessage', header: 'Date envoi email message'},
            {field: 'abonne', header: 'Abonne'},
        ];
    }


    public async loadFreeTrial(){
        this.freeTrialService.findAllOptimized().subscribe(freeTrials => this.freeTrials = freeTrials, error => console.log(error))
    }
    public async loadEtudiant(){
        this.etudiantService.findAll().subscribe(etudiants => this.etudiants = etudiants, error => console.log(error))
    }


	public initDuplicate(res: FreeTrialDetailDto) {
	}



   public prepareColumnExport(): void {
        this.exportData = this.items.map(e => {
            return {
                'Free trial': e.freeTrial?.reference ,
                'Etudiant': e.etudiant?.id ,
                'Presence': e.presence? 'Vrai' : 'Faux' ,
                'Whats up message sent': e.whatsUpMessageSent? 'Vrai' : 'Faux' ,
                'Date envoiwhats up message': this.datePipe.transform(e.dateEnvoiwhatsUpMessage , 'dd/MM/yyyy hh:mm'),
                'Email message sent': e.emailMessageSent? 'Vrai' : 'Faux' ,
                'Date envoi email message': this.datePipe.transform(e.dateEnvoiEmailMessage , 'dd/MM/yyyy hh:mm'),
                'Abonne': e.abonne? 'Vrai' : 'Faux' ,
            }
        });

        this.criteriaData = [{
        //'Free trial': this.criteria.freeTrial?.reference ? this.criteria.freeTrial?.reference : environment.emptyForExport ,
        //'Etudiant': this.criteria.etudiant?.id ? this.criteria.etudiant?.id : environment.emptyForExport ,
            'Presence': this.criteria.presence ? (this.criteria.presence ? environment.trueValue : environment.falseValue) : environment.emptyForExport ,
            'Whats up message sent': this.criteria.whatsUpMessageSent ? (this.criteria.whatsUpMessageSent ? environment.trueValue : environment.falseValue) : environment.emptyForExport ,
            'Date envoiwhats up message Min': this.criteria.dateEnvoiwhatsUpMessageFrom ? this.datePipe.transform(this.criteria.dateEnvoiwhatsUpMessageFrom , this.dateFormat) : environment.emptyForExport ,
            'Date envoiwhats up message Max': this.criteria.dateEnvoiwhatsUpMessageTo ? this.datePipe.transform(this.criteria.dateEnvoiwhatsUpMessageTo , this.dateFormat) : environment.emptyForExport ,
            'Email message sent': this.criteria.emailMessageSent ? (this.criteria.emailMessageSent ? environment.trueValue : environment.falseValue) : environment.emptyForExport ,
            'Date envoi email message Min': this.criteria.dateEnvoiEmailMessageFrom ? this.datePipe.transform(this.criteria.dateEnvoiEmailMessageFrom , this.dateFormat) : environment.emptyForExport ,
            'Date envoi email message Max': this.criteria.dateEnvoiEmailMessageTo ? this.datePipe.transform(this.criteria.dateEnvoiEmailMessageTo , this.dateFormat) : environment.emptyForExport ,
            'Abonne': this.criteria.abonne ? (this.criteria.abonne ? environment.trueValue : environment.falseValue) : environment.emptyForExport ,
        }];
      }



    get items(): Array<FreeTrialDetailDto> {
        return this.service.items;
    }

    set items(value: Array<FreeTrialDetailDto>) {
        this.service.items = value;
    }

    get selections(): Array<FreeTrialDetailDto> {
        return this.service.selections;
    }

    set selections(value: Array<FreeTrialDetailDto>) {
        this.service.selections = value;
    }

    get item(): FreeTrialDetailDto {
        return this.service.item;
    }

    set item(value: FreeTrialDetailDto) {
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

    get criteria(): FreeTrialDetailCriteria {
        return this.service.criteria;
    }

    set criteria(value: FreeTrialDetailCriteria) {
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
