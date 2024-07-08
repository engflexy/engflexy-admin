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



import {GroupeEtudiantCollaboratorService} from '../../../../shared/service/collaborator/grpe/GroupeEtudiantCollaborator.service';
import {GroupeEtudiantDto} from '../../../../shared/model/grpe/GroupeEtudiant.model';
import {GroupeEtudiantCriteria} from '../../../../shared/criteria/grpe/GroupeEtudiantCriteria.model';
import {ParcoursDto} from '../../../../shared/model/course/Parcours.model';
import {ParcoursCollaboratorService} from '../../../../shared/service/collaborator/course/ParcoursCollaborator.service';
import {GroupeEtatDto} from '../../../../shared/model/grpe/GroupeEtat.model';
import {GroupeEtatCollaboratorService} from '../../../../shared/service/collaborator/grpe/GroupeEtatCollaborator.service';
import {GroupeEtudiantDetailDto} from '../../../../shared/model/grpe/GroupeEtudiantDetail.model';
import {GroupeEtudiantDetailCollaboratorService} from '../../../../shared/service/collaborator/grpe/GroupeEtudiantDetailCollaborator.service';
import {EtudiantDto} from '../../../../shared/model/inscription/Etudiant.model';
import {EtudiantCollaboratorService} from '../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service';
import {GroupeTypeDto} from '../../../../shared/model/grpe/GroupeType.model';
import {GroupeTypeCollaboratorService} from '../../../../shared/service/collaborator/grpe/GroupeTypeCollaborator.service';
import {GroupeEtudeDto} from '../../../../shared/model/grpe/GroupeEtude.model';
import {GroupeEtudeCollaboratorService} from '../../../../shared/service/collaborator/grpe/GroupeEtudeCollaborator.service';
import {ProfDto} from '../../../../shared/model/prof/Prof.model';
import {ProfCollaboratorService} from '../../../../shared/service/collaborator/prof/ProfCollaborator.service';

