import {Component, OnInit} from '@angular/core';
import {EtatEtudiantScheduleAdminService} from 'src/app/shared/service/admin/inscriptionref/EtatEtudiantScheduleAdmin.service';
import {EtatEtudiantScheduleDto} from 'src/app/shared/model/inscriptionref/EtatEtudiantSchedule.model';
import {EtatEtudiantScheduleCriteria} from 'src/app/shared/criteria/inscriptionref/EtatEtudiantScheduleCriteria.model';
import {AbstractListController} from 'src/app/zynerator/controller/AbstractListController';
import { environment } from 'src/environments/environment';



@Component({
  selector: 'app-etat-etudiant-schedule-list-admin',
  templateUrl: './etat-etudiant-schedule-list-admin.component.html'
})
export class EtatEtudiantScheduleListAdminComponent extends AbstractListController<EtatEtudiantScheduleDto, EtatEtudiantScheduleCriteria, EtatEtudiantScheduleAdminService>  implements OnInit {

    override fileName = 'EtatEtudiantSchedule';




    constructor( private etatEtudiantScheduleService: EtatEtudiantScheduleAdminService  ) {
        super(etatEtudiantScheduleService);
    }

    ngOnInit(): void {
        this.activateSecurityConstraint('EtatEtudiantSchedule').subscribe(() => {
            if (true || this.listActionIsValid){
                this.findPaginatedByCriteria();
                this.initExport();
                this.initCol();
            }
        });
    }


    public override  initCol() {
        this.cols = [
            {field: 'code', header: 'Code'},
            {field: 'libelle', header: 'Libelle'},
        ];
    }





   public  override prepareColumnExport(): void {
        this.exportData = this.items.map(e => {
            return {
                 'Code': e.code ,
                 'Libelle': e.libelle ,
            }
        });

        this.criteriaData = [{
            'Code': this.criteria.code ? this.criteria.code : environment.emptyForExport ,
            'Libelle': this.criteria.libelle ? this.criteria.libelle : environment.emptyForExport ,
        }];
      }
}
