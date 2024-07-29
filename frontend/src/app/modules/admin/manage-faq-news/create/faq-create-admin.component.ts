import {Component, Inject, OnInit, PLATFORM_ID} from '@angular/core';

import {MatButtonModule} from "@angular/material/button";
import {MatDialogModule, MatDialogRef} from "@angular/material/dialog";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatInputModule} from "@angular/material/input";
import {DatePipe, NgForOf, NgIf} from "@angular/common";

import {FuseAlertService} from "../../../../../@fuse/components/alert";

import {MatAutocompleteModule} from "@angular/material/autocomplete";
import {MatCheckboxModule} from "@angular/material/checkbox";
import {MatIconModule} from "@angular/material/icon";
import {MatTooltipModule} from "@angular/material/tooltip";
import {Router} from '@angular/router';


import {environment} from '../../../../../environments/environment';

import {RoleService} from '../../../../zynerator/security/shared/service/Role.service';
import {StringUtilService} from '../../../../zynerator/util/StringUtil.service';

import {FormsModule} from "@angular/forms";

import {TranslocoModule} from "@ngneat/transloco";


import {FaqAdminService} from '../../../../shared/service/admin/faq/FaqAdmin.service';
import {FaqDto} from '../../../../shared/model/faq/Faq.model';
import {FaqCriteria} from '../../../../shared/criteria/faq/FaqCriteria.model';
import {FaqTypeDto} from '../../../../shared/model/faq/FaqType.model';
import {FaqTypeAdminService} from '../../../../shared/service/admin/faq/FaqTypeAdmin.service';
import {FaqCollaboratorService} from "../../../../shared/service/collaborator/faq/FaqCollaborator.service";

@Component({
  selector: 'app-faq-create-admin',
  templateUrl: './faq-create-admin.component.html',
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
export class FaqCreateAdminComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    private _activeTab = 0;

  _faqTypesFilter:  FaqTypeDto[];



   private _validFaqLibelle = true;
    private _validFaqTypeLibelle = true;

	constructor(private alert: FuseAlertService,
                private refDialog: MatDialogRef<FaqCreateAdminComponent>,
                private stringUtilService: StringUtilService,
                private service: FaqCollaboratorService , private faqTypeService: FaqTypeAdminService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.faqTypeService.findAll().subscribe((data) => {this.faqTypes = data;
            this._faqTypesFilter = [...this.faqTypes]});
    }

  displayFaqType(item: FaqTypeDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterFaqType(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._faqTypesFilter = this.faqTypes.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._faqTypesFilter = this.faqTypes
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
                console.log(item)
                this.items.push({...item});
                this.item = new FaqDto();
                this.refDialog.close(item)
            } else {
                this.alert.show('info', 'something went wrong!, please try again.');
            }

        }, error => {
            console.log(error);
        });
    }


    public hideCreateDialog() {
        this.refDialog.close(null)
    }





    public  setValidation(value: boolean){
        this.validFaqLibelle = value;
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateFaqLibelle();
    }

    public validateFaqLibelle(){
        if (this.stringUtilService.isEmpty(this.item.question)) {
        this.errorMessages.push('Libelle non valide');
        this.validFaqLibelle = false;
        } else {
            this.validFaqLibelle = true;
        }
    }


    public async openCreateFaqType(faqType: string) {
    const isPermistted = await this.roleService.isPermitted('FaqType', 'add');
    if(isPermistted) {
         this.faqType = new FaqTypeDto();
         this.createFaqTypeDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }

    get faqType(): FaqTypeDto {
        return this.faqTypeService.item;
    }
    set faqType(value: FaqTypeDto) {
        this.faqTypeService.item = value;
    }
    get faqTypes(): Array<FaqTypeDto> {
        return this.faqTypeService.items;
    }
    set faqTypes(value: Array<FaqTypeDto>) {
        this.faqTypeService.items = value;
    }
    get createFaqTypeDialog(): boolean {
        return this.faqTypeService.createDialog;
    }
    set createFaqTypeDialog(value: boolean) {
        this.faqTypeService.createDialog= value;
    }



    get validFaqLibelle(): boolean {
        return this._validFaqLibelle;
    }

    set validFaqLibelle(value: boolean) {
         this._validFaqLibelle = value;
    }

    get validFaqTypeLibelle(): boolean {
        return this._validFaqTypeLibelle;
    }
    set validFaqTypeLibelle(value: boolean) {
        this._validFaqTypeLibelle = value;
    }


    get items(): Array<FaqDto> {
        return this.service.items;
    }

    set items(value: Array<FaqDto>) {
        this.service.items = value;
    }

    get item(): FaqDto {
        return this.service.item;
    }

    set item(value: FaqDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): FaqCriteria {
        return this.service.criteria;
    }

    set criteria(value: FaqCriteria) {
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
