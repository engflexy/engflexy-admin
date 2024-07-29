import {Component, OnInit, ChangeDetectorRef, ViewChild} from '@angular/core';
import {ScheduleProfCollaboratorService} from '../../../../shared/service/collaborator/prof/ScheduleProfCollaborator.service';
import {ScheduleProfDto} from '../../../../shared/model/prof/ScheduleProf.model';
import {ScheduleProfCriteria} from '../../../../shared/criteria/prof/ScheduleProfCriteria.model';


// @ts-ignore
import {ConfirmationService, MessageService,MenuItem} from 'primeng/api';
import {FileTempDto} from '../../../../zynerator/dto/FileTempDto.model';
import {DatePipe} from '@angular/common';
import {Router} from '@angular/router';
import {Inject, Injectable, PLATFORM_ID} from '@angular/core';

import {environment} from '../../../../../environments/environment';

import {RoleService} from '../../../../zynerator/security/shared/service/Role.service';
import {AbstractService} from '../../../../zynerator/service/AbstractService';
import {BaseDto} from '../../../../zynerator/dto/BaseDto.model';
import {BaseCriteria} from '../../../../zynerator/criteria/BaseCriteria.model';
import {StringUtilService} from '../../../../zynerator/util/StringUtil.service';
import {ServiceLocator} from '../../../../zynerator/service/ServiceLocator';

import {AuthService} from '../../../../zynerator/security/shared/service/Auth.service';
import {ExportService} from '../../../../zynerator/util/Export.service';


import {GroupeEtudiantDto} from '../../../../shared/model/grpe/GroupeEtudiant.model';
import {GroupeEtudiantCollaboratorService} from '../../../../shared/service/collaborator/grpe/GroupeEtudiantCollaborator.service';
import {CoursDto} from '../../../../shared/model/course/Cours.model';
import {CoursCollaboratorService} from '../../../../shared/service/collaborator/course/CoursCollaborator.service';
import {ProfDto} from '../../../../shared/model/prof/Prof.model';
import {ProfCollaboratorService} from '../../../../shared/service/collaborator/prof/ProfCollaborator.service';

import {CalendarOptions, EventClickArg} from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import interactionPlugin from '@fullcalendar/interaction';
import {FullCalendarComponent} from '@fullcalendar/angular';
import {ScheduleDto} from '../../../../zynerator/dto/ScheduleDto.model';

@Component({
    selector: 'app-schedule-prof-list-collaborator',
    standalone: true,
    templateUrl: './schedule-prof-list-collaborator.component.html'
})
export class ScheduleProfListCollaboratorComponent implements OnInit {

    protected fileName = 'ScheduleProf';

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


    yesOrNoCourseFinished: any[] = [];
    groupeEtudiants: Array<GroupeEtudiantDto>;
    profs: Array<ProfDto>;
    courss: Array<CoursDto>;
    schedules: ScheduleDto[];
    // @ts-ignore
    schedule = new ScheduleDto();

    public events: Array<any> = new Array<any>();

    @ViewChild('calendar') calendarComponent: FullCalendarComponent;
    showEditDialogContent = false ;
    createDialogVisible = false;
    calendarOptions: CalendarOptions = {
        plugins: [timeGridPlugin, dayGridPlugin, interactionPlugin],
        headerToolbar: {
            left: 'prev,today,next',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        slotLabelFormat: {
            hour: '2-digit',
            minute: '2-digit',
            omitZeroMinute: false,
            hour12: false,
        },
        initialView: 'timeGridWeek',
        weekends: true,
        editable: true, // Enable event dragging
        eventResizableFromStart: true, // Enable resizing from the start
        selectable: true,
        selectMirror: true,
        dayMaxEvents: true,
        datesSet: (info) => {
            const start = info.start;
            const end = info.end;
            this.handleDateSet(start, end);
        },
        eventClick: this.handleEventClick.bind(this),
        dateClick: this.handleDateClick.bind(this),
    };



    constructor( private service: ScheduleProfCollaboratorService  , private changeDetectorRef: ChangeDetectorRef  , private groupeEtudiantService: GroupeEtudiantCollaboratorService, private coursService: CoursCollaboratorService, private profService: ProfCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {
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
        this.loadGroupeEtudiant();
        this.loadProf();
        this.loadCours();
        this.yesOrNoCourseFinished =  [{label: 'CourseFinished', value: null},{label: 'Oui', value: 1},{label: 'Non', value: 0}];

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
            this.selections = new Array<ScheduleProfDto>();
        }, error => console.log(error));
    }

