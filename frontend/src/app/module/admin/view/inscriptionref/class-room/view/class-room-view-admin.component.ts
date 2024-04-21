import {Component, OnInit} from '@angular/core';


import {AbstractViewController} from 'src/app/zynerator/controller/AbstractViewController';
import { environment } from 'src/environments/environment';

import {ClassRoomAdminService} from 'src/app/shared/service/admin/inscriptionref/ClassRoomAdmin.service';
import {ClassRoomDto} from 'src/app/shared/model/inscriptionref/ClassRoom.model';
import {ClassRoomCriteria} from 'src/app/shared/criteria/inscriptionref/ClassRoomCriteria.model';

@Component({
  selector: 'app-class-room-view-admin',
  templateUrl: './class-room-view-admin.component.html'
})
export class ClassRoomViewAdminComponent extends AbstractViewController<ClassRoomDto, ClassRoomCriteria, ClassRoomAdminService> implements OnInit {


    constructor(private classRoomService: ClassRoomAdminService){
        super(classRoomService);
    }

    ngOnInit(): void {
    }




}
