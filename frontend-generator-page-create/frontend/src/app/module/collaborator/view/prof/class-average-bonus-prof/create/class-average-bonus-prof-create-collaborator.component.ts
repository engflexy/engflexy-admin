import {Component, OnInit} from '@angular/core';

import {MatButtonModule} from "@angular/material/button";
import {MatDialogModule, MatDialogRef} from "@angular/material/dialog";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatInputModule} from "@angular/material/input";
import {NgForOf, NgIf} from "@angular/common";

import {FuseAlertService} from "../../../../../@fuse/components/alert";

import {MatAutocompleteModule} from "@angular/material/autocomplete";
import {MatCheckboxModule} from "@angular/material/checkbox";
import {MatIconModule} from "@angular/material/icon";
import {MatTooltipModule} from "@angular/material/tooltip";

import {AuthService} from "../../../../zynerator/security/shared/service/Auth.service";



import {DatePipe} from '@angular/common';
import {Router} from '@angular/router';
import {Inject, Injectable, PLATFORM_ID} from '@angular/core';


import {environment} from '../../../../../environments/environment';

import {RoleService} from '../../../../zynerator/security/shared/service/Role.service';
import {StringUtilService} from '../../../../zynerator/util/StringUtil.service';
import {ServiceLocator} from '../../../../zynerator/service/ServiceLocator';

import {FormsModule} from "@angular/forms";
import {MatCheckboxModule} from "@angular/material/checkbox

import {TranslocoModule} from "@ngneat/transloco";



import {ClassAverageBonusProfCollaboratorService} from '../../../../shared/service/collaborator/prof/ClassAverageBonusProfCollaborator.service';
import {ClassAverageBonusProfDto} from '../../../../shared/model/prof/ClassAverageBonusProf.model';
import {ClassAverageBonusProfCriteria} from '../../../../shared/criteria/prof/ClassAverageBonusProfCriteria.model';
import {SalaryDto} from '../../../../shared/model/salary/Salary.model';
import {SalaryCollaboratorService} from '../../../../shared/service/collaborator/salary/SalaryCollaborator.service';
import {ProfDto} from '../../../../shared/model/prof/Prof.model';
import {ProfCollaboratorService} from '../../../../shared/service/collaborator/prof/ProfCollaborator.service';

@Component({
  selector: 'app-class-average-bonus-prof-create-collaborator',
  templateUrl: './class-average-bonus-prof-create-collaborator.component.html',
  imports: [
        MatButtonModule,
        MatDialogModule,
        MatFormFieldModule,
        MatInputModule,
        NgIf,
        MatAutocompleteModule,
        NgForOf,
        MatIconModule,
        MatTooltipModule,
        TranslocoModule,
        FormsModule,
        MatCheckboxModule
    ],
    standalone: true
})
export class ClassAverageBonusProfCreateCollaboratorComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _profsFilter:  ProfDto[];
  _salarysFilter:  SalaryDto[];



    private _validProfRef = true;
    private _validSalaryCode = true;

	constructor(private alert: FuseAlertService, private service: ClassAverageBonusProfCollaboratorService , private salaryService: SalaryCollaboratorService, private profService: ProfCollaboratorService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.profService.findAll().subscribe((data) => {this.profs = data; this._profsFilter = {...this.profs}});
        this.salaryService.findAll().subscribe((data) => {this.salarys = data; this._salarysFilter = {...this.salarys}});
    }

  displayProf(item: ProfDto): string {
	return item && item.ref ? item.ref : "";

  }

  filterProf(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._profsFilter = this.profs.filter(s =>
			s.ref?.toLowerCase()?.includes(value)
		)
	} else {
		this._profsFilter = this.profs
	}
 }
  displaySalary(item: SalaryDto): string {
	return item && item.code ? item.code : "";

  }

  filterSalary(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._salarysFilter = this.salarys.filter(s =>
			s.code?.toLowerCase()?.includes(value)
		)
	} else {
		this._salarysFilter = this.salarys
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

    public saveWithShowOption(showList: boolean) {
        this.service.save().subscribe(item => {
            if (item != null) {
                this.items.push({...item});
                this.createDialog = false;
                this.submitted = false;
                this.item = new ClassAverageBonusProfDto();
            } else {
                this.alert.show('info', 'something went wrong!, please try again.');
            }

        }, error => {
            console.log(error);
        });
    }


    public hideCreateDialog() {
        this.createDialog = false;
        this.setValidation(true);
    }





    public  setValidation(value: boolean){
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
    }



    public async openCreateProf(prof: string) {
    const isPermistted = await this.roleService.isPermitted('Prof', 'add');
    if(isPermistted) {
         this.prof = new ProfDto();
         this.createProfDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
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
        this.profService.createDialog= value;
    }
    get salary(): SalaryDto {
        return this.salaryService.item;
    }
    set salary(value: SalaryDto) {
        this.salaryService.item = value;
    }
    get salarys(): Array<SalaryDto> {
        return this.salaryService.items;
    }
    set salarys(value: Array<SalaryDto>) {
        this.salaryService.items = value;
    }
    get createSalaryDialog(): boolean {
        return this.salaryService.createDialog;
    }
    set createSalaryDialog(value: boolean) {
        this.salaryService.createDialog= value;
    }




    get validProfRef(): boolean {
        return this._validProfRef;
    }
    set validProfRef(value: boolean) {
        this._validProfRef = value;
    }
    get validSalaryCode(): boolean {
        return this._validSalaryCode;
    }
    set validSalaryCode(value: boolean) {
        this._validSalaryCode = value;
    }


    get items(): Array<ClassAverageBonusProfDto> {
        return this.service.items;
    }

    set items(value: Array<ClassAverageBonusProfDto>) {
        this.service.items = value;
    }

    get item(): ClassAverageBonusProfDto {
        return this.service.item;
    }

    set item(value: ClassAverageBonusProfDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): ClassAverageBonusProfCriteria {
        return this.service.criteria;
    }

    set criteria(value: ClassAverageBonusProfCriteria) {
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

}
