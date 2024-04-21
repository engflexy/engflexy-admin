import {Component, OnInit} from '@angular/core';


import {AbstractViewController} from 'src/app/zynerator/controller/AbstractViewController';
import { environment } from 'src/environments/environment';

import {EtudiantClassRoomAdminService} from 'src/app/shared/service/admin/inscriptionref/EtudiantClassRoomAdmin.service';
import {EtudiantClassRoomDto} from 'src/app/shared/model/inscriptionref/EtudiantClassRoom.model';
import {EtudiantClassRoomCriteria} from 'src/app/shared/criteria/inscriptionref/EtudiantClassRoomCriteria.model';

import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantAdminService} from 'src/app/shared/service/admin/inscription/EtudiantAdmin.service';
import {ClassRoomDto} from 'src/app/shared/model/inscriptionref/ClassRoom.model';
import {ClassRoomAdminService} from 'src/app/shared/service/admin/inscriptionref/ClassRoomAdmin.service';
@Component({
  selector: 'app-etudiant-class-room-view-admin',
  templateUrl: './etudiant-class-room-view-admin.component.html'
})
export class EtudiantClassRoomViewAdminComponent extends AbstractViewController<EtudiantClassRoomDto, EtudiantClassRoomCriteria, EtudiantClassRoomAdminService> implements OnInit {


    constructor(private etudiantClassRoomService: EtudiantClassRoomAdminService, private etudiantService: EtudiantAdminService, private classRoomService: ClassRoomAdminService){
        super(etudiantClassRoomService);
    }

    ngOnInit(): void {
    }


    get classRoom(): ClassRoomDto {
       return this.classRoomService.item;
    }
    set classRoom(value: ClassRoomDto) {
        this.classRoomService.item = value;
    }
    get classRooms(): Array<ClassRoomDto> {
       return this.classRoomService.items;
    }
    set classRooms(value: Array<ClassRoomDto>) {
        this.classRoomService.items = value;
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


}
