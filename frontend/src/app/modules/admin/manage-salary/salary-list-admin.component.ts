import {SalaryAdminService} from '../../../shared/service/admin/salary/SalaryAdmin.service';
import {SalaryDto} from '../../../shared/model/salary/Salary.model';
import {SalaryCriteria} from '../../../shared/criteria/salary/SalaryCriteria.model';


import {Component, Inject, OnInit, PLATFORM_ID} from '@angular/core';
import {MatButtonModule} from "@angular/material/button";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatIconModule} from "@angular/material/icon";
import {MatInputModule} from "@angular/material/input";
import {MatPaginatorModule, PageEvent} from "@angular/material/paginator";
import {DatePipe, NgClass, NgForOf, NgIf,CommonModule} from "@angular/common";


import {FuseConfirmationService} from "../../../../@fuse/services/confirmation";
import {FuseAlertService} from "../../../../@fuse/components/alert";


import {TYPE_INSCRIPTION} from "../../../shared/utils/enums";
import {PaginatedList} from "../../../zynerator/dto/PaginatedList.model";
import {MatDialog} from "@angular/material/dialog";
import {MatSelectModule} from "@angular/material/select";
import {FormsModule} from "@angular/forms";


import {ProfDto} from '../../../shared/model/prof/Prof.model';
import {ProfAdminService} from '../../../shared/service/admin/prof/ProfAdmin.service';
import {RoleService} from "../../../zynerator/security/shared/service/Role.service";
import {Router} from "@angular/router";
import {StringUtilService} from "../../../zynerator/util/StringUtil.service";
import {AuthService} from "../../../zynerator/security/shared/service/Auth.service";
import {ExportService} from "../../../zynerator/util/Export.service";
import {environment} from "../../../../environments/environment";
import {CreateSalaryComponent} from "./create-salary/create-salary.component";


@Component({
    selector: 'app-salary-list-admin',
    standalone: true,
    imports: [
        MatButtonModule,
        MatInputModule,
        MatSelectModule,
        MatIconModule,
        FormsModule,
        MatPaginatorModule,
        NgForOf
    ],
    templateUrl: './salary-list-admin.component.html'
})
export class SalaryListAdminComponent implements OnInit {


    pageable: SalaryCriteria = new SalaryCriteria();

    protected fileName = 'Salary';

    protected findByCriteriaShow = false;
    protected cols: any[] = [];
    protected exportData: any[] = [];
    protected criteriaData: any[] = [];
    protected _totalRecords = 0;
    private _pdfName: string;


    protected datePipe: DatePipe;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    protected authService: AuthService;
    protected exportService: ExportService;
    protected excelFile: File | undefined;
    protected enableSecurity = false;


    yesOrNoPayer: any[] = [];
    profs: Array<ProfDto>;


    constructor( private service: SalaryAdminService  , private profService: ProfAdminService,private fuseConfirmation: FuseConfirmationService,
                 private messageService: FuseAlertService,private _matDialog: MatDialog, @Inject(PLATFORM_ID) private platformId?) {

    }

    ngOnInit(): void {
        this.findPaginatedByCriteria();
        this.initCol();
        this.loadProf();
        this.yesOrNoPayer =  [{label: 'Payer', value: null},{label: 'Oui', value: 1},{label: 'Non', value: 0}];

    }

    public findPaginatedByCriteria() {
        this.service.findPaginatedByCriteria(this.criteria).subscribe(paginatedItems => {
            this.items = paginatedItems.list;
            this.totalRecords = paginatedItems.dataSize;
            this.selections = new Array<SalaryDto>();
        }, error => console.log(error));
    }



