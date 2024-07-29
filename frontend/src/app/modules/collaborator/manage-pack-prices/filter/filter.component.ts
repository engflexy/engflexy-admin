import {Component, Inject, OnInit, PLATFORM_ID} from '@angular/core';
import {FuseAlertService} from "../../../../../@fuse/components/alert";
import {
    InscriptionCollaboratorCollaboratorService
} from "../../../../shared/service/collaborator/collab/InscriptionCollaboratorCollaborator.service";
import {
    CollaboratorCollaboratorService
} from "../../../../shared/service/collaborator/vocab/CollaboratorCollaborator.service";
import {
    InscriptionCollaboratorStateCollaboratorService
} from "../../../../shared/service/collaborator/collab/InscriptionCollaboratorStateCollaborator.service";
import {
    PackageCollaboratorCollaboratorService
} from "../../../../shared/service/collaborator/collab/PackageCollaboratorCollaborator.service";
import {DatePipe, NgForOf} from "@angular/common";
import {RoleService} from "../../../../zynerator/security/shared/service/Role.service";
import {Router} from "@angular/router";
import {StringUtilService} from "../../../../zynerator/util/StringUtil.service";
import {PackageCollaboratorDto} from "../../../../shared/model/collab/PackageCollaborator.model";
import {CollaboratorDto} from "../../../../shared/model/vocab/Collaborator.model";
import {InscriptionCollaboratorStateDto} from "../../../../shared/model/collab/InscriptionCollaboratorState.model";
import {MatDialogModule, MatDialogRef} from "@angular/material/dialog";
import {InscriptionCollaboratorDto} from "../../../../shared/model/collab/InscriptionCollaborator.model";
import {
    InscriptionCollaboratorCriteria
} from "../../../../shared/criteria/collab/InscriptionCollaboratorCriteria.model";
import {environment} from "../../../../../environments/environment";
import {MatInputModule} from "@angular/material/input";
import {MatAutocompleteModule} from "@angular/material/autocomplete";
import {compareObjects} from "../../../../zynerator/util/Gloabl";
import {FormsModule} from "@angular/forms";
import {MatCheckboxModule} from "@angular/material/checkbox";
import {MatButtonModule} from "@angular/material/button";
import {TranslocoModule} from "@ngneat/transloco";
import {MatDatepickerModule} from "@angular/material/datepicker";
import {CreateComponent} from "../create/create.component";

@Component({
    selector: 'app-collaborator-filter',
    templateUrl: './filter.component.html',
    styleUrls: ['./filter.component.scss']
})
export class FilterComponent implements OnInit{
    protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

    _packageCollaboratorsFilter:  PackageCollaboratorDto[];
    _collaboratorsFilter:  CollaboratorDto[];
    _inscriptionCollaboratorStatesFilter:  InscriptionCollaboratorStateDto[];




    private _validPackageCollaboratorLibelle = true;
    private _validInscriptionCollaboratorStateCode = true;
    private _validInscriptionCollaboratorStateLibelle = true;

    constructor(public refDialog: MatDialogRef<CreateComponent>, private alert: FuseAlertService, private service: InscriptionCollaboratorCollaboratorService , private collaboratorService: CollaboratorCollaboratorService, private inscriptionCollaboratorStateService: InscriptionCollaboratorStateCollaboratorService, private packageCollaboratorService: PackageCollaboratorCollaboratorService, @Inject(PLATFORM_ID) private platformId? ) {

    }

    ngOnInit(): void {
        this.packageCollaboratorService.findAll().subscribe((data) => {this.packageCollaborators = data; this._packageCollaboratorsFilter = [...this.packageCollaborators]});
        this.collaboratorService.findAll().subscribe((data) => {this.collaborators = data; this._collaboratorsFilter = [...this.collaborators]});
        this.inscriptionCollaboratorStateService.findAll().subscribe((data) => {this.inscriptionCollaboratorStates = data; this._inscriptionCollaboratorStatesFilter = [...this.inscriptionCollaboratorStates]});
    }

    displayPackageCollaborator(item: PackageCollaboratorDto): string {
        return item && item.libelle ? item.libelle : "";

    }

