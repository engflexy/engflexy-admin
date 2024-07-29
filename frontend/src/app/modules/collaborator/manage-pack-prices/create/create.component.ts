import {Component, Inject, OnInit, PLATFORM_ID} from '@angular/core';
import {MatDialogRef} from "@angular/material/dialog";
import {DatePipe} from "@angular/common";
import {FuseAlertService} from "../../../../../@fuse/components/alert";
import {RoleService} from "../../../../zynerator/security/shared/service/Role.service";
import {Router} from "@angular/router";
import {StringUtilService} from "../../../../zynerator/util/StringUtil.service";
import {environment} from "../../../../../environments/environment";
import {PackageCollaboratorDto} from "../../../../shared/model/collab/PackageCollaborator.model";
import {CollaboratorDto} from "../../../../shared/model/vocab/Collaborator.model";
import {InscriptionCollaboratorStateDto} from "../../../../shared/model/collab/InscriptionCollaboratorState.model";
import {InscriptionCollaboratorDto} from "../../../../shared/model/collab/InscriptionCollaborator.model";
import {
    InscriptionCollaboratorCriteria
} from "../../../../shared/criteria/collab/InscriptionCollaboratorCriteria.model";
import {compareObjects} from "../../../../zynerator/util/Gloabl";
import {
    CollaboratorCollaboratorService
} from "../../../../shared/service/collaborator/vocab/CollaboratorCollaborator.service";
import {
    PackageCollaboratorCollaboratorService
} from "../../../../shared/service/collaborator/collab/PackageCollaboratorCollaborator.service";
import {
    InscriptionCollaboratorCollaboratorService
} from "../../../../shared/service/collaborator/collab/InscriptionCollaboratorCollaborator.service";
import {
    InscriptionCollaboratorStateCollaboratorService
} from "../../../../shared/service/collaborator/collab/InscriptionCollaboratorStateCollaborator.service";

@Component({
    selector: 'app-collaborator-create',
    templateUrl: './create.component.html'
})
export class CreateComponent implements OnInit {
    protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

    _packageCollaboratorsFilter: PackageCollaboratorDto[];
    _collaboratorsFilter: CollaboratorDto[];
    _inscriptionCollaboratorStatesFilter: InscriptionCollaboratorStateDto[];


    private _validPackageCollaboratorLibelle = true;
    private _validInscriptionCollaboratorStateCode = true;
    private _validInscriptionCollaboratorStateLibelle = true;

    constructor(public refDialog: MatDialogRef<CreateComponent>, private alert: FuseAlertService, private service: InscriptionCollaboratorCollaboratorService, private collaboratorService: CollaboratorCollaboratorService, private inscriptionCollaboratorStateService: InscriptionCollaboratorStateCollaboratorService, private packageCollaboratorService: PackageCollaboratorCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {

    }

    ngOnInit(): void {
        this.packageCollaboratorService.findAll().subscribe((data) => {
            this.packageCollaborators = data;
            this._packageCollaboratorsFilter = [...this.packageCollaborators]
        });
        this.collaboratorService.findAll().subscribe((data) => {
            this.collaborators = data;
            this._collaboratorsFilter = [...this.collaborators]
        });
        this.inscriptionCollaboratorStateService.findAll().subscribe((data) => {
            this.inscriptionCollaboratorStates = data;
            this._inscriptionCollaboratorStatesFilter = [...this.inscriptionCollaboratorStates]
        });
    }

    displayPackageCollaborator(item: PackageCollaboratorDto): string {
        return item && item.libelle ? item.libelle : "";

    }

    filterPackageCollaborator(value: string) {
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

    filterCollaborator(value: string) {
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

    onStartDateChange(): void {
        const timer = setInterval(s => {
            if (this.item.startDate) {

                const startDate = new Date(this.item.startDate);
                console.log(startDate)
                const endDate = new Date(startDate.setDate(startDate.getDate() + 30));
                this.item.endDate = endDate;
                console.log(endDate)

            }
            clearInterval(timer)
        }, 100)
    }

    filterInscriptionCollaboratorState(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._inscriptionCollaboratorStatesFilter = this.inscriptionCollaboratorStates.filter(s =>
                s.libelle?.toLowerCase()?.includes(value)
            )
        } else {
            this._inscriptionCollaboratorStatesFilter = this.inscriptionCollaboratorStates
        }
    }


    public save(): void {
        this.submitted = true;
        this.validateForm();
        if (this.errorMessages.length === 0) {
            this.saveWithShowOption(false);
            this.refDialog.close();
        } else {
            this.alert.show('info', 'something went wrong!, please try again.');
        }
    }

    public saveWithShowOption(showList: boolean) {
        this.service.save().subscribe(item => {
            if (item != null) {
                this.items.push({...item});
                this.item = new InscriptionCollaboratorDto();
            } else {
                this.alert.show('info', 'something went wrong!, please try again.');
            }

        }, error => {
            console.log(error);
        });
    }


    public setValidation(value: boolean) {
    }


    public validateForm(): void {
        this.errorMessages = new Array<string>();
    }


    public async openCreateCollaborator(collaborator: string) {
        const isPermistted = await this.roleService.isPermitted('Collaborator', 'add');
        if (isPermistted) {
            this.collaborator = new CollaboratorDto();
            this.createCollaboratorDialog = true;
        } else {
            this.alert.show('info', 'something went wrong!, please try again.');
        }
    }

    public async openCreatePackageCollaborator(packageCollaborator: string) {
        const isPermistted = await this.roleService.isPermitted('PackageCollaborator', 'add');
        if (isPermistted) {
            this.packageCollaborator = new PackageCollaboratorDto();
            this.createPackageCollaboratorDialog = true;
        } else {
            this.alert.show('info', 'something went wrong!, please try again.');
        }
    }

    public async openCreateInscriptionCollaboratorState(inscriptionCollaboratorState: string) {
        const isPermistted = await this.roleService.isPermitted('InscriptionCollaboratorState', 'add');
        if (isPermistted) {
            this.inscriptionCollaboratorState = new InscriptionCollaboratorStateDto();
            this.createInscriptionCollaboratorStateDialog = true;
        } else {
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
        this.collaboratorService.createDialog = value;
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
        this.packageCollaboratorService.createDialog = value;
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
        this.inscriptionCollaboratorStateService.createDialog = value;
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

    protected readonly compareObjects = compareObjects;


    calculatePrice() {
        const timer = setInterval(s => {
            if (this.item.packageCollaborator != null && this.item.nbrStudent != null) {
                let totalPrice = 0;


                // Calculate base price based on number of students
                console.log(this.item.packageCollaborator.priceBase)

                clearInterval(timer)


                totalPrice += this.item.nbrStudent * this.item.packageCollaborator.priceBase;

                // Add price for logo if selected
                if (this.item.logo == true) {
                    totalPrice += this.item.packageCollaborator.priceLogo;
                }

                // Add price for color if selected
                if (this.item.color == true) {
                    totalPrice += this.item.packageCollaborator.priceColor;
                }

                // Add price for banner ad if selected
                if (this.item.bannerAd == true) {
                    totalPrice += this.item.packageCollaborator.priceBannerAd;
                }

                // Update the item price
                this.item.price = totalPrice;
                console.log(this.item.price)
            }
        }, 100)
    }
}