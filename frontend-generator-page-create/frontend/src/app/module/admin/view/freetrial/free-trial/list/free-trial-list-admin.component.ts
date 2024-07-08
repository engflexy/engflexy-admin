import {Component, OnInit} from '@angular/core';
import {FreeTrialAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialAdmin.service';
import {FreeTrialDto} from 'src/app/shared/model/freetrial/FreeTrial.model';
import {FreeTrialCriteria} from 'src/app/shared/criteria/freetrial/FreeTrialCriteria.model';


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


import {FreeTrialTeacherEmailTemplateDto} from 'src/app/shared/model/freetrial/FreeTrialTeacherEmailTemplate.model';
import {FreeTrialTeacherEmailTemplateAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialTeacherEmailTemplateAdmin.service';
import {FreeTrialTeacherWhatsTemplateDto} from 'src/app/shared/model/freetrial/FreeTrialTeacherWhatsTemplate.model';
import {FreeTrialTeacherWhatsTemplateAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialTeacherWhatsTemplateAdmin.service';
import {StatutFreeTrialDto} from 'src/app/shared/model/freetrial/StatutFreeTrial.model';
import {StatutFreeTrialAdminService} from 'src/app/shared/service/admin/freetrial/StatutFreeTrialAdmin.service';
import {FreeTrialConfigurationDto} from 'src/app/shared/model/freetrial/FreeTrialConfiguration.model';
import {FreeTrialConfigurationAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialConfigurationAdmin.service';
import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantAdminService} from 'src/app/shared/service/admin/inscription/EtudiantAdmin.service';
import {FreeTrialStudentEmailTemplateDto} from 'src/app/shared/model/freetrial/FreeTrialStudentEmailTemplate.model';
import {FreeTrialStudentEmailTemplateAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialStudentEmailTemplateAdmin.service';
import {FreeTrialDetailDto} from 'src/app/shared/model/freetrial/FreeTrialDetail.model';
import {FreeTrialDetailAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialDetailAdmin.service';
import {ProfDto} from 'src/app/shared/model/prof/Prof.model';
import {ProfAdminService} from 'src/app/shared/service/admin/prof/ProfAdmin.service';
import {NiveauEtudeDto} from 'src/app/shared/model/inscriptionref/NiveauEtude.model';
import {NiveauEtudeAdminService} from 'src/app/shared/service/admin/inscriptionref/NiveauEtudeAdmin.service';
import {FreeTrialStudentWhatsTemplateDto} from 'src/app/shared/model/freetrial/FreeTrialStudentWhatsTemplate.model';
import {FreeTrialStudentWhatsTemplateAdminService} from 'src/app/shared/service/admin/freetrial/FreeTrialStudentWhatsTemplateAdmin.service';


@Component({
  selector: 'app-free-trial-list-admin',
  templateUrl: './free-trial-list-admin.component.html'
})
export class FreeTrialListAdminComponent implements OnInit {

    protected fileName = 'FreeTrial';

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


     yesOrNoEmailTeacherSent: any[] = [];
     yesOrNoWhatsTeacherSent: any[] = [];
    profs: Array<ProfDto>;
    niveauEtudes: Array<NiveauEtudeDto>;
    freeTrialStudentWhatsTemplates: Array<FreeTrialStudentWhatsTemplateDto>;
    freeTrialStudentEmailTemplates: Array<FreeTrialStudentEmailTemplateDto>;
    freeTrialTeacherEmailTemplates: Array<FreeTrialTeacherEmailTemplateDto>;
    freeTrialTeacherWhatsTemplates: Array<FreeTrialTeacherWhatsTemplateDto>;
    freeTrialConfigurations: Array<FreeTrialConfigurationDto>;
    statutFreeTrials: Array<StatutFreeTrialDto>;


    constructor( private service: FreeTrialAdminService  , private freeTrialTeacherEmailTemplateService: FreeTrialTeacherEmailTemplateAdminService, private freeTrialTeacherWhatsTemplateService: FreeTrialTeacherWhatsTemplateAdminService, private statutFreeTrialService: StatutFreeTrialAdminService, private freeTrialConfigurationService: FreeTrialConfigurationAdminService, private etudiantService: EtudiantAdminService, private freeTrialStudentEmailTemplateService: FreeTrialStudentEmailTemplateAdminService, private freeTrialDetailService: FreeTrialDetailAdminService, private profService: ProfAdminService, private niveauEtudeService: NiveauEtudeAdminService, private freeTrialStudentWhatsTemplateService: FreeTrialStudentWhatsTemplateAdminService, @Inject(PLATFORM_ID) private platformId?) {
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
        this.loadProf();
        this.loadNiveauEtude();
        this.loadFreeTrialStudentWhatsTemplate();
        this.loadFreeTrialStudentEmailTemplate();
        this.loadFreeTrialTeacherEmailTemplate();
        this.loadFreeTrialTeacherWhatsTemplate();
        this.loadFreeTrialConfiguration();
        this.loadStatutFreeTrial();
        this.yesOrNoEmailTeacherSent =  [{label: 'EmailTeacherSent', value: null},{label: 'Oui', value: 1},{label: 'Non', value: 0}];
        this.yesOrNoWhatsTeacherSent =  [{label: 'WhatsTeacherSent', value: null},{label: 'Oui', value: 1},{label: 'Non', value: 0}];

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
            this.selections = new Array<FreeTrialDto>();
        }, error => console.log(error));
    }

    public onPage(event: any) {
        this.criteria.page = event.page;
        this.criteria.maxResults = event.rows;
        this.findPaginatedByCriteria();
    }

    public async edit(dto: FreeTrialDto) {
        this.service.findByIdWithAssociatedList(dto).subscribe(res => {
            this.item = res;
            console.log(res);
            this.editDialog = true;
        });

    }

    public async view(dto: FreeTrialDto) {
        this.service.findByIdWithAssociatedList(dto).subscribe(res => {
            this.item = res;
            this.viewDialog = true;
        });
    }

    public async openCreate() {
        this.item = new FreeTrialDto();
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
                    this.selections = new Array<FreeTrialDto>();
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


    public async delete(dto: FreeTrialDto) {

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

    public async duplicate(dto: FreeTrialDto) {
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

    public exportPdf(dto: FreeTrialDto): void {
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
            this.item = new FreeTrialDto();
        } , error => {
            console.log(error);
        });
    }

    public save() {
        this.service.save().subscribe(item => {
            if (item != null) {
                this.items.push({...item});
                this.createDialog = false;


                this.item = new FreeTrialDto();
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
            {field: 'reference', header: 'Reference'},
            {field: 'prof?.ref', header: 'Prof'},
            {field: 'niveauEtude?.libelle', header: 'Niveau etude'},
            {field: 'dateFreeTrial', header: 'Date free trial'},
            {field: 'link', header: 'Link'},
            {field: 'emailTeacherSent', header: 'Email teacher sent'},
            {field: 'emailTeacherSendingDate', header: 'Email teacher sending date'},
            {field: 'whatsTeacherSent', header: 'Whats teacher sent'},
            {field: 'whatsTeacherSendingDate', header: 'Whats teacher sending date'},
            {field: 'freeTrialStudentWhatsTemplate?.id', header: 'Free trial student whats template'},
            {field: 'freeTrialStudentEmailTemplate?.id', header: 'Free trial student email template'},
            {field: 'freeTrialTeacherEmailTemplate?.id', header: 'Free trial teacher email template'},
            {field: 'freeTrialTeacherWhatsTemplate?.id', header: 'Free trial teacher whats template'},
            {field: 'dateFreeTrialPremierRappel', header: 'Date free trial premier rappel'},
            {field: 'dateFreeTrialPremierDeuxiemeRappel', header: 'Date free trial premier deuxieme rappel'},
            {field: 'nombreStudentTotal', header: 'Nombre student total'},
            {field: 'freeTrialConfiguration?.id', header: 'Free trial configuration'},
            {field: 'nombreStudentAbonne', header: 'Nombre student abonne'},
            {field: 'nombreStudentPresent', header: 'Nombre student present'},
            {field: 'statutFreeTrial?.libelle', header: 'Statut free trial'},
        ];
    }


    public async loadProf(){
        this.profService.findAllOptimized().subscribe(profs => this.profs = profs, error => console.log(error))
    }
    public async loadNiveauEtude(){
        this.niveauEtudeService.findAllOptimized().subscribe(niveauEtudes => this.niveauEtudes = niveauEtudes, error => console.log(error))
    }
    public async loadFreeTrialStudentWhatsTemplate(){
        this.freeTrialStudentWhatsTemplateService.findAll().subscribe(freeTrialStudentWhatsTemplates => this.freeTrialStudentWhatsTemplates = freeTrialStudentWhatsTemplates, error => console.log(error))
    }
    public async loadFreeTrialStudentEmailTemplate(){
        this.freeTrialStudentEmailTemplateService.findAll().subscribe(freeTrialStudentEmailTemplates => this.freeTrialStudentEmailTemplates = freeTrialStudentEmailTemplates, error => console.log(error))
    }
    public async loadFreeTrialTeacherEmailTemplate(){
        this.freeTrialTeacherEmailTemplateService.findAll().subscribe(freeTrialTeacherEmailTemplates => this.freeTrialTeacherEmailTemplates = freeTrialTeacherEmailTemplates, error => console.log(error))
    }
    public async loadFreeTrialTeacherWhatsTemplate(){
        this.freeTrialTeacherWhatsTemplateService.findAll().subscribe(freeTrialTeacherWhatsTemplates => this.freeTrialTeacherWhatsTemplates = freeTrialTeacherWhatsTemplates, error => console.log(error))
    }
    public async loadFreeTrialConfiguration(){
        this.freeTrialConfigurationService.findAll().subscribe(freeTrialConfigurations => this.freeTrialConfigurations = freeTrialConfigurations, error => console.log(error))
    }
    public async loadStatutFreeTrial(){
        this.statutFreeTrialService.findAllOptimized().subscribe(statutFreeTrials => this.statutFreeTrials = statutFreeTrials, error => console.log(error))
    }


	public initDuplicate(res: FreeTrialDto) {
        if (res.freeTrialDetails != null) {
             res.freeTrialDetails.forEach(d => { d.freeTrial = null; d.id = null; });
        }
	}



   public prepareColumnExport(): void {
        this.exportData = this.items.map(e => {
            return {
                 'Reference': e.reference ,
                'Prof': e.prof?.ref ,
                'Niveau etude': e.niveauEtude?.libelle ,
                'Date free trial': this.datePipe.transform(e.dateFreeTrial , 'dd/MM/yyyy hh:mm'),
                 'Link': e.link ,
                'Email teacher sent': e.emailTeacherSent? 'Vrai' : 'Faux' ,
                'Email teacher sending date': this.datePipe.transform(e.emailTeacherSendingDate , 'dd/MM/yyyy hh:mm'),
                'Whats teacher sent': e.whatsTeacherSent? 'Vrai' : 'Faux' ,
                'Whats teacher sending date': this.datePipe.transform(e.whatsTeacherSendingDate , 'dd/MM/yyyy hh:mm'),
                'Free trial student whats template': e.freeTrialStudentWhatsTemplate?.id ,
                'Free trial student email template': e.freeTrialStudentEmailTemplate?.id ,
                'Free trial teacher email template': e.freeTrialTeacherEmailTemplate?.id ,
                'Free trial teacher whats template': e.freeTrialTeacherWhatsTemplate?.id ,
                'Date free trial premier rappel': this.datePipe.transform(e.dateFreeTrialPremierRappel , 'dd/MM/yyyy hh:mm'),
                'Date free trial premier deuxieme rappel': this.datePipe.transform(e.dateFreeTrialPremierDeuxiemeRappel , 'dd/MM/yyyy hh:mm'),
                 'Nombre student total': e.nombreStudentTotal ,
                'Free trial configuration': e.freeTrialConfiguration?.id ,
                 'Nombre student abonne': e.nombreStudentAbonne ,
                 'Nombre student present': e.nombreStudentPresent ,
                'Statut free trial': e.statutFreeTrial?.libelle ,
            }
        });

        this.criteriaData = [{
            'Reference': this.criteria.reference ? this.criteria.reference : environment.emptyForExport ,
        //'Prof': this.criteria.prof?.ref ? this.criteria.prof?.ref : environment.emptyForExport ,
        //'Niveau etude': this.criteria.niveauEtude?.libelle ? this.criteria.niveauEtude?.libelle : environment.emptyForExport ,
            'Date free trial Min': this.criteria.dateFreeTrialFrom ? this.datePipe.transform(this.criteria.dateFreeTrialFrom , this.dateFormat) : environment.emptyForExport ,
            'Date free trial Max': this.criteria.dateFreeTrialTo ? this.datePipe.transform(this.criteria.dateFreeTrialTo , this.dateFormat) : environment.emptyForExport ,
            'Link': this.criteria.link ? this.criteria.link : environment.emptyForExport ,
            'Email teacher sent': this.criteria.emailTeacherSent ? (this.criteria.emailTeacherSent ? environment.trueValue : environment.falseValue) : environment.emptyForExport ,
            'Email teacher sending date Min': this.criteria.emailTeacherSendingDateFrom ? this.datePipe.transform(this.criteria.emailTeacherSendingDateFrom , this.dateFormat) : environment.emptyForExport ,
            'Email teacher sending date Max': this.criteria.emailTeacherSendingDateTo ? this.datePipe.transform(this.criteria.emailTeacherSendingDateTo , this.dateFormat) : environment.emptyForExport ,
            'Whats teacher sent': this.criteria.whatsTeacherSent ? (this.criteria.whatsTeacherSent ? environment.trueValue : environment.falseValue) : environment.emptyForExport ,
            'Whats teacher sending date Min': this.criteria.whatsTeacherSendingDateFrom ? this.datePipe.transform(this.criteria.whatsTeacherSendingDateFrom , this.dateFormat) : environment.emptyForExport ,
            'Whats teacher sending date Max': this.criteria.whatsTeacherSendingDateTo ? this.datePipe.transform(this.criteria.whatsTeacherSendingDateTo , this.dateFormat) : environment.emptyForExport ,
        //'Free trial student whats template': this.criteria.freeTrialStudentWhatsTemplate?.id ? this.criteria.freeTrialStudentWhatsTemplate?.id : environment.emptyForExport ,
        //'Free trial student email template': this.criteria.freeTrialStudentEmailTemplate?.id ? this.criteria.freeTrialStudentEmailTemplate?.id : environment.emptyForExport ,
        //'Free trial teacher email template': this.criteria.freeTrialTeacherEmailTemplate?.id ? this.criteria.freeTrialTeacherEmailTemplate?.id : environment.emptyForExport ,
        //'Free trial teacher whats template': this.criteria.freeTrialTeacherWhatsTemplate?.id ? this.criteria.freeTrialTeacherWhatsTemplate?.id : environment.emptyForExport ,
            'Date free trial premier rappel Min': this.criteria.dateFreeTrialPremierRappelFrom ? this.datePipe.transform(this.criteria.dateFreeTrialPremierRappelFrom , this.dateFormat) : environment.emptyForExport ,
            'Date free trial premier rappel Max': this.criteria.dateFreeTrialPremierRappelTo ? this.datePipe.transform(this.criteria.dateFreeTrialPremierRappelTo , this.dateFormat) : environment.emptyForExport ,
            'Date free trial premier deuxieme rappel Min': this.criteria.dateFreeTrialPremierDeuxiemeRappelFrom ? this.datePipe.transform(this.criteria.dateFreeTrialPremierDeuxiemeRappelFrom , this.dateFormat) : environment.emptyForExport ,
            'Date free trial premier deuxieme rappel Max': this.criteria.dateFreeTrialPremierDeuxiemeRappelTo ? this.datePipe.transform(this.criteria.dateFreeTrialPremierDeuxiemeRappelTo , this.dateFormat) : environment.emptyForExport ,
            'Nombre student total Min': this.criteria.nombreStudentTotalMin ? this.criteria.nombreStudentTotalMin : environment.emptyForExport ,
            'Nombre student total Max': this.criteria.nombreStudentTotalMax ? this.criteria.nombreStudentTotalMax : environment.emptyForExport ,
        //'Free trial configuration': this.criteria.freeTrialConfiguration?.id ? this.criteria.freeTrialConfiguration?.id : environment.emptyForExport ,
            'Nombre student abonne Min': this.criteria.nombreStudentAbonneMin ? this.criteria.nombreStudentAbonneMin : environment.emptyForExport ,
            'Nombre student abonne Max': this.criteria.nombreStudentAbonneMax ? this.criteria.nombreStudentAbonneMax : environment.emptyForExport ,
            'Nombre student present Min': this.criteria.nombreStudentPresentMin ? this.criteria.nombreStudentPresentMin : environment.emptyForExport ,
            'Nombre student present Max': this.criteria.nombreStudentPresentMax ? this.criteria.nombreStudentPresentMax : environment.emptyForExport ,
        //'Statut free trial': this.criteria.statutFreeTrial?.libelle ? this.criteria.statutFreeTrial?.libelle : environment.emptyForExport ,
        }];
      }



    get items(): Array<FreeTrialDto> {
        return this.service.items;
    }

    set items(value: Array<FreeTrialDto>) {
        this.service.items = value;
    }

    get selections(): Array<FreeTrialDto> {
        return this.service.selections;
    }

    set selections(value: Array<FreeTrialDto>) {
        this.service.selections = value;
    }

    get item(): FreeTrialDto {
        return this.service.item;
    }

    set item(value: FreeTrialDto) {
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

    get criteria(): FreeTrialCriteria {
        return this.service.criteria;
    }

    set criteria(value: FreeTrialCriteria) {
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