    create() {
        const dialog = this._matDialog.open(CreateSalaryComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 400px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });
        dialog.afterClosed().subscribe(res => {
            if (res != null) this.items.unshift({...res})
        })
    }

    public onPage(event: any) {
        this.criteria.page = event.page;
        this.criteria.maxResults = event.rows;
        this.findPaginatedByCriteria();
    }

    public async edit(dto: SalaryDto) {
        this.service.findByIdWithAssociatedList(dto).subscribe(res => {
            this.item = res;
            console.log(res);
            this.editDialog = true;
        });

    }

    public async view(dto: SalaryDto) {
        this.service.findByIdWithAssociatedList(dto).subscribe(res => {
            this.item = res;
            this.viewDialog = true;
        });
    }

    public async openCreate() {
        this.item = new SalaryDto();
        this.createDialog = true;
    }

    public async deleteMultiple() {
        this.fuseConfirmation.open({
            title: 'Confirmation',
            message: 'Voulez-vous supprimer ces éléments ?',
            icon: {
                show: true,
                name: 'heroicons_outline:exclamation-triangle',
                color: 'warn'
            },
            actions: {
                confirm: {
                    show: true,
                    label: 'Confirmer',
                    color: 'warn'
                },
                cancel: {
                    show: true,
                    label: 'Annuler'
                }
            },
            dismissible: true
        }).afterClosed().subscribe((result) => {
            if (result === 'confirmed') {
                this.service.deleteMultiple().subscribe(() => {
                    this.items = this.items.filter(item => !this.selections.includes(item));
                    this.selections = new Array<SalaryDto>();
                    this.messageService.show('success', 'Les éléments sélectionnés ont été supprimés!', 3000);
                }, error => console.log(error));
            }
        });
    }



    public isSelectionDisabled(): boolean {
        return this.selections == null || this.selections.length == 0;
    }


    public async delete(dto: SalaryDto) {

        this.fuseConfirmation.open({
            title: 'Confirmation',
            message: 'Voulez-vous supprimer cet élément ?',
            icon: {
                show: true,
                name: 'heroicons_outline:exclamation-triangle',
                color: 'warn'
            },
            actions: {
                confirm: {
                    show: true,
                    label: 'Confirmer',
                    color: 'warn'
                },
                cancel: {
                    show: true,
                    label: 'Annuler'
                }
            },
            dismissible: true
        }).afterClosed().subscribe((result) => {
            if (result === 'confirmed') {
                this.service.delete(dto).subscribe(
                    status => {
                        if (status > 0) {
                            const position = this.items.indexOf(dto);
                            if (position > -1) {
                                this.items.splice(position, 1);
                            }
                            this.messageService.show('Succès', 'Element Supprimé', 3000);
                        }
                    },
                    error => console.log(error)
                );
            }
        });

    }

    public async duplicate(dto: SalaryDto) {
        this.service.findByIdWithAssociatedList(dto).subscribe(
            res => {
                this.initDuplicate(res);
                this.item = res;
                this.item.id = null;
                this.createDialog = true;
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
            this.item = new SalaryDto();
        } , error => {
            console.log(error);
        });
    }

    public save() {
        this.service.save().subscribe(item => {
            if (item != null) {
                this.items.push({...item});
                this.createDialog = false;


                this.item = new SalaryDto();
            } else {
                this.messageService.show('Erreur','Element Exist!',3000);
            }
        }, error => {
            console.log(error);
        });
    }

// add


    public initCol() {
        this.cols = [
            {field: 'code', header: 'Code'},
            {field: 'prof?.ref', header: 'Prof'},
            {field: 'mois', header: 'Mois'},
            {field: 'annee', header: 'Annee'},
            {field: 'nbrSessionMensuel', header: 'Nbr session mensuel'},
            {field: 'payer', header: 'Payer'},
            {field: 'totalPayment', header: 'Total payment'},
            {field: 'totalBonusClassAverage', header: 'Total bonus class average'},
            {field: 'totalBonusWorkload', header: 'Total bonus workload'},
        ];
    }


    public async loadProf(){
        this.profService.findAllOptimized().subscribe(profs => this.profs = profs, error => console.log(error))
    }


    public initDuplicate(res: SalaryDto) {
    }


    get items(): Array<SalaryDto> {
        return this.service.items;
    }

    set items(value: Array<SalaryDto>) {
        this.service.items = value;
    }

    get selections(): Array<SalaryDto> {
        return this.service.selections;
    }

    set selections(value: Array<SalaryDto>) {
        this.service.selections = value;
    }

    get item(): SalaryDto {
        return this.service.item;
    }

    set item(value: SalaryDto) {
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

    get criteria(): SalaryCriteria {
        return this.service.criteria;
    }

    set criteria(value: SalaryCriteria) {
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
