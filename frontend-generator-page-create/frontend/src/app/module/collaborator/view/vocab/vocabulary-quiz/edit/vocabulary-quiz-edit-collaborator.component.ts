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




import {VocabularyQuizCollaboratorService} from 'src/app/shared/service/collaborator/vocab/VocabularyQuizCollaborator.service';
import {VocabularyQuizDto} from 'src/app/shared/model/vocab/VocabularyQuiz.model';
import {VocabularyQuizCriteria} from 'src/app/shared/criteria/vocab/VocabularyQuizCriteria.model';


import {VocabularyDto} from 'src/app/shared/model/vocab/Vocabulary.model';
import {VocabularyCollaboratorService} from 'src/app/shared/service/collaborator/vocab/VocabularyCollaborator.service';
import {SectionDto} from 'src/app/shared/model/course/Section.model';
import {SectionCollaboratorService} from 'src/app/shared/service/collaborator/course/SectionCollaborator.service';

@Component({
  selector: 'app-vocabulary-quiz-edit-collaborator',
  templateUrl: './vocabulary-quiz-edit-collaborator.component.html'
})
export class VocabularyQuizEditCollaboratorComponent implements OnInit {

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


    private _vocabularysElement = new VocabularyDto();

    private _validVocabularyQuizLibelle = true;

    private _validSectionCode = true;
    private _validSectionLibelle = true;



    constructor(private service: VocabularyQuizCollaboratorService , private vocabularyService: VocabularyCollaboratorService, private sectionService: SectionCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.vocabularysElement.section = new SectionDto();
        this.sectionService.findAll().subscribe((data) => this.sections = data);

        this.sectionService.findAll().subscribe((data) => this.sections = data);
    }

    public prepareEdit() {
        this.item.dateDebut = this.service.format(this.item.dateDebut);
        this.item.dateFin = this.service.format(this.item.dateFin);
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
            this.item = new VocabularyQuizDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public validateVocabularys(){
        this.errorMessages = new Array();
    }

    public setValidation(value: boolean){
        this.validVocabularyQuizLibelle = value;
    }

   public addVocabularys() {
        if( this.item.vocabularys == null )
            this.item.vocabularys = new Array<VocabularyDto>();
       this.validateVocabularys();
       if (this.errorMessages.length === 0) {
            if(this.vocabularysElement.id == null){
                this.item.vocabularys.push(this.vocabularysElement);
            }else{
                const index = this.item.vocabularys.findIndex(e => e.id == this.vocabularysElement.id);
                this.item.vocabularys[index] = this.vocabularysElement;
            }
          this.vocabularysElement = new VocabularyDto();
       }else{
            this.messageService.add({severity: 'error',summary: 'Erreurs', detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages});
        }
   }

    public deleteVocabularys(p: VocabularyDto) {
        this.item.vocabularys.forEach((element, index) => {
            if (element === p) { this.item.vocabularys.splice(index, 1); }
        });
    }

    public editVocabularys(p: VocabularyDto) {
        this.vocabularysElement = {... p};
        this.activeTab = 0;
    }


    public validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateVocabularyQuizLibelle();
    }

    public validateVocabularyQuizLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
            this.errorMessages.push('Libelle non valide');
            this.validVocabularyQuizLibelle = false;
        } else {
            this.validVocabularyQuizLibelle = true;
        }
    }





    get section(): SectionDto {
        return this.sectionService.item;
    }
    set section(value: SectionDto) {
        this.sectionService.item = value;
    }
    get sections(): Array<SectionDto> {
        return this.sectionService.items;
    }
    set sections(value: Array<SectionDto>) {
        this.sectionService.items = value;
    }
    get createSectionDialog(): boolean {
        return this.sectionService.createDialog;
    }
    set createSectionDialog(value: boolean) {
        this.sectionService.createDialog= value;
    }

    get vocabularysElement(): VocabularyDto {
        if( this._vocabularysElement == null )
            this._vocabularysElement = new VocabularyDto();
         return this._vocabularysElement;
    }

    set vocabularysElement(value: VocabularyDto) {
        this._vocabularysElement = value;
    }

    get validVocabularyQuizLibelle(): boolean {
        return this._validVocabularyQuizLibelle;
    }
    set validVocabularyQuizLibelle(value: boolean) {
        this._validVocabularyQuizLibelle = value;
    }

    get validSectionCode(): boolean {
        return this._validSectionCode;
    }
    set validSectionCode(value: boolean) {
        this._validSectionCode = value;
    }
    get validSectionLibelle(): boolean {
        return this._validSectionLibelle;
    }
    set validSectionLibelle(value: boolean) {
        this._validSectionLibelle = value;
    }

	get items(): Array<VocabularyQuizDto> {
        return this.service.items;
    }

    set items(value: Array<VocabularyQuizDto>) {
        this.service.items = value;
    }

    get item(): VocabularyQuizDto {
        return this.service.item;
    }

    set item(value: VocabularyQuizDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): VocabularyQuizCriteria {
        return this.service.criteria;
    }

    set criteria(value: VocabularyQuizCriteria) {
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
