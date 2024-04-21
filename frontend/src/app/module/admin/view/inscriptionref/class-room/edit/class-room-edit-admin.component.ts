import {Component, OnInit, Input} from '@angular/core';


import {AbstractEditController} from 'src/app/zynerator/controller/AbstractEditController';

import {ClassRoomAdminService} from 'src/app/shared/service/admin/inscriptionref/ClassRoomAdmin.service';
import {ClassRoomDto} from 'src/app/shared/model/inscriptionref/ClassRoom.model';
import {ClassRoomCriteria} from 'src/app/shared/criteria/inscriptionref/ClassRoomCriteria.model';



@Component({
  selector: 'app-class-room-edit-admin',
  templateUrl: './class-room-edit-admin.component.html'
})
export class ClassRoomEditAdminComponent extends AbstractEditController<ClassRoomDto, ClassRoomCriteria, ClassRoomAdminService>   implements OnInit {


    private _validClassRoomLibelle = true;
    private _validClassRoomCode = true;




    constructor( private classRoomService: ClassRoomAdminService ) {
        super(classRoomService);
    }

    ngOnInit(): void {
    }


    public override setValidation(value: boolean){
        this.validClassRoomLibelle = value;
        this.validClassRoomCode = value;
        }
    public override validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validateClassRoomLibelle();
        this.validateClassRoomCode();
    }
    public validateClassRoomLibelle(){
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
            this.errorMessages.push('Libelle non valide');
            this.validClassRoomLibelle = false;
        } else {
            this.validClassRoomLibelle = true;
        }
    }
    public validateClassRoomCode(){
        if (this.stringUtilService.isEmpty(this.item.code)) {
            this.errorMessages.push('Code non valide');
            this.validClassRoomCode = false;
        } else {
            this.validClassRoomCode = true;
        }
    }






    get validClassRoomLibelle(): boolean {
        return this._validClassRoomLibelle;
    }
    set validClassRoomLibelle(value: boolean) {
        this._validClassRoomLibelle = value;
    }
    get validClassRoomCode(): boolean {
        return this._validClassRoomCode;
    }
    set validClassRoomCode(value: boolean) {
        this._validClassRoomCode = value;
    }

}