    filterPackageCollaborator(value: string){
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._packageCollaboratorsFilter = this.packageCollaborators.filter(s =>
                s.libelle?.toLowerCase()?.includes(value)
            )
        } else {
            this._packageCollaboratorsFilter = this.packageCollaborators
        }
    }
    displayCollaborator(item: CollaboratorDto): string {
        return item && item.username ? item.username : "";

    }

    filterCollaborator(value: string){
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._collaboratorsFilter = this.collaborators.filter(s =>
                s.username?.toLowerCase()?.includes(value)
            )
        } else {
            this._collaboratorsFilter = this.collaborators
        }
    }
    displayInscriptionCollaboratorState(item: InscriptionCollaboratorStateDto): string {
        return item && item.libelle ? item.libelle : "";

    }

    filterInscriptionCollaboratorState(value: string){
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._inscriptionCollaboratorStatesFilter = this.inscriptionCollaboratorStates.filter(s =>
                s.libelle?.toLowerCase()?.includes(value)
            )
        } else {
            this._inscriptionCollaboratorStatesFilter = this.inscriptionCollaboratorStates
        }
    }




    public filter(): void {
        this.refDialog.close(this.item)
    }





    public  setValidation(value: boolean){
    }



    public  validateForm(): void{
        this.errorMessages = new Array<string>();
    }



    public async openCreateCollaborator(collaborator: string) {
        const isPermistted = await this.roleService.isPermitted('Collaborator', 'add');
        if(isPermistted) {
            this.collaborator = new CollaboratorDto();
            this.createCollaboratorDialog = true;
        }else{
            this.alert.show('info', 'something went wrong!, please try again.');
        }
    }
    public async openCreatePackageCollaborator(packageCollaborator: string) {
        const isPermistted = await this.roleService.isPermitted('PackageCollaborator', 'add');
        if(isPermistted) {
            this.packageCollaborator = new PackageCollaboratorDto();
            this.createPackageCollaboratorDialog = true;
        }else{
            this.alert.show('info', 'something went wrong!, please try again.');
        }
    }
    public async openCreateInscriptionCollaboratorState(inscriptionCollaboratorState: string) {
        const isPermistted = await this.roleService.isPermitted('InscriptionCollaboratorState', 'add');
        if(isPermistted) {
            this.inscriptionCollaboratorState = new InscriptionCollaboratorStateDto();
            this.createInscriptionCollaboratorStateDialog = true;
        }else{
            this.alert.show('info', 'something went wrong!, please try again.');
        }
    }

    get collaborator(): CollaboratorDto {
        return this.collaboratorService.item;
    }
    set collaborator(value: CollaboratorDto) {
        this.collaboratorService.item = value;
    }
    get collaborators(): Array<CollaboratorDto> {
        return this.collaboratorService.items;
    }
    set collaborators(value: Array<CollaboratorDto>) {
        this.collaboratorService.items = value;
    }
    get createCollaboratorDialog(): boolean {
        return this.collaboratorService.createDialog;
    }
    set createCollaboratorDialog(value: boolean) {
        this.collaboratorService.createDialog= value;
    }
    get packageCollaborator(): PackageCollaboratorDto {
        return this.packageCollaboratorService.item;
    }
    set packageCollaborator(value: PackageCollaboratorDto) {
        this.packageCollaboratorService.item = value;
    }
    get packageCollaborators(): Array<PackageCollaboratorDto> {
        return this.packageCollaboratorService.items;
    }
    set packageCollaborators(value: Array<PackageCollaboratorDto>) {
        this.packageCollaboratorService.items = value;
    }
    get createPackageCollaboratorDialog(): boolean {
        return this.packageCollaboratorService.createDialog;
    }
    set createPackageCollaboratorDialog(value: boolean) {
        this.packageCollaboratorService.createDialog= value;
    }
    get inscriptionCollaboratorState(): InscriptionCollaboratorStateDto {
        return this.inscriptionCollaboratorStateService.item;
    }
    set inscriptionCollaboratorState(value: InscriptionCollaboratorStateDto) {
        this.inscriptionCollaboratorStateService.item = value;
    }
    get inscriptionCollaboratorStates(): Array<InscriptionCollaboratorStateDto> {
        return this.inscriptionCollaboratorStateService.items;
    }
    set inscriptionCollaboratorStates(value: Array<InscriptionCollaboratorStateDto>) {
        this.inscriptionCollaboratorStateService.items = value;
    }
    get createInscriptionCollaboratorStateDialog(): boolean {
        return this.inscriptionCollaboratorStateService.createDialog;
    }
    set createInscriptionCollaboratorStateDialog(value: boolean) {
        this.inscriptionCollaboratorStateService.createDialog= value;
    }




    get validPackageCollaboratorLibelle(): boolean {
        return this._validPackageCollaboratorLibelle;
    }
    set validPackageCollaboratorLibelle(value: boolean) {
        this._validPackageCollaboratorLibelle = value;
    }
    get validInscriptionCollaboratorStateCode(): boolean {
        return this._validInscriptionCollaboratorStateCode;
    }
    set validInscriptionCollaboratorStateCode(value: boolean) {
        this._validInscriptionCollaboratorStateCode = value;
    }
    get validInscriptionCollaboratorStateLibelle(): boolean {
        return this._validInscriptionCollaboratorStateLibelle;
    }
    set validInscriptionCollaboratorStateLibelle(value: boolean) {
        this._validInscriptionCollaboratorStateLibelle = value;
    }


    get items(): Array<InscriptionCollaboratorDto> {
        return this.service.items;
    }

    set items(value: Array<InscriptionCollaboratorDto>) {
        this.service.items = value;
    }

    get item(): InscriptionCollaboratorDto {
        return this.service.item;
    }

    set item(value: InscriptionCollaboratorDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): InscriptionCollaboratorCriteria {
        return this.service.criteria;
    }

    set criteria(value: InscriptionCollaboratorCriteria) {
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
