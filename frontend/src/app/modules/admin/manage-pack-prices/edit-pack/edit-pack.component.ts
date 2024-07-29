import {Component, Inject, OnInit, PLATFORM_ID} from '@angular/core';
import {DatePipe} from "@angular/common";
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
import {TranslocoModule} from "@ngneat/transloco";

@Component({
    selector: 'app-edit-pack',
    templateUrl: './edit-pack.component.html',
    standalone: true,
    imports: [
        MatInputModule,
        FormsModule,
        MatDialogModule,
        MatButtonModule,
        TranslocoModule
    ],
    styleUrls: ['./edit-pack.component.scss']
})
export class EditPackComponent implements OnInit{
    protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;





    private _validPackageCollaboratorLibelle = true;

    constructor(public refDialog: MatDialogRef<EditPackComponent>, private alert: FuseAlertService, private service: PackageCollaboratorCollaboratorService , @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        console.log(this.item)
    }





    public edit(): void {
        this.submitted = true;
        this.validateForm();
        if (this.errorMessages.length === 0) {
            this.editWithShowOption(false);

        } else {
            this.alert.show('info', 'something went wrong!, please try again.');
        }
    }

    public editWithShowOption(showList: boolean) {
        this.service.edit().subscribe(item => {
            if (item != null) {
                this.items.push({...item});
                this.item = new PackageCollaboratorDto();
                this.alert.show('info', 'Pack successfully updated!');
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
        if (this.item.libelle==""||this.item.libelle==null) {
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
}
