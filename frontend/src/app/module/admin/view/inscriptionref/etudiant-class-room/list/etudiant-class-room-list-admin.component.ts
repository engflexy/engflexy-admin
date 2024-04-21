import {Component, OnInit} from '@angular/core';
import {EtudiantClassRoomAdminService} from 'src/app/shared/service/admin/inscriptionref/EtudiantClassRoomAdmin.service';
import {EtudiantClassRoomDto} from 'src/app/shared/model/inscriptionref/EtudiantClassRoom.model';
import {EtudiantClassRoomCriteria} from 'src/app/shared/criteria/inscriptionref/EtudiantClassRoomCriteria.model';
import {AbstractListController} from 'src/app/zynerator/controller/AbstractListController';
import { environment } from 'src/environments/environment';

import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantAdminService} from 'src/app/shared/service/admin/inscription/EtudiantAdmin.service';
import {ClassRoomDto} from 'src/app/shared/model/inscriptionref/ClassRoom.model';
import {ClassRoomAdminService} from 'src/app/shared/service/admin/inscriptionref/ClassRoomAdmin.service';


@Component({
  selector: 'app-etudiant-class-room-list-admin',
  templateUrl: './etudiant-class-room-list-admin.component.html'
})
export class EtudiantClassRoomListAdminComponent extends AbstractListController<EtudiantClassRoomDto, EtudiantClassRoomCriteria, EtudiantClassRoomAdminService>  implements OnInit {

    override fileName = 'EtudiantClassRoom';


    classRooms: Array<ClassRoomDto>;
    etudiants: Array<EtudiantDto>;


    constructor( private etudiantClassRoomService: EtudiantClassRoomAdminService  , private etudiantService: EtudiantAdminService, private classRoomService: ClassRoomAdminService) {
        super(etudiantClassRoomService);
    }

    ngOnInit(): void {
        this.activateSecurityConstraint('EtudiantClassRoom').subscribe(() => {
            if (true || this.listActionIsValid){
                this.findPaginatedByCriteria();
                this.initExport();
                this.initCol();
                this.loadClassRoom();
                this.loadEtudiant();
            }
        });
    }


    public override  initCol() {
        this.cols = [
            {field: 'classRoom?.code', header: 'Class room'},
            {field: 'etudiant?.ref', header: 'Etudiant'},
        ];
    }


    public async loadClassRoom(){
       this.classRoomService.findAllOptimized().subscribe(classRooms => this.classRooms = classRooms, error => console.log(error))
    }
    public async loadEtudiant(){
       this.etudiantService.findAllOptimized().subscribe(etudiants => this.etudiants = etudiants, error => console.log(error))
    }



   public  override prepareColumnExport(): void {
        this.exportData = this.items.map(e => {
            return {
                'Class room': e.classRoom?.code ,
                'Etudiant': e.etudiant?.ref ,
            }
        });

        this.criteriaData = [{
        //'Class room': this.criteria.classRoom?.code ? this.criteria.classRoom?.code : environment.emptyForExport ,
        //'Etudiant': this.criteria.etudiant?.ref ? this.criteria.etudiant?.ref : environment.emptyForExport ,
        }];
      }
}
