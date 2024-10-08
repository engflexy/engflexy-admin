import {Component, Inject, OnInit, PLATFORM_ID} from '@angular/core';
import {MatDialogRef} from "@angular/material/dialog";
import {DatePipe} from "@angular/common";

import {FuseAlertService} from "../../../../../@fuse/components/alert";
import {Router} from '@angular/router';


import {environment} from '../../../../../environments/environment';

import {RoleService} from '../../../../zynerator/security/shared/service/Role.service';
import {StringUtilService} from '../../../../zynerator/util/StringUtil.service';

import {translate} from "@ngneat/transloco";


import {SalaryAdminService} from '../../../../shared/service/admin/salary/SalaryAdmin.service';
import {SalaryDto} from '../../../../shared/model/salary/Salary.model';
import {SalaryCriteria} from '../../../../shared/criteria/salary/SalaryCriteria.model';
import {ProfDto} from '../../../../shared/model/prof/Prof.model';
import {ProfAdminService} from '../../../../shared/service/admin/prof/ProfAdmin.service';
import {compareObjects} from "../../../../shared/constant/global-funsctions";

@Component({
    selector: 'app-collaborator-salary-create-admin',
    templateUrl: './create-salary.component.html'
})
export class CreateSalaryComponent implements OnInit {

    protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    private _activeTab = 0;

    months: { month: number, name: string }[] = [
        {month: 0, name: 'January'},
        {month: 1, name: 'February'},
        {month: 2, name: 'March'},
        {month: 3, name: 'April'},
        {month: 4, name: 'May'},
        {month: 5, name: 'June'},
        {month: 6, name: 'July'},
        {month: 7, name: 'August'},
        {month: 8, name: 'September'},
        {month: 9, name: 'October'},
        {month: 10, name: 'November'},
        {month: 11, name: 'December'}
    ];

    years: number[] = [2021, 2022, 2023, 2024, 2025, 2026];


    _profsFilter: ProfDto[];

    private _validSalaryCode = true;
    private _validProfRef = true;

    constructor(public dialogRef: MatDialogRef<CreateSalaryComponent>, private alert: FuseAlertService, private service: SalaryAdminService, private profService: ProfAdminService, private stringUtilService: StringUtilService, @Inject(PLATFORM_ID) private platformId?) {

    }

    ngOnInit(): void {
        this.profService.findAll().subscribe((data) => {
            this.profs = data;
            this._profsFilter = [...this.profs]
        });
    }

    displayProf(item: ProfDto): string {
        return item && item.fullName ? item.fullName : "";

    }

    filterProf(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._profsFilter = this.profs.filter(s =>
                s.ref?.toLowerCase()?.includes(value)
            )
        } else {
            this._profsFilter = this.profs
        }
    }


    public save(): void {
        this.submitted = true;
        this.validateForm();
        if (this.errorMessages.length === 0) {
            this.saveWithShowOption(false);
        } else {
            this.alert.show('info', 'something went wrong!, please try again.');
        }
    }

    // public saveWithShowOption(showList: boolean) {
    //     this.service.save().subscribe(item => {
    //         if (item != null) {
    //             this.items.push({...item});
    //             console.log(item.mois);
    //             this.createDialog = false;
    //             this.submitted = false;
    //             this.item = new SalaryDto();
    //
    //         } else {
    //             this.alert.show('info', 'something went wrong!, please try again.');
    //         }
    //
    //     }, error => {
    //         console.log(error);
    //     });
    // }

    public saveWithShowOption(showList: boolean) {
        if (this.isItemValid()) {
            this.service.save().subscribe(
                item => {
                    if (item != null) {
                        this.item = new SalaryDto();
                        this.alert.show('success', 'Salary saved successfully.');
                        this.dialogRef.close(item)
                    } else {
                        this.alert.show('error', 'Failed to save salary. Please try again.');
                    }
                },
                error => {
                    console.log(error);
                    this.alert.show('error', 'An error occurred while saving. Please try again.');
                }
            );
        } else {
            this.alert.show('error', 'Please fill in all required fields.');
        }
    }

    private isItemValid(): boolean {
        return this.item.code != null && this.item.code.trim() !== '' &&
            this.item.prof != null &&
            this.item.mois != null &&
            this.item.annee != null &&
            this.item.nbrSessionMensuel != null;
    }


    public hideCreateDialog() {
        this.createDialog = false;
        this.submitted = false;
        this.dialogRef.close();
        this.errorMessages = [];
    }


    public setValidation(value: boolean) {
        this.validSalaryCode = value;
    }


    public validateForm(): void {
        this.errorMessages = new Array<string>();
        this.validateSalaryCode();
    }

    public validateSalaryCode() {
        if (this.stringUtilService.isEmpty(this.item.code)) {
            this.errorMessages.push('Code non valide');
            this.validSalaryCode = false;
        } else {
            this.validSalaryCode = true;
        }
    }


    get prof(): ProfDto {
        return this.profService.item;
    }

    set prof(value: ProfDto) {
        this.profService.item = value;
    }

    get profs(): Array<ProfDto> {
        return this.profService.items;
    }

    set profs(value: Array<ProfDto>) {
        this.profService.items = value;
    }

    get createProfDialog(): boolean {
        return this.profService.createDialog;
    }

    set createProfDialog(value: boolean) {
        this.profService.createDialog = value;
    }


    get validSalaryCode(): boolean {
        return this._validSalaryCode;
    }

    set validSalaryCode(value: boolean) {
        this._validSalaryCode = value;
    }

    get validProfRef(): boolean {
        return this._validProfRef;
    }

    set validProfRef(value: boolean) {
        this._validProfRef = value;
    }


    get items(): Array<SalaryDto> {
        return this.service.items;
    }

    set items(value: Array<SalaryDto>) {
        this.service.items = value;
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

    get criteria(): SalaryCriteria {
        return this.service.criteria;
    }

    set criteria(value: SalaryCriteria) {
        this.service.criteria = value;
    }

    get dateFormat() {
        return environment.dateFormatCreate;
    }

    get dateFormatColumn() {
        return environment.dateFormatCreate;
    }

    get submitted(): boolean {
        return this._submitted;
    }

    set submitted(value: boolean) {
        this._submitted = value;
    }

    get errorMessages(): string[] {
        if (this._errorMessages == null) {
            this._errorMessages = new Array<string>();
        }
        return this._errorMessages;
    }

    set errorMessages(value: string[]) {
        this._errorMessages = value;
    }

    get validate(): boolean {
        return this.service.validate;
    }

    set validate(value: boolean) {
        this.service.validate = value;
    }


    get activeTab(): number {
        return this._activeTab;
    }

    set activeTab(value: number) {
        this._activeTab = value;
    }

    protected readonly translate = translate;
    protected readonly compareObjects = compareObjects;
}
