import {Component, OnInit} from '@angular/core';

import {AbstractCreateController} from 'src/app/zynerator/controller/AbstractCreateController';

import {CategorieProfAdminService} from 'src/app/shared/service/admin/prof/CategorieProfAdmin.service';
import {CategorieProfDto} from 'src/app/shared/model/prof/CategorieProf.model';
import {CategorieProfCriteria} from 'src/app/shared/criteria/prof/CategorieProfCriteria.model';
import {ParcoursDto} from 'src/app/shared/model/course/Parcours.model';
import {ParcoursAdminService} from 'src/app/shared/service/admin/course/ParcoursAdmin.service';
import {TypeTeacherDto} from 'src/app/shared/model/prof/TypeTeacher.model';
import {TypeTeacherAdminService} from 'src/app/shared/service/admin/prof/TypeTeacherAdmin.service';
import {ProfDto} from 'src/app/shared/model/prof/Prof.model';
import {ProfAdminService} from 'src/app/shared/service/admin/prof/ProfAdmin.service';

@Component({
    selector: 'app-categorie-prof-create-admin',
    templateUrl: './categorie-prof-create-admin.component.html'
})
export class CategorieProfCreateAdminComponent extends AbstractCreateController<CategorieProfDto, CategorieProfCriteria, CategorieProfAdminService> implements OnInit {

    constructor(private categorieProfService: CategorieProfAdminService, private parcoursService: ParcoursAdminService, private typeTeacherService: TypeTeacherAdminService, private profService: ProfAdminService) {
        super(categorieProfService);
    }

    private _profsElement = new ProfDto();

    get profsElement(): ProfDto {
        if (this._profsElement == null)
            this._profsElement = new ProfDto();
        return this._profsElement;
    }

    set profsElement(value: ProfDto) {
        this._profsElement = value;
    }

    private _validCategorieProfCode = true;

    get validCategorieProfCode(): boolean {
        return this._validCategorieProfCode;
    }

    set validCategorieProfCode(value: boolean) {
        this._validCategorieProfCode = value;
    }

    private _validProfsRef = true;

    get validProfsRef(): boolean {
        return this._validProfsRef;
    }

    set validProfsRef(value: boolean) {
        this._validProfsRef = value;
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

    get typeTeacher(): TypeTeacherDto {
        return this.typeTeacherService.item;
    }

    set typeTeacher(value: TypeTeacherDto) {
        this.typeTeacherService.item = value;
    }

    get typeTeachers(): Array<TypeTeacherDto> {
        return this.typeTeacherService.items;
    }

    set typeTeachers(value: Array<TypeTeacherDto>) {
        this.typeTeacherService.items = value;
    }

    get createTypeTeacherDialog(): boolean {
        return this.typeTeacherService.createDialog;
    }

    set createTypeTeacherDialog(value: boolean) {
        this.typeTeacherService.createDialog = value;
    }

    ngOnInit(): void {
        this.profsElement.parcours = new ParcoursDto();
        this.parcoursService.findAll().subscribe((data) => this.parcourss = data);
        this.profsElement.typeTeacher = new TypeTeacherDto();
        this.typeTeacherService.findAll().subscribe((data) => this.typeTeachers = data);
    }

    validateProfs() {
        this.errorMessages = [];
        this.validateProfsRef();
    }

    public override setValidation(value: boolean) {
        this.validCategorieProfCode = value;
        this.validProfsRef = value;
    }

    public addProfs() {
        if (this.item.profs == null)
            this.item.profs = new Array<ProfDto>();
        this.validateProfs();
        if (this.errorMessages.length === 0) {
            this.item.profs.push({...this.profsElement});
            this.profsElement = new ProfDto();
        } else {
            this.messageService.add({
                severity: 'error',
                summary: 'Erreurs',
                detail: 'Merci de corrigé les erreurs suivant : ' + this.errorMessages
            });
        }
    }

    public deleteprofs(p: ProfDto) {
        this.item.profs.forEach((element, index) => {
            if (element === p) {
                this.item.profs.splice(index, 1);
            }
        });
    }

    public editprofs(p: ProfDto) {
        this.profsElement = {...p};
        this.activeTab = 0;
    }

    public override validateForm(): void {
        this.errorMessages = new Array<string>();
        this.validateCategorieProfCode();
    }

    public validateCategorieProfCode() {
        if (this.stringUtilService.isEmpty(this.item.code)) {
            this.errorMessages.push('Code non valide');
            this.validCategorieProfCode = false;
        } else {
            this.validCategorieProfCode = true;
        }
    }

    public validateProfsRef() {
        if (this.profsElement.ref == null) {
            this.errorMessages.push('Ref de la prof est  invalide');
            this.validProfsRef = false;
        } else {
            this.validProfsRef = true;
        }
    }

    public async openCreateTypeTeacher(typeTeacher: string) {
        const isPermistted = await this.roleService.isPermitted('TypeTeacher', 'add');
        if (isPermistted) {
            this.typeTeacher = new TypeTeacherDto();
            this.createTypeTeacherDialog = true;
        } else {
            this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }

}
