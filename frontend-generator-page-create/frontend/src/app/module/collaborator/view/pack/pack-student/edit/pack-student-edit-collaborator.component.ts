import {Component, OnInit, Input} from '@angular/core';
import {ConfirmationService, MessageService} from 'primeng/api';
import {FileTempDto} from 'src/app/zynerator/dto/FileTempDto.model';
import {DatePipe} from '@angular/common';
import {Router} from '@angular/router';
import {Inject, Injectable, PLATFORM_ID} from '@angular/core';

import {environment} from 'src/environments/environment';

import {RoleService} from 'src/app/zynerator/security/shared/service/Role.service';
import {StringUtilService} from 'src/app/zynerator/util/StringUtil.service';
import {ServiceLocator} from 'src/app/zynerator/service/ServiceLocator';




import {PackStudentCollaboratorService} from 'src/app/shared/service/collaborator/pack/PackStudentCollaborator.service';
import {PackStudentDto} from 'src/app/shared/model/pack/PackStudent.model';
import {PackStudentCriteria} from 'src/app/shared/criteria/pack/PackStudentCriteria.model';


import {ParcoursDto} from 'src/app/shared/model/course/Parcours.model';
import {ParcoursCollaboratorService} from 'src/app/shared/service/collaborator/course/ParcoursCollaborator.service';
import {PriceDto} from 'src/app/shared/model/price/Price.model';
import {PriceCollaboratorService} from 'src/app/shared/service/collaborator/price/PriceCollaborator.service';

@Component({
  selector: 'app-pack-student-edit-collaborator',
  templateUrl: './pack-student-edit-collaborator.component.html'
})
export class PackStudentEditCollaboratorComponent implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();


    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;
    private _file: any;
    private _files: any;



    private _validPackStudentCode = true;
    private _validPackStudentLibelle = true;

    private _validParcoursCode = true;
    private _validParcoursLibelle = true;
    private _validPriceLib = true;



    constructor(private service: PackStudentCollaboratorService , private parcoursService: ParcoursCollaboratorService, private priceService: PriceCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.parcoursService.findAll().subscribe((data) => this.parcourss = data);
        this.priceService.findAll().subscribe((data) => this.prices = data);
    }

    public prepareEdit() {
    }



 public edit(): void {
        this.submitted = true;
        this.prepareEdit();
        this.validateForm();
        if (this.errorMessages.length === 0) {
            this.editWithShowOption(false);
        } else {
            this.messageService.add({
                severity: 'error',
                summary: 'Erreurs',
                detail: 'Merci de corrigé les erreurs sur le formulaire'
            });
        }
    }

    public editWithShowOption(showList: boolean) {
        this.service.edit().subscribe(religion=>{
            const myIndex = this.items.findIndex(e => e.id === this.item.id);
            this.items[myIndex] = religion;
            this.editDialog = false;
            this.submitted = false;
            this.item = new PackStudentDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public setValidation(value: boolean){
        this.validPackStudentCode = value;
        this.validPackStudentLibelle = value;
    }

    public validateForm(): void{
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

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
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