    public onPage(event: any) {
        this.criteria.page = event.page;
        this.criteria.maxResults = event.rows;
        this.findPaginatedByCriteria();
    }

    public async edit(dto: ScheduleProfDto) {
        this.service.findByIdWithAssociatedList(dto).subscribe(res => {
            this.item = res;
            console.log(res);
            this.editDialog = true;
        });

    }

    public async view(dto: ScheduleProfDto) {
        this.service.findByIdWithAssociatedList(dto).subscribe(res => {
            this.item = res;
            this.viewDialog = true;
        });
    }

    public async openCreate() {
        this.item = new ScheduleProfDto();
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
                    this.selections = new Array<ScheduleProfDto>();
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


    public async delete(dto: ScheduleProfDto) {

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

    public async duplicate(dto: ScheduleProfDto) {
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

    public exportPdf(dto: ScheduleProfDto): void {
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
            this.item = new ScheduleProfDto();
            const event = {
                title: data.subject,
                start: new Date(data.startTime),
                end: new Date(data.endTime)
            };
            this.calendarComponent.getApi().addEvent(event);
            this.calendarComponent.getApi().refetchEvents(); // Refresh the calendar
            this.changeDetectorRef.markForCheck();
        } , error => {
            console.log(error);
        });
    }

    public save() {
        this.service.save().subscribe(item => {
            if (item != null) {
                this.items.push({...item});
                this.createDialog = false;


                this.item = new ScheduleProfDto();
                const event = {
                    title: item.subject,
                    start: new Date(item.startTime),
                    end: new Date(item.endTime)
                };
                this.calendarComponent.getApi().addEvent(event);
                this.calendarComponent.getApi().refetchEvents(); // Refresh the calendar
                this.changeDetectorRef.markForCheck();
            } else {
                this.messageService.add({severity: 'error', summary: 'Erreurs', detail: 'Element existant'});
            }
        }, error => {
            console.log(error);
        });
    }

// add

    private handleDateSet(start: Date, end: Date) {
        const startDate = new Date(start).toISOString().replace('Z', '');
        const endDate = new Date(end).toISOString().replace('Z', '');
        this.service.findSchedule(startDate, endDate)
            .subscribe(response => {
                this.schedules = response;
                this.updateFullCalendarEvents();
            });
        console.log('schedules', this.schedules);
    }

    updateFullCalendarEvents(viewType: string = 'timeGridWeek'): void {
        this.calendarOptions.initialView = viewType;
        this.events = this.schedules.map((item) => ({
            id: item.id,
            title: item.subject,
            start: new Date(item.startTime),
            end: new Date(item.endTime),
        }));
        this.calendarOptions.events = this.events;
        this.calendarComponent.getApi().refetchEvents();
    }

    handleDateClick(info: any) {
        const clickedDate = info.date;
        this.item.startTime = new Date(clickedDate);
        this.item.endTime = new Date(this.item.startTime.getTime() + 60 * 60 * 1000);
        this.createDialog = true;
        this.createDialogVisible = true;
        this.calendarComponent.getApi().refetchEvents();
        this.changeDetectorRef.markForCheck();
    }

    handleEventClick(clickInfo: EventClickArg) {
        const eventTitle = clickInfo.event.title;
        const clickedDate = clickInfo.event.start;
        const itemIndex = this.schedules.findIndex(item => item.subject === eventTitle);
        if (itemIndex !== -1) {
            this.item.id = Number(clickInfo.event.id);
            this.item.subject = clickInfo.event.title;
            this.item.startTime = new Date(clickedDate);
            this.item.endTime = new Date(this.item.startTime.getTime() + 60 * 60 * 1000);
            this.showEditDialogContent = true;
            this.editDialog = true;
        }
        this.calendarComponent.getApi().refetchEvents();
        this.changeDetectorRef.markForCheck();
    }

    public prepareEdit() {
        this.item.startTime = this.service.format(this.item.startTime);
        this.item.endTime = this.service.format(this.item.endTime);
    }




    public initCol() {
        this.cols = [
            {field: 'subject', header: 'Subject'},
            {field: 'startTime', header: 'Start time'},
            {field: 'endTime', header: 'End time'},
            {field: 'ref', header: 'Ref'},
            {field: 'groupeEtudiant?.id', header: 'Groupe etudiant'},
            {field: 'prof?.ref', header: 'Prof'},
            {field: 'cours?.libelle', header: 'Cours'},
            {field: 'grpName', header: 'Grp name'},
            {field: 'profName', header: 'Prof name'},
            {field: 'profsId', header: 'Profs id'},
            {field: 'courseFinished', header: 'Course finished'},
        ];
    }


    public async loadGroupeEtudiant(){
        this.groupeEtudiantService.findAll().subscribe(groupeEtudiants => this.groupeEtudiants = groupeEtudiants, error => console.log(error))
    }
    public async loadProf(){
        this.profService.findAllOptimized().subscribe(profs => this.profs = profs, error => console.log(error))
    }
    public async loadCours(){
        this.coursService.findAllOptimized().subscribe(courss => this.courss = courss, error => console.log(error))
    }


	public initDuplicate(res: ScheduleProfDto) {
	}



   public prepareColumnExport(): void {
        this.exportData = this.items.map(e => {
            return {
                 'Subject': e.subject ,
                'Start time': this.datePipe.transform(e.startTime , 'dd/MM/yyyy hh:mm'),
                'End time': this.datePipe.transform(e.endTime , 'dd/MM/yyyy hh:mm'),
                 'Ref': e.ref ,
                'Groupe etudiant': e.groupeEtudiant?.id ,
                'Prof': e.prof?.ref ,
                'Cours': e.cours?.libelle ,
                 'Grp name': e.grpName ,
                 'Prof name': e.profName ,
                 'Profs id': e.profsId ,
                'Course finished': e.courseFinished? 'Vrai' : 'Faux' ,
            }
        });

        this.criteriaData = [{
            'Subject': this.criteria.subject ? this.criteria.subject : environment.emptyForExport ,
            'Start time Min': this.criteria.startTimeFrom ? this.datePipe.transform(this.criteria.startTimeFrom , this.dateFormat) : environment.emptyForExport ,
            'Start time Max': this.criteria.startTimeTo ? this.datePipe.transform(this.criteria.startTimeTo , this.dateFormat) : environment.emptyForExport ,
            'End time Min': this.criteria.endTimeFrom ? this.datePipe.transform(this.criteria.endTimeFrom , this.dateFormat) : environment.emptyForExport ,
            'End time Max': this.criteria.endTimeTo ? this.datePipe.transform(this.criteria.endTimeTo , this.dateFormat) : environment.emptyForExport ,
            'Ref': this.criteria.ref ? this.criteria.ref : environment.emptyForExport ,
        //'Groupe etudiant': this.criteria.groupeEtudiant?.id ? this.criteria.groupeEtudiant?.id : environment.emptyForExport ,
        //'Prof': this.criteria.prof?.ref ? this.criteria.prof?.ref : environment.emptyForExport ,
        //'Cours': this.criteria.cours?.libelle ? this.criteria.cours?.libelle : environment.emptyForExport ,
            'Grp name': this.criteria.grpName ? this.criteria.grpName : environment.emptyForExport ,
            'Prof name': this.criteria.profName ? this.criteria.profName : environment.emptyForExport ,
            'Profs id Min': this.criteria.profsIdMin ? this.criteria.profsIdMin : environment.emptyForExport ,
            'Profs id Max': this.criteria.profsIdMax ? this.criteria.profsIdMax : environment.emptyForExport ,
            //'Course finished': this.criteria.courseFinished ? (this.criteria.courseFinished ? environment.trueValue : environment.falseValue) : environment.emptyForExport ,
        }];
      }



    get items(): Array<ScheduleProfDto> {
        return this.service.items;
    }

    set items(value: Array<ScheduleProfDto>) {
        this.service.items = value;
    }

    get selections(): Array<ScheduleProfDto> {
        return this.service.selections;
    }

    set selections(value: Array<ScheduleProfDto>) {
        this.service.selections = value;
    }

    get item(): ScheduleProfDto {
        return this.service.item;
    }

    set item(value: ScheduleProfDto) {
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

    get criteria(): ScheduleProfCriteria {
        return this.service.criteria;
    }

    set criteria(value: ScheduleProfCriteria) {
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
