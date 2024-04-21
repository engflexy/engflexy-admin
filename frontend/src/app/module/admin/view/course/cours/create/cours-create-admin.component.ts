import {Component, OnInit} from '@angular/core';

import {AbstractCreateController} from 'src/app/zynerator/controller/AbstractCreateController';

import {CoursAdminService} from 'src/app/shared/service/admin/course/CoursAdmin.service';
import {CoursDto} from 'src/app/shared/model/course/Cours.model';
import {CoursCriteria} from 'src/app/shared/criteria/course/CoursCriteria.model';
import {ParcoursDto} from 'src/app/shared/model/course/Parcours.model';
import {ParcoursAdminService} from 'src/app/shared/service/admin/course/ParcoursAdmin.service';
import {CategorieSectionDto} from 'src/app/shared/model/courseref/CategorieSection.model';
import {CategorieSectionAdminService} from 'src/app/shared/service/admin/courseref/CategorieSectionAdmin.service';
import {EtatCoursDto} from 'src/app/shared/model/courseref/EtatCours.model';
import {EtatCoursAdminService} from 'src/app/shared/service/admin/courseref/EtatCoursAdmin.service';
import {SectionDto} from 'src/app/shared/model/course/Section.model';
import {SectionAdminService} from 'src/app/shared/service/admin/course/SectionAdmin.service';
import {TypeHomeWorkDto} from 'src/app/shared/model/homework/TypeHomeWork.model';
import {TypeHomeWorkAdminService} from 'src/app/shared/service/admin/homework/TypeHomeWorkAdmin.service';
import {HomeWorkDto} from 'src/app/shared/model/homework/HomeWork.model';
import {HomeWorkAdminService} from 'src/app/shared/service/admin/homework/HomeWorkAdmin.service';

@Component({
    selector: 'app-cours-create-admin',
    templateUrl: './cours-create-admin.component.html'
})
export class CoursCreateAdminComponent extends AbstractCreateController<CoursDto, CoursCriteria, CoursAdminService> implements OnInit {

    constructor(private coursService: CoursAdminService, private parcoursService: ParcoursAdminService, private categorieSectionService: CategorieSectionAdminService, private etatCoursService: EtatCoursAdminService, private sectionService: SectionAdminService, private typeHomeWorkService: TypeHomeWorkAdminService, private homeWorkService: HomeWorkAdminService) {
        super(coursService);
    }

    private _sectionsElement = new SectionDto();

    get sectionsElement(): SectionDto {
        if (this._sectionsElement == null)
            this._sectionsElement = new SectionDto();
        return this._sectionsElement;
    }

    set sectionsElement(value: SectionDto) {
        this._sectionsElement = value;
    }

    private _homeWorksElement = new HomeWorkDto();

    get homeWorksElement(): HomeWorkDto {
        if (this._homeWorksElement == null)
            this._homeWorksElement = new HomeWorkDto();
        return this._homeWorksElement;
    }

    set homeWorksElement(value: HomeWorkDto) {
        this._homeWorksElement = value;
    }

    private _validCoursCode = true;

    get validCoursCode(): boolean {
        return this._validCoursCode;
    }

    set validCoursCode(value: boolean) {
        this._validCoursCode = value;
    }

    private _validCoursLibelle = true;

    get validCoursLibelle(): boolean {
        return this._validCoursLibelle;
    }

    set validCoursLibelle(value: boolean) {
        this._validCoursLibelle = value;
    }

    private _validEtatCoursCode = true;

    get validEtatCoursCode(): boolean {
        return this._validEtatCoursCode;
    }

    set validEtatCoursCode(value: boolean) {
        this._validEtatCoursCode = value;
    }

    private _validEtatCoursLibelle = true;

    get validEtatCoursLibelle(): boolean {
        return this._validEtatCoursLibelle;
    }

