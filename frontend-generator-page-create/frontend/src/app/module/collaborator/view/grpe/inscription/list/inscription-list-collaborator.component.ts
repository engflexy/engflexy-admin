import {Component, OnInit} from '@angular/core';
import {InscriptionCollaboratorService} from 'src/app/shared/service/collaborator/grpe/InscriptionCollaborator.service';
import {InscriptionDto} from 'src/app/shared/model/grpe/Inscription.model';
import {InscriptionCriteria} from 'src/app/shared/criteria/grpe/InscriptionCriteria.model';


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
import {QuizDto} from 'src/app/shared/model/quiz/Quiz.model';
import {QuizCollaboratorService} from 'src/app/shared/service/collaborator/quiz/QuizCollaborator.service';
import {SkillDto} from 'src/app/shared/model/inscriptionref/Skill.model';
import {SkillCollaboratorService} from 'src/app/shared/service/collaborator/inscriptionref/SkillCollaborator.service';
import {InteretEtudiantDto} from 'src/app/shared/model/inscriptionref/InteretEtudiant.model';
import {InteretEtudiantCollaboratorService} from 'src/app/shared/service/collaborator/inscriptionref/InteretEtudiantCollaborator.service';
import {FonctionDto} from 'src/app/shared/model/inscriptionref/Fonction.model';
import {FonctionCollaboratorService} from 'src/app/shared/service/collaborator/inscriptionref/FonctionCollaborator.service';
import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantCollaboratorService} from 'src/app/shared/service/collaborator/inscription/EtudiantCollaborator.service';
import {EtatInscriptionDto} from 'src/app/shared/model/inscriptionref/EtatInscription.model';
import {EtatInscriptionCollaboratorService} from 'src/app/shared/service/collaborator/inscriptionref/EtatInscriptionCollaborator.service';
import {GroupeTypeDto} from 'src/app/shared/model/grpe/GroupeType.model';
import {GroupeTypeCollaboratorService} from 'src/app/shared/service/collaborator/grpe/GroupeTypeCollaborator.service';
import {StatutSocialDto} from 'src/app/shared/model/inscriptionref/StatutSocial.model';
import {StatutSocialCollaboratorService} from 'src/app/shared/service/collaborator/inscriptionref/StatutSocialCollaborator.service';
import {PackStudentDto} from 'src/app/shared/model/pack/PackStudent.model';
import {PackStudentCollaboratorService} from 'src/app/shared/service/collaborator/pack/PackStudentCollaborator.service';
import {GroupeEtudeDto} from 'src/app/shared/model/grpe/GroupeEtude.model';
import {GroupeEtudeCollaboratorService} from 'src/app/shared/service/collaborator/grpe/GroupeEtudeCollaborator.service';
import {NiveauEtudeDto} from 'src/app/shared/model/inscriptionref/NiveauEtude.model';
import {NiveauEtudeCollaboratorService} from 'src/app/shared/service/collaborator/inscriptionref/NiveauEtudeCollaborator.service';


@Component({
  selector: 'app-inscription-list-collaborator',
  templateUrl: './inscription-list-collaborator.component.html'
})
export class InscriptionListCollaboratorComponent implements OnInit {

    protected fileName = 'Inscription';

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


     yesOrNoQuizFinished: any[] = [];
     yesOrNoSubscriptionFinished: any[] = [];
    etudiants: Array<EtudiantDto>;
    etatInscriptions: Array<EtatInscriptionDto>;
    parcourss: Array<ParcoursDto>;
    groupeEtudes: Array<GroupeEtudeDto>;
    groupeTypes: Array<GroupeTypeDto>;
    statutSocials: Array<StatutSocialDto>;
    interetEtudiants: Array<InteretEtudiantDto>;
    niveauEtudes: Array<NiveauEtudeDto>;
    fonctions: Array<FonctionDto>;
    quizs: Array<QuizDto>;
    packStudents: Array<PackStudentDto>;
    skills: Array<SkillDto>;


