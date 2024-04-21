import {Component, OnInit} from '@angular/core';


import {AbstractViewController} from 'src/app/zynerator/controller/AbstractViewController';

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
    selector: 'app-categorie-prof-view-admin',
    templateUrl: './categorie-prof-view-admin.component.html'
})
export class CategorieProfViewAdminComponent extends AbstractViewController<CategorieProfDto, CategorieProfCriteria, CategorieProfAdminService> implements OnInit {

    profs = new ProfDto();
    profss: Array<ProfDto> = [];

    constructor(private categorieProfService: CategorieProfAdminService, private parcoursService: ParcoursAdminService, private typeTeacherService: TypeTeacherAdminService, private profService: ProfAdminService) {
        super(categorieProfService);
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

    ngOnInit(): void {
    }


}
