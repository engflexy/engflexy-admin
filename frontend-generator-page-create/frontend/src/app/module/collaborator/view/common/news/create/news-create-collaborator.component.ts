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



import {NewsCollaboratorService} from '../../../../shared/service/collaborator/common/NewsCollaborator.service';
import {NewsDto} from '../../../../shared/model/common/News.model';
import {NewsCriteria} from '../../../../shared/criteria/common/NewsCriteria.model';
import {CollaboratorDto} from '../../../../shared/model/vocab/Collaborator.model';
import {CollaboratorCollaboratorService} from '../../../../shared/service/collaborator/vocab/CollaboratorCollaborator.service';

@Component({
  selector: 'app-news-create-collaborator',
  templateUrl: './news-create-collaborator.component.html',
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
export class NewsCreateCollaboratorComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _collaboratorsFilter:  CollaboratorDto[];



   private _validNewsRef = true;

	constructor(private alert: FuseAlertService, private service: NewsCollaboratorService , private collaboratorService: CollaboratorCollaboratorService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.collaboratorService.findAll().subscribe((data) => {this.collaborators = data; this._collaboratorsFilter = {...this.collaborators}});
    }

  displayCollaborator(item: CollaboratorDto): string {
	return item && item.id ? item.id : "";

  }

  filterCollaborator(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._collaboratorsFilter = this.collaborators.filter(s =>
			s.id?.toLowerCase()?.includes(value)
		)
	} else {
		this._collaboratorsFilter = this.collaborators
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
                this.item = new NewsDto();
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
        this.validNewsRef = value;
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateNewsRef();
    }

    public validateNewsRef(){
        if (this.stringUtilService.isEmpty(this.item.ref)) {
        this.errorMessages.push('Ref non valide');
        this.validNewsRef = false;
        } else {
            this.validNewsRef = true;
        }
    }



    get collaborator(): CollaboratorDto {
        return this.collaboratorService.item;
    }
    set collaborator(value: CollaboratorDto) {
        this.collaboratorService.item = value;
    }
    get collaborators(): Array<CollaboratorDto> {
        return this.collaboratorService.items;
    }
    set collaborators(value: Array<CollaboratorDto>) {
        this.collaboratorService.items = value;
    }
    get createCollaboratorDialog(): boolean {
        return this.collaboratorService.createDialog;
    }
    set createCollaboratorDialog(value: boolean) {
        this.collaboratorService.createDialog= value;
    }



    get validNewsRef(): boolean {
        return this._validNewsRef;
    }

    set validNewsRef(value: boolean) {
         this._validNewsRef = value;
    }



    get items(): Array<NewsDto> {
        return this.service.items;
    }

    set items(value: Array<NewsDto>) {
        this.service.items = value;
    }

    get item(): NewsDto {
        return this.service.item;
    }

    set item(value: NewsDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): NewsCriteria {
        return this.service.criteria;
    }

    set criteria(value: NewsCriteria) {
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
