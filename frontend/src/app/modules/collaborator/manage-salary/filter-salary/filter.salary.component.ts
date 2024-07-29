import {Component, OnInit} from '@angular/core';
import {MatDialogRef} from "@angular/material/dialog";
import {AuthService} from "../../../../zynerator/security/shared/service/Auth.service";
import {FuseAlertService} from "../../../../../@fuse/components/alert";
import {ParcoursCollaboratorService} from "../../../../shared/service/collaborator/course/ParcoursCollaborator.service";
import {ProfDto} from "../../../../shared/model/prof/Prof.model";
import {SalaryCollaboratorService} from "../../../../shared/service/collaborator/salary/SalaryCollaborator.service";
import {SalaryDto} from "../../../../shared/model/salary/Salary.model";
import {ProfAdminService} from "../../../../shared/service/admin/prof/ProfAdmin.service";
import {StringUtilService} from "../../../../zynerator/util/StringUtil.service";
import {SalaryCriteria} from "../../../../shared/criteria/salary/SalaryCriteria.model";
import {PaginatedList} from "../../../../zynerator/dto/PaginatedList.model";
import {SalaryAdminService} from "../../../../shared/service/admin/salary/SalaryAdmin.service";

@Component({
    selector: 'app-collaborator-filter-salary',
    templateUrl: './filter-salary.component.html'
})
export class FilterSalaryComponent implements OnInit {
    _profs: ProfDto[];
    salaries: SalaryDto[];
    protected _submitted = false;
    protected _errorMessages = new Array<string>();

    private _validSalaryCode = true;
    private _validProfRef = true;

    pageable = new SalaryCriteria();

    months: { month: number, name: string }[] = [
        {month: 1, name: 'January'},
        {month: 2, name: 'February'},
        {month: 3, name: 'March'},
        {month: 4, name: 'April'},
        {month: 5, name: 'May'},
        {month: 6, name: 'June'},
        {month: 7, name: 'July'},
        {month: 8, name: 'August'},
        {month: 9, name: 'September'},
        {month: 10, name: 'October'},
        {month: 11, name: 'November'},
        {month: 12, name: 'December'}
    ];
    years: number[] = [2021, 2022, 2023, 2024, 2025, 2026];
    _statuses: { label: string, value: boolean }[] = [
        {label: 'PAID', value: true},
        {label: 'Pending', value: false}
    ];

    constructor(
        private auth: AuthService,
        private alert: FuseAlertService,
        private parcoursService: ParcoursCollaboratorService,
        public refDialog: MatDialogRef<FilterSalaryComponent>,
        private service: SalaryCollaboratorService,
        private serviceSalary: SalaryAdminService,
        private profAdminService: ProfAdminService,
        private stringUtilService: StringUtilService,
    ) {
    }

    get salary(): SalaryDto {
        return this.service.item;
    }

    set salary(value: SalaryDto) {
        this.service.item = value;
    }


    get profs(): Array<ProfDto> {
        return this.profAdminService.items;
    }

    set profs(value: Array<ProfDto>) {
        this.profAdminService.items = value;
    }

    get submitted(): boolean {
        return this._submitted;
    }

    set submitted(value: boolean) {
        this._submitted = value;
    }

    get criteria(): PaginatedList<SalaryDto> {
        return this.service.criteriaList;
    }

    set criteria(value: PaginatedList<SalaryDto>) {
        this.service.criteriaList = value;
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

    get validSalaryCode(): boolean {
        return this._validSalaryCode;
    }

    set validSalaryCode(value: boolean) {
        this._validSalaryCode = value;
    }

    get item(): SalaryDto {
        return this.service.item;
    }

    set item(value: SalaryDto) {
        this.service.item = value;
    }

    public validateForm(): void {
        this.errorMessages = new Array<string>();
        // this.validateSalaryCode();
    }


    public validateSalaryCode() {
        if (this.stringUtilService.isEmpty(this.item.code)) {
            this.errorMessages.push('Code non valide');
            this.validSalaryCode = false;
        } else {
            this.validSalaryCode = true;
        }
    }

    ngOnInit() {
        this.profAdminService.findAllOptimized().subscribe(res => {
            this._profs = res;
            this.profs = [...res];
        });
    }

    filter(value: string, type: string) {
        value = value.toString().toLowerCase();
        if (type === 'Prof') {
            if (value && value.length > 0) {
                this._profs = this.profs.filter(s =>
                    s.fullName?.toLowerCase()?.includes(value)
                );
            } else {
                this._profs = this.profs;
            }
        }
        if (type === 'MONTH') {
            if (value && value.length > 0) {
                this.months = this.months.filter(s => s.name.toLowerCase().includes(value));
            } else {
                this.months = [
                    {month: 1, name: 'January'},
                    {month: 2, name: 'February'},
                    {month: 3, name: 'March'},
                    {month: 4, name: 'April'},
                    {month: 5, name: 'May'},
                    {month: 6, name: 'June'},
                    {month: 7, name: 'July'},
                    {month: 8, name: 'August'},
                    {month: 9, name: 'September'},
                    {month: 10, name: 'October'},
                    {month: 11, name: 'November'},
                    {month: 12, name: 'December'}
                ];
            }
        }
        if (type === 'YEAR') {
            if (value && value.length > 0) {
                this.years = this.years.filter(s => s.toString().includes(value));
            } else {
                this.years = [2021, 2022, 2023, 2024, 2025, 2026];
            }
        }
        if (type === 'STATUS') {
            if (value && value.length > 0) {
                this._statuses = this._statuses.filter(s => s.label.toLowerCase().includes(value));
            } else {
                this._statuses = this._statuses;
            }
        }
    }


    displayFn(item: any): string {
        if (typeof item === 'object' && item !== null) {
            return item && item.name ? item.name : '';
        } else {
            return item ? item.toString() : '';
        }
    }

    displayFnName(item: any): string {
        return item && item.fullName ? item.fullName : '';
    }

    displayFnStatus(item: any): string {
        if (typeof item === 'object' && item !== null) {
            return item && item.label ? item.label : '';
        } else {
            return item ? item.toString() : '';
        }
    }


    public applyFilter(): void {
        this.submitted = true;
        this.validateForm();
        if (this.errorMessages.length === 0) {
            console.log('Sending request with pageable:', this.pageable);
            this.service.findPaginatedByCriteria(this.pageable).subscribe((res: PaginatedList<SalaryDto>) => {
                this.criteria = res;
                console.log(res);
                this.refDialog.close(res);
            }, error => {
                console.error('Error occurred:', error);
            });
        } else {
            this.alert.show('info', 'something went wrong!, please try again.');
        }
    }


}
