import {Component, OnInit, Input} from '@angular/core';


import {AbstractEditController} from 'src/app/zynerator/controller/AbstractEditController';

import {EtudiantClassRoomAdminService} from 'src/app/shared/service/admin/inscriptionref/EtudiantClassRoomAdmin.service';
import {EtudiantClassRoomDto} from 'src/app/shared/model/inscriptionref/EtudiantClassRoom.model';
import {EtudiantClassRoomCriteria} from 'src/app/shared/criteria/inscriptionref/EtudiantClassRoomCriteria.model';


import {EtudiantDto} from 'src/app/shared/model/inscription/Etudiant.model';
import {EtudiantAdminService} from 'src/app/shared/service/admin/inscription/EtudiantAdmin.service';
import {ClassRoomDto} from 'src/app/shared/model/inscriptionref/ClassRoom.model';
import {ClassRoomAdminService} from 'src/app/shared/service/admin/inscriptionref/ClassRoomAdmin.service';

@Component({
  selector: 'app-etudiant-class-room-edit-admin',
  templateUrl: './etudiant-class-room-edit-admin.component.html'
})
export class EtudiantClassRoomEditAdminComponent extends AbstractEditController<EtudiantClassRoomDto, EtudiantClassRoomCriteria, EtudiantClassRoomAdminService>   implements OnInit {



    private _validClassRoomLibelle = true;
    private _validClassRoomCode = true;
    private _validEtudiantRef = true;



    constructor( private etudiantClassRoomService: EtudiantClassRoomAdminService , private etudiantService: EtudiantAdminService, private classRoomService: ClassRoomAdminService) {
        super(etudiantClassRoomService);
    }

    ngOnInit(): void {
        this.classRoom = new ClassRoomDto();
        this.classRoomService.findAll().subscribe((data) => this.classRooms = data);
        this.etudiant = new EtudiantDto();
        this.etudiantService.findAll().subscribe((data) => this.etudiants = data);
    }


    public override setValidation(value: boolean){
        }
    public override validateForm(): void{
        this.errorMessages = new Array<string>();
    }



   public async openCreateClassRoom(classRoom: string) {
        const isPermistted = await this.roleService.isPermitted('ClassRoom', 'edit');
        if (isPermistted) {
             this.classRoom = new ClassRoomDto();
             this.createClassRoomDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
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
   get createClassRoomDialog(): boolean {
       return this.classRoomService.createDialog;
   }
  set createClassRoomDialog(value: boolean) {
       this.classRoomService.createDialog= value;
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
   get createEtudiantDialog(): boolean {
       return this.etudiantService.createDialog;
   }
  set createEtudiantDialog(value: boolean) {
       this.etudiantService.createDialog= value;
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
    get validEtudiantRef(): boolean {
        return this._validEtudiantRef;
    }
    set validEtudiantRef(value: boolean) {
        this._validEtudiantRef = value;
    }
}
