import {Component, OnInit} from '@angular/core';
import {ClassRoomAdminService} from 'src/app/shared/service/admin/inscriptionref/ClassRoomAdmin.service';
import {ClassRoomDto} from 'src/app/shared/model/inscriptionref/ClassRoom.model';
import {ClassRoomCriteria} from 'src/app/shared/criteria/inscriptionref/ClassRoomCriteria.model';
import {AbstractListController} from 'src/app/zynerator/controller/AbstractListController';
import { environment } from 'src/environments/environment';



@Component({
  selector: 'app-class-room-list-admin',
  templateUrl: './class-room-list-admin.component.html'
})
export class ClassRoomListAdminComponent extends AbstractListController<ClassRoomDto, ClassRoomCriteria, ClassRoomAdminService>  implements OnInit {

    override fileName = 'ClassRoom';




    constructor( private classRoomService: ClassRoomAdminService  ) {
        super(classRoomService);
    }

    ngOnInit(): void {
        this.activateSecurityConstraint('ClassRoom').subscribe(() => {
            if (true || this.listActionIsValid){
                this.findPaginatedByCriteria();
                this.initExport();
                this.initCol();
            }
        });
    }


    public override  initCol() {
        this.cols = [
            {field: 'libelle', header: 'Libelle'},
            {field: 'code', header: 'Code'},
        ];
    }





   public  override prepareColumnExport(): void {
        this.exportData = this.items.map(e => {
            return {
                 'Libelle': e.libelle ,
                 'Code': e.code ,
            }
        });

        this.criteriaData = [{
            'Libelle': this.criteria.libelle ? this.criteria.libelle : environment.emptyForExport ,
            'Code': this.criteria.code ? this.criteria.code : environment.emptyForExport ,
        }];
      }
}
