import {Component, ViewChild} from '@angular/core';
import {NgForm} from "@angular/forms";
import {MatDialogRef} from "@angular/material/dialog";
import {ProfDto} from "../../../../shared/model/prof/Prof.model";
import {FuseAlertService} from "../../../../../@fuse/components/alert";
import {SalaryDto} from "../../../../shared/model/salary/Salary.model";
import {SalaryCollaboratorService} from "../../../../shared/service/collaborator/salary/SalaryCollaborator.service";
import {ProfCollaboratorService} from "../../../../shared/service/collaborator/prof/ProfCollaborator.service";

@Component({
  selector: 'app-collaborator-edit-salary',
  templateUrl: './edit-salary.component.html',
})
export class EditSalaryComponent {
    @ViewChild('ngForm') ngForm: NgForm;
    private _months: { month: number, name: string }[] = [
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

    private _years: number[] = [2021, 2022, 2023, 2024, 2025, 2026];

     _profsFilter: ProfDto[];

    constructor(
        private alert: FuseAlertService,
        private service: SalaryCollaboratorService,
        public refDialog: MatDialogRef<EditSalaryComponent>,
        private profService: ProfCollaboratorService
        ) {
    }


    get months(): { month: number; name: string }[] {
        return this._months;
    }

    set months(value: { month: number; name: string }[]) {
        this._months = value;
    }




    get profsFilter(): ProfDto[] {
        return this._profsFilter;
    }

    set profsFilter(value: ProfDto[]) {
        this._profsFilter = value;
    }

    get years(): number[] {
        return this._years;
    }

    set years(value: number[]) {
        this._years = value;
    }

    get profs(): ProfDto[] {
        return this._profsFilter;
    }

    set profs(value: ProfDto[]) {
        this._profsFilter = value;
    }

    get salary(): SalaryDto{
        return this.service.item;
    }

    set salary(value: SalaryDto) {
        this.service.item = value;
    }

    ngOnInit() {
        this.profService.findAll().subscribe((data) => {
            this.profs = data;
            this._profsFilter = [...this.profs]
        });
        console.log(this.salary)

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

    update() {
        console.log(this.salary)
        this.service.edit().subscribe(res => {
            this.refDialog.close(res)
            console.log(res)
        }, error => {
            this.alert.show('info', error?.error?.message || 'something went wrong!, please try again.');
            console.error(error)
            this.ngForm.reset()
        })
    }

}
