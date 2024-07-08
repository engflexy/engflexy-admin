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



import {PackStudentAdminService} from '../../../../shared/service/admin/pack/PackStudentAdmin.service';
import {PackStudentDto} from '../../../../shared/model/pack/PackStudent.model';
import {PackStudentCriteria} from '../../../../shared/criteria/pack/PackStudentCriteria.model';
import {ParcoursDto} from '../../../../shared/model/course/Parcours.model';
import {ParcoursAdminService} from '../../../../shared/service/admin/course/ParcoursAdmin.service';
import {PriceDto} from '../../../../shared/model/price/Price.model';
import {PriceAdminService} from '../../../../shared/service/admin/price/PriceAdmin.service';

@Component({
  selector: 'app-pack-student-create-admin',
  templateUrl: './pack-student-create-admin.component.html',
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
export class PackStudentCreateAdminComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _parcourssFilter:  ParcoursDto[];
  _pricesFilter:  PriceDto[];



   private _validPackStudentCode = true;
   private _validPackStudentLibelle = true;
    private _validParcoursCode = true;
    private _validParcoursLibelle = true;
    private _validPriceLib = true;

	constructor(private alert: FuseAlertService, private service: PackStudentAdminService , private parcoursService: ParcoursAdminService, private priceService: PriceAdminService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.parcoursService.findAll().subscribe((data) => {this.parcourss = data; this._parcourssFilter = {...this.parcourss}});
        this.priceService.findAll().subscribe((data) => {this.prices = data; this._pricesFilter = {...this.prices}});
    }

  displayParcours(item: ParcoursDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterParcours(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._parcourssFilter = this.parcourss.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._parcourssFilter = this.parcourss
	}
 }
  displayPrice(item: PriceDto): string {
	return item && item.lib ? item.lib : "";

  }

  filterPrice(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._pricesFilter = this.prices.filter(s =>
			s.lib?.toLowerCase()?.includes(value)
		)
	} else {
		this._pricesFilter = this.prices
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
                this.item = new PackStudentDto();
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
        this.validPackStudentCode = value;
        this.validPackStudentLibelle = value;
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validatePackStudentCode();
        this.validatePackStudentLibelle();
    }

    public validatePackStudentCode(){
        if (this.stringUtilService.isEmpty(this.item.code)) {
        this.errorMessages.push('Code non valide');
        this.validPackStudentCode = false;
        } else {
            this.validPackStudentCode = true;
        }
    }
    public validatePackStudentLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
        this.errorMessages.push('Libelle non valide');
        this.validPackStudentLibelle = false;
        } else {
            this.validPackStudentLibelle = true;
        }
    }



    get price(): PriceDto {
        return this.priceService.item;
    }
    set price(value: PriceDto) {
        this.priceService.item = value;
    }
    get prices(): Array<PriceDto> {
        return this.priceService.items;
    }
    set prices(value: Array<PriceDto>) {
        this.priceService.items = value;
    }
    get createPriceDialog(): boolean {
        return this.priceService.createDialog;
    }
    set createPriceDialog(value: boolean) {
        this.priceService.createDialog= value;
    }
    get parcours(): ParcoursDto {
        return this.parcoursService.item;
    }
    set parcours(value: ParcoursDto) {
        this.parcoursService.item = value;
    }
    get parcourss(): Array<ParcoursDto> {
        return this.parcoursService.items;
    }
    set parcourss(value: Array<ParcoursDto>) {
        this.parcoursService.items = value;
    }
    get createParcoursDialog(): boolean {
        return this.parcoursService.createDialog;
    }
    set createParcoursDialog(value: boolean) {
        this.parcoursService.createDialog= value;
    }



    get validPackStudentCode(): boolean {
        return this._validPackStudentCode;
    }

    set validPackStudentCode(value: boolean) {
         this._validPackStudentCode = value;
    }
    get validPackStudentLibelle(): boolean {
        return this._validPackStudentLibelle;
    }

    set validPackStudentLibelle(value: boolean) {
         this._validPackStudentLibelle = value;
    }

    get validParcoursCode(): boolean {
        return this._validParcoursCode;
    }
    set validParcoursCode(value: boolean) {
        this._validParcoursCode = value;
    }
    get validParcoursLibelle(): boolean {
        return this._validParcoursLibelle;
    }
    set validParcoursLibelle(value: boolean) {
        this._validParcoursLibelle = value;
    }
    get validPriceLib(): boolean {
        return this._validPriceLib;
    }
    set validPriceLib(value: boolean) {
        this._validPriceLib = value;
    }


    get items(): Array<PackStudentDto> {
        return this.service.items;
    }

    set items(value: Array<PackStudentDto>) {
        this.service.items = value;
    }

    get item(): PackStudentDto {
        return this.service.item;
    }

    set item(value: PackStudentDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): PackStudentCriteria {
        return this.service.criteria;
    }

    set criteria(value: PackStudentCriteria) {
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
