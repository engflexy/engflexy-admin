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



import {EtudiantReviewCollaboratorService} from '../../../../shared/service/collaborator/inscriptionref/EtudiantReviewCollaborator.service';
import {EtudiantReviewDto} from '../../../../shared/model/inscriptionref/EtudiantReview.model';
import {EtudiantReviewCriteria} from '../../../../shared/criteria/inscriptionref/EtudiantReviewCriteria.model';
import {EtudiantDto} from '../../../../shared/model/inscription/Etudiant.model';
import {EtudiantCollaboratorService} from '../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service';
import {CoursDto} from '../../../../shared/model/course/Cours.model';
import {CoursCollaboratorService} from '../../../../shared/service/collaborator/course/CoursCollaborator.service';
import {ProfDto} from '../../../../shared/model/prof/Prof.model';
import {ProfCollaboratorService} from '../../../../shared/service/collaborator/prof/ProfCollaborator.service';

@Component({
  selector: 'app-etudiant-review-create-collaborator',
  templateUrl: './etudiant-review-create-collaborator.component.html',
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
export class EtudiantReviewCreateCollaboratorComponent  implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

  _etudiantsFilter:  EtudiantDto[];
  _profsFilter:  ProfDto[];
  _courssFilter:  CoursDto[];



    private _validProfRef = true;
    private _validCoursCode = true;
    private _validCoursLibelle = true;

	constructor(private alert: FuseAlertService, private service: EtudiantReviewCollaboratorService , private etudiantService: EtudiantCollaboratorService, private coursService: CoursCollaboratorService, private profService: ProfCollaboratorService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.etudiantService.findAll().subscribe((data) => {this.etudiants = data; this._etudiantsFilter = {...this.etudiants}});
        this.profService.findAll().subscribe((data) => {this.profs = data; this._profsFilter = {...this.profs}});
        this.coursService.findAll().subscribe((data) => {this.courss = data; this._courssFilter = {...this.courss}});
    }

  displayEtudiant(item: EtudiantDto): string {
	return item && item.id ? item.id : "";

  }

  filterEtudiant(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._etudiantsFilter = this.etudiants.filter(s =>
			s.id?.toLowerCase()?.includes(value)
		)
	} else {
		this._etudiantsFilter = this.etudiants
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
  displayCours(item: CoursDto): string {
	return item && item.libelle ? item.libelle : "";

  }

  filterCours(value: string){
  	value = value.toLowerCase();
	if (value && value.length > 0) {
		this._courssFilter = this.courss.filter(s =>
			s.libelle?.toLowerCase()?.includes(value)
		)
	} else {
		this._courssFilter = this.courss
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
                this.item = new EtudiantReviewDto();
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
    get cours(): CoursDto {
        return this.coursService.item;
    }
    set cours(value: CoursDto) {
        this.coursService.item = value;
    }
    get courss(): Array<CoursDto> {
        return this.coursService.items;
    }
    set courss(value: Array<CoursDto>) {
        this.coursService.items = value;
    }
    get createCoursDialog(): boolean {
        return this.coursService.createDialog;
    }
    set createCoursDialog(value: boolean) {
        this.coursService.createDialog= value;
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




    get validProfRef(): boolean {
        return this._validProfRef;
    }
    set validProfRef(value: boolean) {
        this._validProfRef = value;
    }
    get validCoursCode(): boolean {
        return this._validCoursCode;
    }
    set validCoursCode(value: boolean) {
        this._validCoursCode = value;
    }
    get validCoursLibelle(): boolean {
        return this._validCoursLibelle;
    }
    set validCoursLibelle(value: boolean) {
        this._validCoursLibelle = value;
    }


    get items(): Array<EtudiantReviewDto> {
        return this.service.items;
    }

    set items(value: Array<EtudiantReviewDto>) {
        this.service.items = value;
    }

    get item(): EtudiantReviewDto {
        return this.service.item;
    }

    set item(value: EtudiantReviewDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): EtudiantReviewCriteria {
        return this.service.criteria;
    }

    set criteria(value: EtudiantReviewCriteria) {
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