    set validEtatCoursLibelle(value: boolean) {
        this._validEtatCoursLibelle = value;
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

    private _validSectionsCode = true;

    get validSectionsCode(): boolean {
        return this._validSectionsCode;
    }

    set validSectionsCode(value: boolean) {
        this._validSectionsCode = value;
    }

    private _validHomeWorksLibelle = true;

    get validHomeWorksLibelle(): boolean {
        return this._validHomeWorksLibelle;
    }

    set validHomeWorksLibelle(value: boolean) {
        this._validHomeWorksLibelle = value;
    }

    get typeHomeWork(): TypeHomeWorkDto {
        return this.typeHomeWorkService.item;
    }

    set typeHomeWork(value: TypeHomeWorkDto) {
        this.typeHomeWorkService.item = value;
    }

    get typeHomeWorks(): Array<TypeHomeWorkDto> {
        return this.typeHomeWorkService.items;
    }

    set typeHomeWorks(value: Array<TypeHomeWorkDto>) {
        this.typeHomeWorkService.items = value;
    }

    get createTypeHomeWorkDialog(): boolean {
        return this.typeHomeWorkService.createDialog;
    }

    set createTypeHomeWorkDialog(value: boolean) {
        this.typeHomeWorkService.createDialog = value;
    }

    get etatCours(): EtatCoursDto {
        return this.etatCoursService.item;
    }

    set etatCours(value: EtatCoursDto) {
        this.etatCoursService.item = value;
    }

    get etatCourss(): Array<EtatCoursDto> {
        return this.etatCoursService.items;
    }

    set etatCourss(value: Array<EtatCoursDto>) {
        this.etatCoursService.items = value;
    }

    get createEtatCoursDialog(): boolean {
        return this.etatCoursService.createDialog;
    }

    set createEtatCoursDialog(value: boolean) {
        this.etatCoursService.createDialog = value;
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

    get categorieSection(): CategorieSectionDto {
        return this.categorieSectionService.item;
    }

    set categorieSection(value: CategorieSectionDto) {
        this.categorieSectionService.item = value;
    }

    get categorieSections(): Array<CategorieSectionDto> {
        return this.categorieSectionService.items;
    }

    set categorieSections(value: Array<CategorieSectionDto>) {
        this.categorieSectionService.items = value;
    }

    get createCategorieSectionDialog(): boolean {
        return this.categorieSectionService.createDialog;
    }

    set createCategorieSectionDialog(value: boolean) {
        this.categorieSectionService.createDialog = value;
    }

    ngOnInit(): void {
        this.sectionsElement.categorieSection = new CategorieSectionDto();
        this.categorieSectionService.findAll().subscribe((data) => this.categorieSections = data);
        this.homeWorksElement.typeHomeWork = new TypeHomeWorkDto();
        this.typeHomeWorkService.findAll().subscribe((data) => this.typeHomeWorks = data);
        this.etatCours = new EtatCoursDto();
        this.etatCoursService.findAll().subscribe((data) => this.etatCourss = data);
        this.parcours = new ParcoursDto();
        this.parcoursService.findAll().subscribe((data) => this.parcourss = data);
    }

    validateSections() {
        this.errorMessages = [];
        this.validateSectionsCode();
    }

    validateHomeWorks() {
        this.errorMessages = [];
        this.validateHomeWorksLibelle();
    }

    public override setValidation(value: boolean) {
        this.validCoursCode = value;
        this.validCoursLibelle = value;
        this.validSectionsCode = value;
        this.validHomeWorksLibelle = value;
    }

    public addSections() {
        if (this.item.sections == null)
            this.item.sections = new Array<SectionDto>();
        this.validateSections();
        if (this.errorMessages.length === 0) {
            this.item.sections.push({...this.sectionsElement});
            this.sectionsElement = new SectionDto();
        } else {
            this.messageService.add({
                severity: 'error',
                summary: 'Erreurs',
                detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages
            });
        }
    }

    public deletesections(p: SectionDto) {
        this.item.sections.forEach((element, index) => {
            if (element === p) {
                this.item.sections.splice(index, 1);
            }
        });
    }

    public editsections(p: SectionDto) {
        this.sectionsElement = {...p};
        this.activeTab = 0;
    }

    public addHomeWorks() {
        if (this.item.homeWorks == null)
            this.item.homeWorks = new Array<HomeWorkDto>();
        this.validateHomeWorks();
        if (this.errorMessages.length === 0) {
            this.item.homeWorks.push({...this.homeWorksElement});
            this.homeWorksElement = new HomeWorkDto();
        } else {
            this.messageService.add({
                severity: 'error',
                summary: 'Erreurs',
                detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages
            });
        }
    }

    public deletehomeWorks(p: HomeWorkDto) {
        this.item.homeWorks.forEach((element, index) => {
            if (element === p) {
                this.item.homeWorks.splice(index, 1);
            }
        });
    }

    public edithomeWorks(p: HomeWorkDto) {
        this.homeWorksElement = {...p};
        this.activeTab = 0;
    }

    public override validateForm(): void {
        this.errorMessages = new Array<string>();
        this.validateCoursCode();
        this.validateCoursLibelle();
    }

    public validateCoursCode() {
        if (this.stringUtilService.isEmpty(this.item.code)) {
            this.errorMessages.push('Code non valide');
            this.validCoursCode = false;
        } else {
            this.validCoursCode = true;
        }
    }

    public validateCoursLibelle() {
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
            this.errorMessages.push('Libelle non valide');
            this.validCoursLibelle = false;
        } else {
            this.validCoursLibelle = true;
        }
    }

    public validateSectionsCode() {
        if (this.sectionsElement.code == null) {
            this.errorMessages.push('Code de la section est  invalide');
            this.validSectionsCode = false;
        } else {
            this.validSectionsCode = true;
        }
    }

    public validateHomeWorksLibelle() {
        if (this.homeWorksElement.libelle == null) {
            this.errorMessages.push('Libelle de la homeWork est  invalide');
            this.validHomeWorksLibelle = false;
        } else {
            this.validHomeWorksLibelle = true;
        }
    }

    public async openCreateParcours(parcours: string) {
        const isPermistted = await this.roleService.isPermitted('Parcours', 'add');
        if (isPermistted) {
            this.parcours = new ParcoursDto();
            this.createParcoursDialog = true;
        } else {
            this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }

}
