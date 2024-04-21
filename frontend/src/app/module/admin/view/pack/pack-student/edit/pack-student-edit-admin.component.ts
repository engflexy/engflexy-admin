import {Component, OnInit} from '@angular/core';


import {AbstractEditController} from 'src/app/zynerator/controller/AbstractEditController';

import {PackStudentAdminService} from 'src/app/shared/service/admin/pack/PackStudentAdmin.service';
import {PackStudentDto} from 'src/app/shared/model/pack/PackStudent.model';
import {PackStudentCriteria} from 'src/app/shared/criteria/pack/PackStudentCriteria.model';


import {ParcoursDto} from 'src/app/shared/model/course/Parcours.model';
import {ParcoursAdminService} from 'src/app/shared/service/admin/course/ParcoursAdmin.service';
import {PriceDto} from 'src/app/shared/model/price/Price.model';
import {PriceAdminService} from 'src/app/shared/service/admin/price/PriceAdmin.service';

@Component({
    selector: 'app-pack-student-edit-admin',
    templateUrl: './pack-student-edit-admin.component.html'
})
export class PackStudentEditAdminComponent extends AbstractEditController<PackStudentDto, PackStudentCriteria, PackStudentAdminService> implements OnInit {


    constructor(private packStudentService: PackStudentAdminService, private parcoursService: ParcoursAdminService, private priceService: PriceAdminService) {
        super(packStudentService);
    }

    private _validPackStudentCode = true;

    get validPackStudentCode(): boolean {
        return this._validPackStudentCode;
    }

    set validPackStudentCode(value: boolean) {
        this._validPackStudentCode = value;
    }

    private _validPackStudentLibelle = true;

    get validPackStudentLibelle(): boolean {
        return this._validPackStudentLibelle;
    }

    set validPackStudentLibelle(value: boolean) {
        this._validPackStudentLibelle = value;
    }

    private _validParcoursCode = true;

    get validParcoursCode(): boolean {
        return this._validParcoursCode;
    }

    set validParcoursCode(value: boolean) {
        this._validParcoursCode = value;
    }

    private _validParcoursLibelle = true;

    get validParcoursLibelle(): boolean {
        return this._validParcoursLibelle;
    }

    set validParcoursLibelle(value: boolean) {
        this._validParcoursLibelle = value;
    }

    private _validPriceLib = true;

    get validPriceLib(): boolean {
        return this._validPriceLib;
    }

    set validPriceLib(value: boolean) {
        this._validPriceLib = value;
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
        this.priceService.createDialog = value;
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
        this.parcoursService.createDialog = value;
    }

    ngOnInit(): void {
        this.parcours = new ParcoursDto();
        this.parcoursService.findAll().subscribe((data) => this.parcourss = data);
        this.price = new PriceDto();
        this.priceService.findAll().subscribe((data) => this.prices = data);
    }

    public override setValidation(value: boolean) {
        this.validPackStudentCode = value;
        this.validPackStudentLibelle = value;
    }

    public override validateForm(): void {
        this.errorMessages = new Array<string>();
        this.validatePackStudentCode();
        this.validatePackStudentLibelle();
    }

    public validatePackStudentCode() {
        if (this.stringUtilService.isEmpty(this.item.code)) {
            this.errorMessages.push('Code non valide');
            this.validPackStudentCode = false;
        } else {
            this.validPackStudentCode = true;
        }
    }

    public validatePackStudentLibelle() {
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
            this.errorMessages.push('Libelle non valide');
            this.validPackStudentLibelle = false;
        } else {
            this.validPackStudentLibelle = true;
        }
    }
}
