import {Component, OnInit, Input} from '@angular/core';


import {AbstractEditController} from 'src/app/zynerator/controller/AbstractEditController';

import {EtatEtudiantScheduleAdminService} from 'src/app/shared/service/admin/inscriptionref/EtatEtudiantScheduleAdmin.service';
import {EtatEtudiantScheduleDto} from 'src/app/shared/model/inscriptionref/EtatEtudiantSchedule.model';
import {EtatEtudiantScheduleCriteria} from 'src/app/shared/criteria/inscriptionref/EtatEtudiantScheduleCriteria.model';



@Component({
  selector: 'app-etat-etudiant-schedule-edit-admin',
  templateUrl: './etat-etudiant-schedule-edit-admin.component.html'
})
export class EtatEtudiantScheduleEditAdminComponent extends AbstractEditController<EtatEtudiantScheduleDto, EtatEtudiantScheduleCriteria, EtatEtudiantScheduleAdminService>   implements OnInit {


    private _validEtatEtudiantScheduleCode = true;
    private _validEtatEtudiantScheduleLibelle = true;




    constructor( private etatEtudiantScheduleService: EtatEtudiantScheduleAdminService ) {
        super(etatEtudiantScheduleService);
    }

    ngOnInit(): void {
    }


    public override setValidation(value: boolean){
        this.validEtatEtudiantScheduleCode = value;
        this.validEtatEtudiantScheduleLibelle = value;
        }
    public override validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateEtatEtudiantScheduleCode();
        this.validateEtatEtudiantScheduleLibelle();
    }
    public validateEtatEtudiantScheduleCode(){
        if (this.stringUtilService.isEmpty(this.item.code)) {
            this.errorMessages.push('Code non valide');
            this.validEtatEtudiantScheduleCode = false;
        } else {
            this.validEtatEtudiantScheduleCode = true;
        }
    }
    public validateEtatEtudiantScheduleLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
            this.errorMessages.push('Libelle non valide');
            this.validEtatEtudiantScheduleLibelle = false;
        } else {
            this.validEtatEtudiantScheduleLibelle = true;
        }
    }






    get validEtatEtudiantScheduleCode(): boolean {
        return this._validEtatEtudiantScheduleCode;
    }
    set validEtatEtudiantScheduleCode(value: boolean) {
        this._validEtatEtudiantScheduleCode = value;
    }
    get validEtatEtudiantScheduleLibelle(): boolean {
        return this._validEtatEtudiantScheduleLibelle;
    }
    set validEtatEtudiantScheduleLibelle(value: boolean) {
        this._validEtatEtudiantScheduleLibelle = value;
    }

}
