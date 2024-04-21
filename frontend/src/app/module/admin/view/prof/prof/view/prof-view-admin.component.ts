import {Component, OnInit} from '@angular/core';


import {AbstractViewController} from 'src/app/zynerator/controller/AbstractViewController';

import {ProfAdminService} from 'src/app/shared/service/admin/prof/ProfAdmin.service';
import {ProfDto} from 'src/app/shared/model/prof/Prof.model';
import {ProfCriteria} from 'src/app/shared/criteria/prof/ProfCriteria.model';

import {ParcoursDto} from 'src/app/shared/model/course/Parcours.model';
import {ParcoursAdminService} from 'src/app/shared/service/admin/course/ParcoursAdmin.service';
import {TypeTeacherDto} from 'src/app/shared/model/prof/TypeTeacher.model';
import {TypeTeacherAdminService} from 'src/app/shared/service/admin/prof/TypeTeacherAdmin.service';
import {RecommendTeacherDto} from 'src/app/shared/model/recomrecla/RecommendTeacher.model';
import {RecommendTeacherAdminService} from 'src/app/shared/service/admin/recomrecla/RecommendTeacherAdmin.service';
import {CategorieProfDto} from 'src/app/shared/model/prof/CategorieProf.model';
import {CategorieProfAdminService} from 'src/app/shared/service/admin/prof/CategorieProfAdmin.service';
import {TrancheHoraireProfDto} from 'src/app/shared/model/prof/TrancheHoraireProf.model';
import {TrancheHoraireProfAdminService} from 'src/app/shared/service/admin/prof/TrancheHoraireProfAdmin.service';
import {ClassRoomDto} from 'src/app/shared/model/inscriptionref/ClassRoom.model';
import {ClassRoomAdminService} from 'src/app/shared/service/admin/inscriptionref/ClassRoomAdmin.service';

@Component({
    selector: 'app-prof-view-admin',
    templateUrl: './prof-view-admin.component.html'
})
export class ProfViewAdminComponent extends AbstractViewController<ProfDto, ProfCriteria, ProfAdminService> implements OnInit {

    trancheHoraireProfs = new TrancheHoraireProfDto();
    trancheHoraireProfss: Array<TrancheHoraireProfDto> = [];
    classRooms = new ClassRoomDto();
    classRoomss: Array<ClassRoomDto> = [];
    recommendTeachers = new RecommendTeacherDto();
    recommendTeacherss: Array<RecommendTeacherDto> = [];

    constructor(private profService: ProfAdminService, private parcoursService: ParcoursAdminService, private typeTeacherService: TypeTeacherAdminService, private recommendTeacherService: RecommendTeacherAdminService, private categorieProfService: CategorieProfAdminService, private trancheHoraireProfService: TrancheHoraireProfAdminService, private classRoomService: ClassRoomAdminService) {
        super(profService);
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

    get categorieProf(): CategorieProfDto {
        return this.categorieProfService.item;
    }

    set categorieProf(value: CategorieProfDto) {
        this.categorieProfService.item = value;
    }

    get categorieProfs(): Array<CategorieProfDto> {
        return this.categorieProfService.items;
    }

    set categorieProfs(value: Array<CategorieProfDto>) {
        this.categorieProfService.items = value;
    }

    ngOnInit(): void {
    }


}