@Component({
  selector: 'app-groupe-etudiant-create-collaborator',
  templateUrl: './groupe-etudiant-create-collaborator.component.html',
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
export class GroupeEtudiantCreateCollaboratorComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _groupeEtudesFilter:  GroupeEtudeDto[];
  _groupeTypesFilter:  GroupeTypeDto[];
  _groupeEtatsFilter:  GroupeEtatDto[];
  _parcourssFilter:  ParcoursDto[];
  _profsFilter:  ProfDto[];

    private _groupeEtudiantDetailsElement = new GroupeEtudiantDetailDto();


    private _validGroupeEtudeLibelle = true;
    private _validGroupeTypeCode = true;
    private _validGroupeTypeLibelle = true;
    private _validGroupeEtatCode = true;
    private _validGroupeEtatLibelle = true;
    private _validParcoursCode = true;
    private _validParcoursLibelle = true;
    private _validProfRef = true;
    private _groupeEtudiantDetails: Array<GroupeEtudiantDetailDto> = [];

	constructor(private alert: FuseAlertService, private service: GroupeEtudiantCollaboratorService , private parcoursService: ParcoursCollaboratorService, private groupeEtatService: GroupeEtatCollaboratorService, private groupeEtudiantDetailService: GroupeEtudiantDetailCollaboratorService, private etudiantService: EtudiantCollaboratorService, private groupeTypeService: GroupeTypeCollaboratorService, private groupeEtudeService: GroupeEtudeCollaboratorService, private profService: ProfCollaboratorService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.etudiantService.findAll().subscribe(data => this.prepareGroupeEtudiantDetails(data));
        this.groupeEtudiantDetailsElement.etudiant = new EtudiantDto();
        this.etudiantService.findAll().subscribe((data) => this.etudiants = data);
        this.groupeEtudeService.findAll().subscribe((data) => {this.groupeEtudes = data; this._groupeEtudesFilter = {...this.groupeEtudes}});
        this.groupeTypeService.findAll().subscribe((data) => {this.groupeTypes = data; this._groupeTypesFilter = {...this.groupeTypes}});
        this.groupeEtatService.findAll().subscribe((data) => {this.groupeEtats = data; this._groupeEtatsFilter = {...this.groupeEtats}});
        this.parcoursService.findAll().subscribe((data) => {this.parcourss = data; this._parcourssFilter = {...this.parcourss}});
        this.profService.findAll().subscribe((data) => {this.profs = data; this._profsFilter = {...this.profs}});
    }

  displayGroupeEtude(item: GroupeEtudeDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterGroupeEtude(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._groupeEtudesFilter = this.groupeEtudes.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._groupeEtudesFilter = this.groupeEtudes
	}
 }
  displayGroupeType(item: GroupeTypeDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterGroupeType(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._groupeTypesFilter = this.groupeTypes.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._groupeTypesFilter = this.groupeTypes
	}
 }
  displayGroupeEtat(item: GroupeEtatDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterGroupeEtat(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._groupeEtatsFilter = this.groupeEtats.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._groupeEtatsFilter = this.groupeEtats
	}
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
                this.item = new GroupeEtudiantDto();
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


     prepareGroupeEtudiantDetails(etudiants: Array<EtudiantDto>): void{
        if( etudiants != null){
                etudiants.forEach(e => {
                const groupeEtudiantDetail = new GroupeEtudiantDetailDto();
                groupeEtudiantDetail.etudiant = e;
                this.groupeEtudiantDetails.push(groupeEtudiantDetail);
            });
        }
    }



    public  setValidation(value: boolean){
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
    }



    public async openCreateGroupeType(groupeType: string) {
    const isPermistted = await this.roleService.isPermitted('GroupeType', 'add');
    if(isPermistted) {
         this.groupeType = new GroupeTypeDto();
         this.createGroupeTypeDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }
    public async openCreateGroupeEtat(groupeEtat: string) {
    const isPermistted = await this.roleService.isPermitted('GroupeEtat', 'add');
    if(isPermistted) {
         this.groupeEtat = new GroupeEtatDto();
         this.createGroupeEtatDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }
    public async openCreateGroupeEtude(groupeEtude: string) {
    const isPermistted = await this.roleService.isPermitted('GroupeEtude', 'add');
    if(isPermistted) {
         this.groupeEtude = new GroupeEtudeDto();
         this.createGroupeEtudeDialog = true;
    }else{
        this.alert.show('info', 'something went wrong!, please try again.');
     }
    }

    get groupeType(): GroupeTypeDto {
        return this.groupeTypeService.item;
    }
    set groupeType(value: GroupeTypeDto) {
        this.groupeTypeService.item = value;
    }
    get groupeTypes(): Array<GroupeTypeDto> {
        return this.groupeTypeService.items;
    }
    set groupeTypes(value: Array<GroupeTypeDto>) {
        this.groupeTypeService.items = value;
    }
    get createGroupeTypeDialog(): boolean {
        return this.groupeTypeService.createDialog;
    }
    set createGroupeTypeDialog(value: boolean) {
        this.groupeTypeService.createDialog= value;
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
    get groupeEtat(): GroupeEtatDto {
        return this.groupeEtatService.item;
    }
    set groupeEtat(value: GroupeEtatDto) {
        this.groupeEtatService.item = value;
    }
    get groupeEtats(): Array<GroupeEtatDto> {
        return this.groupeEtatService.items;
    }
    set groupeEtats(value: Array<GroupeEtatDto>) {
        this.groupeEtatService.items = value;
    }
    get createGroupeEtatDialog(): boolean {
        return this.groupeEtatService.createDialog;
    }
    set createGroupeEtatDialog(value: boolean) {
        this.groupeEtatService.createDialog= value;
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
    get etudiant(): EtudiantDto {
        return this.etudiantService.item;
    }
    set etudiant(value: EtudiantDto) {
        this.etudiantService.item = value;
    }
    get etudiants(): Array<EtudiantDto> {
        return this.etudiantService.items;
    }
    set etudiants(value: Array<EtudiantDto>) {
        this.etudiantService.items = value;
    }
    get createEtudiantDialog(): boolean {
        return this.etudiantService.createDialog;
    }
    set createEtudiantDialog(value: boolean) {
        this.etudiantService.createDialog= value;
    }
    get groupeEtude(): GroupeEtudeDto {
        return this.groupeEtudeService.item;
    }
    set groupeEtude(value: GroupeEtudeDto) {
        this.groupeEtudeService.item = value;
    }
    get groupeEtudes(): Array<GroupeEtudeDto> {
        return this.groupeEtudeService.items;
    }
    set groupeEtudes(value: Array<GroupeEtudeDto>) {
        this.groupeEtudeService.items = value;
    }
    get createGroupeEtudeDialog(): boolean {
        return this.groupeEtudeService.createDialog;
    }
    set createGroupeEtudeDialog(value: boolean) {
        this.groupeEtudeService.createDialog= value;
    }

    get groupeEtudiantDetails(): Array<GroupeEtudiantDetailDto> {
        if( this._groupeEtudiantDetails == null )
            this._groupeEtudiantDetails = new Array();
        return this._groupeEtudiantDetails;
    }

    set groupeEtudiantDetails(value: Array<GroupeEtudiantDetailDto>) {
        this._groupeEtudiantDetails = value;
    }



    get validGroupeEtudeLibelle(): boolean {
        return this._validGroupeEtudeLibelle;
    }
    set validGroupeEtudeLibelle(value: boolean) {
        this._validGroupeEtudeLibelle = value;
    }
    get validGroupeTypeCode(): boolean {
        return this._validGroupeTypeCode;
    }
    set validGroupeTypeCode(value: boolean) {
        this._validGroupeTypeCode = value;
    }
    get validGroupeTypeLibelle(): boolean {
        return this._validGroupeTypeLibelle;
    }
    set validGroupeTypeLibelle(value: boolean) {
        this._validGroupeTypeLibelle = value;
    }
    get validGroupeEtatCode(): boolean {
        return this._validGroupeEtatCode;
    }
    set validGroupeEtatCode(value: boolean) {
        this._validGroupeEtatCode = value;
    }
    get validGroupeEtatLibelle(): boolean {
        return this._validGroupeEtatLibelle;
    }
    set validGroupeEtatLibelle(value: boolean) {
        this._validGroupeEtatLibelle = value;
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
    get validProfRef(): boolean {
        return this._validProfRef;
    }
    set validProfRef(value: boolean) {
        this._validProfRef = value;
    }

    get groupeEtudiantDetailsElement(): GroupeEtudiantDetailDto {
        if( this._groupeEtudiantDetailsElement == null )
            this._groupeEtudiantDetailsElement = new GroupeEtudiantDetailDto();
        return this._groupeEtudiantDetailsElement;
    }

    set groupeEtudiantDetailsElement(value: GroupeEtudiantDetailDto) {
        this._groupeEtudiantDetailsElement = value;
    }

    get items(): Array<GroupeEtudiantDto> {
        return this.service.items;
    }

    set items(value: Array<GroupeEtudiantDto>) {
        this.service.items = value;
    }

    get item(): GroupeEtudiantDto {
        return this.service.item;
    }

    set item(value: GroupeEtudiantDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): GroupeEtudiantCriteria {
        return this.service.criteria;
    }

    set criteria(value: GroupeEtudiantCriteria) {
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
