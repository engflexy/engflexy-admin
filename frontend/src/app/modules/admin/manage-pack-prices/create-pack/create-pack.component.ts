import {Component, Inject, OnInit, PLATFORM_ID} from '@angular/core';
import {DatePipe, NgForOf, NgIf} from "@angular/common";
import {RoleService} from "../../../../zynerator/security/shared/service/Role.service";
import {Router} from "@angular/router";
import {StringUtilService} from "../../../../zynerator/util/StringUtil.service";
import {MatDialogModule, MatDialogRef} from "@angular/material/dialog";
import {FuseAlertService} from "../../../../../@fuse/components/alert";
import {
    PackageCollaboratorCollaboratorService
} from "../../../../shared/service/collaborator/collab/PackageCollaboratorCollaborator.service";
import {PackageCollaboratorDto} from "../../../../shared/model/collab/PackageCollaborator.model";
import {PackageCollaboratorCriteria} from "../../../../shared/criteria/collab/PackageCollaboratorCriteria.model";
import {environment} from "../../../../../environments/environment";
import {MatInputModule} from "@angular/material/input";
import {FormsModule} from "@angular/forms";
import {MatButtonModule} from "@angular/material/button";
import {ParcoursDto} from "../../../../shared/model/course/Parcours.model";
import {PriceDto} from "../../../../shared/model/price/Price.model";
import {PackStudentAdminService} from "../../../../shared/service/admin/pack/PackStudentAdmin.service";
import {ParcoursAdminService} from "../../../../shared/service/admin/course/ParcoursAdmin.service";
import {PriceAdminService} from "../../../../shared/service/admin/price/PriceAdmin.service";
import {PackStudentDto} from "../../../../shared/model/pack/PackStudent.model";
import {PackStudentCriteria} from "../../../../shared/criteria/pack/PackStudentCriteria.model";
import {MatCheckboxModule} from "@angular/material/checkbox";
import {MatAutocompleteModule} from "@angular/material/autocomplete";
import {
    PackageCollaboratorAdminService
} from "../../../../shared/service/admin/collab/PackageCollaboratorAdmin.service";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatIconModule} from "@angular/material/icon";
import {MatTooltipModule} from "@angular/material/tooltip";
import {TranslocoModule} from "@ngneat/transloco";
import {MatSelectModule} from "@angular/material/select";
import {
    InscriptionCollaboratorCollaboratorService
} from "../../../../shared/service/collaborator/collab/InscriptionCollaboratorCollaborator.service";

@Component({
    selector: 'app-create-pack',
    templateUrl: './create-pack.component.html',
    imports: [
        MatButtonModule,
        MatDialogModule,
        MatFormFieldModule,
        MatInputModule,
        NgIf,
        MatAutocompleteModule,
        NgForOf,
        MatIconModule,
        MatTooltipModule,
        TranslocoModule,
        FormsModule,
        MatCheckboxModule,
        MatSelectModule,
        MatDialogModule
    ],
    standalone: true
})
export class CreatePackComponent implements OnInit{
    protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;





    private _validPackageCollaboratorLibelle = true;

    constructor(public refDialog: MatDialogRef<CreatePackComponent>, private alert: FuseAlertService, private service: PackageCollaboratorCollaboratorService,private serviceInscriptionCollaborator: InscriptionCollaboratorCollaboratorService , @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.resetForm()

    }


    public resetForm(): void {
        this.item = new PackageCollaboratorDto();
        this._submitted = false;
        this._errorMessages = [];
        this._validPackageCollaboratorLibelle = true;
        if (this.activeStatus === 3) {
            this.item.school = true; // Set to true for school
        } else {
            this.item.school = false; // Set to false for teacher
        }

    }


    public save(): void {
        this.submitted = true;
        this.validateForm();
        if (this.errorMessages.length === 0) {
            this.saveWithShowOption(false);
        } else {
            this.alert.show('info', 'something went wrong!, please try again.');
        }
    }

    public saveWithShowOption(showList: boolean) {
        this.service.save().subscribe(item => {
            if (item != null) {
                this.items.push({...item});
                this.item = new PackageCollaboratorDto();
                this.alert.show('info', 'Pack successfully created!');
                this.refDialog.close()
            } else {
                this.alert.show('info', 'something went wrong!, please try again.');
            }

        }, error => {
            console.log(error);
        });
    }






    public  setValidation(value: boolean){
        this.validPackageCollaboratorLibelle = value;
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
        this.validatePackageCollaboratorLibelle();
    }

    public validatePackageCollaboratorLibelle(){
        if (this.item.libelle==null || this.item.libelle=="") {
            this.errorMessages.push('Libelle non valide');
            this.validPackageCollaboratorLibelle = false;
        } else {
            this.validPackageCollaboratorLibelle = true;
        }
    }






    get validPackageCollaboratorLibelle(): boolean {
        return this._validPackageCollaboratorLibelle;
    }

    set validPackageCollaboratorLibelle(value: boolean) {
        this._validPackageCollaboratorLibelle = value;
    }



    get items(): Array<PackageCollaboratorDto> {
        return this.service.items;
    }

    set items(value: Array<PackageCollaboratorDto>) {
        this.service.items = value;
    }

    get item(): PackageCollaboratorDto {
        return this.service.item;
    }

    set item(value: PackageCollaboratorDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): PackageCollaboratorCriteria {
        return this.service.criteria;
    }

    set criteria(value: PackageCollaboratorCriteria) {
        this.service.criteria = value;
    }

    get dateFormat() {
        return environment.dateFormatCreate;
    }

    get dateFormatColumn() {
        return environment.dateFormatCreate;
    }

    get submitted(): boolean {
        return this._submitted;
    }

    set submitted(value: boolean) {
        this._submitted = value;
    }

    get errorMessages(): string[] {
        if (this._errorMessages == null) {
            this._errorMessages = new Array<string>();
        }
        return this._errorMessages;
    }

    set errorMessages(value: string[]) {
        this._errorMessages = value;
    }

    get validate(): boolean {
        return this.service.validate;
    }

    set validate(value: boolean) {
        this.service.validate = value;
    }


    get activeTab(): number {
        return this._activeTab;
    }

    set activeTab(value: number) {
        this._activeTab = value;
    }
    get activeStatus(): number {
        return this.serviceInscriptionCollaborator.active_status ;
    }
}
