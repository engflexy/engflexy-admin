import {Component, OnInit} from '@angular/core';


import {AbstractEditController} from 'src/app/zynerator/controller/AbstractEditController';

import {TypeTeacherAdminService} from 'src/app/shared/service/admin/prof/TypeTeacherAdmin.service';
import {TypeTeacherDto} from 'src/app/shared/model/prof/TypeTeacher.model';
import {TypeTeacherCriteria} from 'src/app/shared/criteria/prof/TypeTeacherCriteria.model';


@Component({
    selector: 'app-type-teacher-edit-admin',
    templateUrl: './type-teacher-edit-admin.component.html'
})
export class TypeTeacherEditAdminComponent extends AbstractEditController<TypeTeacherDto, TypeTeacherCriteria, TypeTeacherAdminService> implements OnInit {


    constructor(private typeTeacherService: TypeTeacherAdminService) {
        super(typeTeacherService);
    }

    private _validTypeTeacherLibelle = true;

    get validTypeTeacherLibelle(): boolean {
        return this._validTypeTeacherLibelle;
    }

    set validTypeTeacherLibelle(value: boolean) {
        this._validTypeTeacherLibelle = value;
    }

    private _validTypeTeacherCode = true;

    get validTypeTeacherCode(): boolean {
        return this._validTypeTeacherCode;
    }

    set validTypeTeacherCode(value: boolean) {
        this._validTypeTeacherCode = value;
    }

    ngOnInit(): void {
    }

    public override setValidation(value: boolean) {
        this.validTypeTeacherLibelle = value;
        this.validTypeTeacherCode = value;
    }

    public override validateForm(): void {
        this.errorMessages = new Array<string>();
        this.validateTypeTeacherLibelle();
        this.validateTypeTeacherCode();
    }

    public validateTypeTeacherLibelle() {
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
            this.errorMessages.push('Libelle non valide');
            this.validTypeTeacherLibelle = false;
        } else {
            this.validTypeTeacherLibelle = true;
        }
    }

    public validateTypeTeacherCode() {
        if (this.stringUtilService.isEmpty(this.item.code)) {
            this.errorMessages.push('Code non valide');
            this.validTypeTeacherCode = false;
        } else {
            this.validTypeTeacherCode = true;
        }
    }

}
