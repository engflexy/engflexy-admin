import {Component, OnInit} from '@angular/core';

import {AbstractCreateController} from 'src/app/zynerator/controller/AbstractCreateController';

import {VocabularyAdminService} from 'src/app/shared/service/admin/vocab/VocabularyAdmin.service';
import {VocabularyDto} from 'src/app/shared/model/vocab/Vocabulary.model';
import {VocabularyCriteria} from 'src/app/shared/criteria/vocab/VocabularyCriteria.model';
import {VocabularyQuizDto} from 'src/app/shared/model/vocab/VocabularyQuiz.model';
import {VocabularyQuizAdminService} from 'src/app/shared/service/admin/vocab/VocabularyQuizAdmin.service';
import {SectionDto} from 'src/app/shared/model/course/Section.model';
import {SectionAdminService} from 'src/app/shared/service/admin/course/SectionAdmin.service';

@Component({
    selector: 'app-vocabulary-create-admin',
    templateUrl: './vocabulary-create-admin.component.html'
})
export class VocabularyCreateAdminComponent extends AbstractCreateController<VocabularyDto, VocabularyCriteria, VocabularyAdminService> implements OnInit {


    constructor(private vocabularyService: VocabularyAdminService, private vocabularyQuizService: VocabularyQuizAdminService, private sectionService: SectionAdminService) {
        super(vocabularyService);
    }

    private _validSectionCode = true;

    get validSectionCode(): boolean {
        return this._validSectionCode;
    }

    set validSectionCode(value: boolean) {
        this._validSectionCode = value;
    }

    private _validVocabularyQuizLibelle = true;

    get validVocabularyQuizLibelle(): boolean {
        return this._validVocabularyQuizLibelle;
    }

    set validVocabularyQuizLibelle(value: boolean) {
        this._validVocabularyQuizLibelle = value;
    }

    get vocabularyQuiz(): VocabularyQuizDto {
        return this.vocabularyQuizService.item;
    }

    set vocabularyQuiz(value: VocabularyQuizDto) {
        this.vocabularyQuizService.item = value;
    }

    get vocabularyQuizs(): Array<VocabularyQuizDto> {
        return this.vocabularyQuizService.items;
    }

    set vocabularyQuizs(value: Array<VocabularyQuizDto>) {
        this.vocabularyQuizService.items = value;
    }

    get createVocabularyQuizDialog(): boolean {
        return this.vocabularyQuizService.createDialog;
    }

    set createVocabularyQuizDialog(value: boolean) {
        this.vocabularyQuizService.createDialog = value;
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
        this.sectionService.createDialog = value;
    }

    ngOnInit(): void {
        this.section = new SectionDto();
        this.sectionService.findAll().subscribe((data) => this.sections = data);
        this.vocabularyQuiz = new VocabularyQuizDto();
        this.vocabularyQuizService.findAll().subscribe((data) => this.vocabularyQuizs = data);
    }

    public override setValidation(value: boolean) {
    }

    public override validateForm(): void {
        this.errorMessages = new Array<string>();
    }

    public async openCreateVocabularyQuiz(vocabularyQuiz: string) {
        const isPermistted = await this.roleService.isPermitted('VocabularyQuiz', 'add');
        if (isPermistted) {
            this.vocabularyQuiz = new VocabularyQuizDto();
            this.createVocabularyQuizDialog = true;
        } else {
            this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }


}