    constructor( private service: InscriptionCollaboratorService  , private parcoursService: ParcoursCollaboratorService, private quizService: QuizCollaboratorService, private skillService: SkillCollaboratorService, private interetEtudiantService: InteretEtudiantCollaboratorService, private fonctionService: FonctionCollaboratorService, private etudiantService: EtudiantCollaboratorService, private etatInscriptionService: EtatInscriptionCollaboratorService, private groupeTypeService: GroupeTypeCollaboratorService, private statutSocialService: StatutSocialCollaboratorService, private packStudentService: PackStudentCollaboratorService, private groupeEtudeService: GroupeEtudeCollaboratorService, private niveauEtudeService: NiveauEtudeCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {
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
        this.loadEtudiant();
        this.loadEtatInscription();
        this.loadParcours();
        this.loadGroupeEtude();
        this.loadGroupeType();
        this.loadStatutSocial();
        this.loadInteretEtudiant();
        this.loadNiveauEtude();
        this.loadFonction();
        this.loadQuiz();
        this.loadPackStudent();
        this.loadSkill();
        this.yesOrNoQuizFinished =  [{label: 'QuizFinished', value: null},{label: 'Oui', value: 1},{label: 'Non', value: 0}];
        this.yesOrNoSubscriptionFinished =  [{label: 'SubscriptionFinished', value: null},{label: 'Oui', value: 1},{label: 'Non', value: 0}];

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
            this.selections = new Array<InscriptionDto>();
        }, error => console.log(error));
    }

    public onPage(event: any) {
        this.criteria.page = event.page;
        this.criteria.maxResults = event.rows;
        this.findPaginatedByCriteria();
    }

    public async edit(dto: InscriptionDto) {
        this.service.findByIdWithAssociatedList(dto).subscribe(res => {
            this.item = res;
            console.log(res);
            this.editDialog = true;
        });

    }

    public async view(dto: InscriptionDto) {
        this.service.findByIdWithAssociatedList(dto).subscribe(res => {
            this.item = res;
            this.viewDialog = true;
        });
    }

    public async openCreate() {
        this.item = new InscriptionDto();
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
                    this.selections = new Array<InscriptionDto>();
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


    public async delete(dto: InscriptionDto) {

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

    public async duplicate(dto: InscriptionDto) {
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

    public exportPdf(dto: InscriptionDto): void {
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
            this.item = new InscriptionDto();
        } , error => {
            console.log(error);
        });
    }

    public save() {
        this.service.save().subscribe(item => {
            if (item != null) {
                this.items.push({...item});
                this.createDialog = false;


                this.item = new InscriptionDto();
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
            {field: 'numeroInscription', header: 'Numero inscription'},
            {field: 'etudiant?.id', header: 'Etudiant'},
            {field: 'etatInscription?.libelle', header: 'Etat inscription'},
            {field: 'parcours?.libelle', header: 'Parcours'},
            {field: 'groupeEtude?.libelle', header: 'Groupe etude'},
            {field: 'groupeType?.libelle', header: 'Groupe type'},
            {field: 'statutSocial?.libelle', header: 'Statut social'},
            {field: 'interetEtudiant?.libelle', header: 'Interet etudiant'},
            {field: 'niveauEtude?.libelle', header: 'Niveau etude'},
            {field: 'fonction?.libelle', header: 'Fonction'},
            {field: 'quiz?.lib', header: 'Quiz'},
            {field: 'noteQuizNiveau', header: 'Note quiz niveau'},
            {field: 'quizFinished', header: 'Quiz finished'},
            {field: 'subscriptionFinished', header: 'Subscription finished'},
            {field: 'dateRegistration', header: 'Date registration'},
            {field: 'datedebutinscription', header: 'Datedebutinscription'},
            {field: 'datefininscription', header: 'Datefininscription'},
            {field: 'packStudent?.libelle', header: 'Pack student'},
            {field: 'skill?.libelle', header: 'Skill'},
            {field: 'skype', header: 'Skype'},
        ];
    }


    public async loadEtudiant(){
        this.etudiantService.findAll().subscribe(etudiants => this.etudiants = etudiants, error => console.log(error))
    }
    public async loadEtatInscription(){
        this.etatInscriptionService.findAllOptimized().subscribe(etatInscriptions => this.etatInscriptions = etatInscriptions, error => console.log(error))
    }
    public async loadParcours(){
        this.parcoursService.findAllOptimized().subscribe(parcourss => this.parcourss = parcourss, error => console.log(error))
    }
    public async loadGroupeEtude(){
        this.groupeEtudeService.findAllOptimized().subscribe(groupeEtudes => this.groupeEtudes = groupeEtudes, error => console.log(error))
    }
    public async loadGroupeType(){
        this.groupeTypeService.findAllOptimized().subscribe(groupeTypes => this.groupeTypes = groupeTypes, error => console.log(error))
    }
    public async loadStatutSocial(){
        this.statutSocialService.findAllOptimized().subscribe(statutSocials => this.statutSocials = statutSocials, error => console.log(error))
    }
    public async loadInteretEtudiant(){
        this.interetEtudiantService.findAllOptimized().subscribe(interetEtudiants => this.interetEtudiants = interetEtudiants, error => console.log(error))
    }
    public async loadNiveauEtude(){
        this.niveauEtudeService.findAllOptimized().subscribe(niveauEtudes => this.niveauEtudes = niveauEtudes, error => console.log(error))
    }
    public async loadFonction(){
        this.fonctionService.findAllOptimized().subscribe(fonctions => this.fonctions = fonctions, error => console.log(error))
    }
    public async loadQuiz(){
        this.quizService.findAllOptimized().subscribe(quizs => this.quizs = quizs, error => console.log(error))
    }
    public async loadPackStudent(){
        this.packStudentService.findAllOptimized().subscribe(packStudents => this.packStudents = packStudents, error => console.log(error))
    }
    public async loadSkill(){
        this.skillService.findAllOptimized().subscribe(skills => this.skills = skills, error => console.log(error))
    }


	public initDuplicate(res: InscriptionDto) {
	}



   public prepareColumnExport(): void {
        this.exportData = this.items.map(e => {
            return {
                 'Numero inscription': e.numeroInscription ,
                'Etudiant': e.etudiant?.id ,
                'Etat inscription': e.etatInscription?.libelle ,
                'Parcours': e.parcours?.libelle ,
                'Groupe etude': e.groupeEtude?.libelle ,
                'Groupe type': e.groupeType?.libelle ,
                'Statut social': e.statutSocial?.libelle ,
                'Interet etudiant': e.interetEtudiant?.libelle ,
                'Niveau etude': e.niveauEtude?.libelle ,
                'Fonction': e.fonction?.libelle ,
                'Quiz': e.quiz?.lib ,
                 'Note quiz niveau': e.noteQuizNiveau ,
                'Quiz finished': e.quizFinished? 'Vrai' : 'Faux' ,
                'Subscription finished': e.subscriptionFinished? 'Vrai' : 'Faux' ,
                 'Date registration': e.dateRegistration ,
                'Datedebutinscription': this.datePipe.transform(e.datedebutinscription , 'dd/MM/yyyy hh:mm'),
                'Datefininscription': this.datePipe.transform(e.datefininscription , 'dd/MM/yyyy hh:mm'),
                'Pack student': e.packStudent?.libelle ,
                'Skill': e.skill?.libelle ,
                 'Skype': e.skype ,
            }
        });

        this.criteriaData = [{
            'Numero inscription Min': this.criteria.numeroInscriptionMin ? this.criteria.numeroInscriptionMin : environment.emptyForExport ,
            'Numero inscription Max': this.criteria.numeroInscriptionMax ? this.criteria.numeroInscriptionMax : environment.emptyForExport ,
        //'Etudiant': this.criteria.etudiant?.id ? this.criteria.etudiant?.id : environment.emptyForExport ,
        //'Etat inscription': this.criteria.etatInscription?.libelle ? this.criteria.etatInscription?.libelle : environment.emptyForExport ,
        //'Parcours': this.criteria.parcours?.libelle ? this.criteria.parcours?.libelle : environment.emptyForExport ,
        //'Groupe etude': this.criteria.groupeEtude?.libelle ? this.criteria.groupeEtude?.libelle : environment.emptyForExport ,
        //'Groupe type': this.criteria.groupeType?.libelle ? this.criteria.groupeType?.libelle : environment.emptyForExport ,
        //'Statut social': this.criteria.statutSocial?.libelle ? this.criteria.statutSocial?.libelle : environment.emptyForExport ,
        //'Interet etudiant': this.criteria.interetEtudiant?.libelle ? this.criteria.interetEtudiant?.libelle : environment.emptyForExport ,
        //'Niveau etude': this.criteria.niveauEtude?.libelle ? this.criteria.niveauEtude?.libelle : environment.emptyForExport ,
        //'Fonction': this.criteria.fonction?.libelle ? this.criteria.fonction?.libelle : environment.emptyForExport ,
        //'Quiz': this.criteria.quiz?.lib ? this.criteria.quiz?.lib : environment.emptyForExport ,
            'Note quiz niveau Min': this.criteria.noteQuizNiveauMin ? this.criteria.noteQuizNiveauMin : environment.emptyForExport ,
            'Note quiz niveau Max': this.criteria.noteQuizNiveauMax ? this.criteria.noteQuizNiveauMax : environment.emptyForExport ,
            'Quiz finished': this.criteria.quizFinished ? (this.criteria.quizFinished ? environment.trueValue : environment.falseValue) : environment.emptyForExport ,
            'Subscription finished': this.criteria.subscriptionFinished ? (this.criteria.subscriptionFinished ? environment.trueValue : environment.falseValue) : environment.emptyForExport ,
            'Date registration': this.criteria.dateRegistration ? this.criteria.dateRegistration : environment.emptyForExport ,
            'Datedebutinscription Min': this.criteria.datedebutinscriptionFrom ? this.datePipe.transform(this.criteria.datedebutinscriptionFrom , this.dateFormat) : environment.emptyForExport ,
            'Datedebutinscription Max': this.criteria.datedebutinscriptionTo ? this.datePipe.transform(this.criteria.datedebutinscriptionTo , this.dateFormat) : environment.emptyForExport ,
            'Datefininscription Min': this.criteria.datefininscriptionFrom ? this.datePipe.transform(this.criteria.datefininscriptionFrom , this.dateFormat) : environment.emptyForExport ,
            'Datefininscription Max': this.criteria.datefininscriptionTo ? this.datePipe.transform(this.criteria.datefininscriptionTo , this.dateFormat) : environment.emptyForExport ,
        //'Pack student': this.criteria.packStudent?.libelle ? this.criteria.packStudent?.libelle : environment.emptyForExport ,
        //'Skill': this.criteria.skill?.libelle ? this.criteria.skill?.libelle : environment.emptyForExport ,
            'Skype': this.criteria.skype ? this.criteria.skype : environment.emptyForExport ,
        }];
      }



    get items(): Array<InscriptionDto> {
        return this.service.items;
    }

    set items(value: Array<InscriptionDto>) {
        this.service.items = value;
    }

    get selections(): Array<InscriptionDto> {
        return this.service.selections;
    }

    set selections(value: Array<InscriptionDto>) {
        this.service.selections = value;
    }

    get item(): InscriptionDto {
        return this.service.item;
    }

    set item(value: InscriptionDto) {
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

    get criteria(): InscriptionCriteria {
        return this.service.criteria;
    }

    set criteria(value: InscriptionCriteria) {
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
