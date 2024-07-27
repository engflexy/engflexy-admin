import {Component, OnInit} from '@angular/core';

import {MatButtonModule} from '@angular/material/button';
import {MatDialogModule, MatDialogRef} from '@angular/material/dialog';
import {MatFormFieldModule} from '@angular/material/form-field';
import {MatInputModule} from '@angular/material/input';
import {DatePipe, NgForOf, NgIf} from '@angular/common';

import {FuseAlertService} from '../../../../../@fuse/components/alert';

import {MatAutocompleteModule} from '@angular/material/autocomplete';
import {MatCheckboxModule} from '@angular/material/checkbox';
import {MatIconModule} from '@angular/material/icon';
import {MatTooltipModule} from '@angular/material/tooltip';
import {Router} from '@angular/router';

import {environment} from '../../../../../environments/environment';

import {RoleService} from '../../../../zynerator/security/shared/service/Role.service';
import {StringUtilService} from '../../../../zynerator/util/StringUtil.service';

import {FormsModule} from '@angular/forms';
import {TranslocoModule} from '@ngneat/transloco';

import {
    GroupeEtudiantCollaboratorService
} from '../../../../shared/service/collaborator/grpe/GroupeEtudiantCollaborator.service';
import {GroupeEtudiantDto} from '../../../../shared/model/grpe/GroupeEtudiant.model';
import {GroupeEtudiantCriteria} from '../../../../shared/criteria/grpe/GroupeEtudiantCriteria.model';
import {ParcoursDto} from '../../../../shared/model/course/Parcours.model';
import {ParcoursCollaboratorService} from '../../../../shared/service/collaborator/course/ParcoursCollaborator.service';
import {GroupeEtatDto} from '../../../../shared/model/grpe/GroupeEtat.model';
import {
    GroupeEtatCollaboratorService
} from '../../../../shared/service/collaborator/grpe/GroupeEtatCollaborator.service';
import {GroupeEtudiantDetailDto} from '../../../../shared/model/grpe/GroupeEtudiantDetail.model';
import {
    GroupeEtudiantDetailCollaboratorService
} from '../../../../shared/service/collaborator/grpe/GroupeEtudiantDetailCollaborator.service';
import {EtudiantDto} from '../../../../shared/model/inscription/Etudiant.model';
import {
    EtudiantCollaboratorService
} from '../../../../shared/service/collaborator/inscription/EtudiantCollaborator.service';
import {GroupeTypeDto} from '../../../../shared/model/grpe/GroupeType.model';
import {
    GroupeTypeCollaboratorService
} from '../../../../shared/service/collaborator/grpe/GroupeTypeCollaborator.service';
import {GroupeEtudeDto} from '../../../../shared/model/grpe/GroupeEtude.model';
import {
    GroupeEtudeCollaboratorService
} from '../../../../shared/service/collaborator/grpe/GroupeEtudeCollaborator.service';
import {ProfDto} from '../../../../shared/model/prof/Prof.model';
import {ProfCollaboratorService} from '../../../../shared/service/collaborator/prof/ProfCollaborator.service';
import {MatSelectModule} from "@angular/material/select";
import {MatMenuModule} from "@angular/material/menu";
import {compareObjects} from "../../../../shared/constant/global-funsctions";

@Component({
    selector: 'app-collaborator-groupe-etudiant-create-collaborator',
    templateUrl: './groupe-etudiant-create-collaborator.component.html',
})
export class GroupeEtudiantCreateCollaboratorComponent implements OnInit {
    protected _submitted = false;
    protected _errorMessages = new Array<string>();

    protected datePipe: DatePipe;

    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;

    _groupeEtudesFilter: GroupeEtudeDto[];
    _groupeTypesFilter: GroupeTypeDto[];
    _groupeEtatsFilter: GroupeEtatDto[];
    _parcourssFilter: ParcoursDto[];
    _profsFilter: ProfDto[];
    _etudiantsFilter: EtudiantDto[];
    selectedEtudiants: Array<EtudiantDto> = new Array<EtudiantDto>()

    private _groupeEtudiantDetailsElement = new GroupeEtudiantDetailDto();
    private _groupeEtudiantDetails: Array<GroupeEtudiantDetailDto> = [];

    constructor(
        private alert: FuseAlertService,
        public refDialog: MatDialogRef<GroupeEtudiantCreateCollaboratorComponent>,
        private service: GroupeEtudiantCollaboratorService,
        private parcoursService: ParcoursCollaboratorService,
        private groupeEtatService: GroupeEtatCollaboratorService,
        private groupeEtudiantDetailService: GroupeEtudiantDetailCollaboratorService,
        private etudiantService: EtudiantCollaboratorService,
        private groupeTypeService: GroupeTypeCollaboratorService,
        private groupeEtudeService: GroupeEtudeCollaboratorService,
        private profService: ProfCollaboratorService) {
    }

    ngOnInit(): void {
        if (this.item?.id && this.item?.groupeEtudiantDetails?.length > 0) {
            this.item.groupeEtudiantDetails.forEach(s => {
                this.selectedEtudiants.push({...s.etudiant})
            })
        }
        this.etudiantService
            .findAll().subscribe((data) => {
            this.etudiants = data
            this._etudiantsFilter = [...this.etudiants]
            console.log(data)
        });

        this.groupeEtudeService.findAll().subscribe((data) => {
            this.groupeEtudes = data;
            this._groupeEtudesFilter = [...this.groupeEtudes];
        });

        this.parcoursService.findAll().subscribe((data) => {
            this.parcourss = data;
            this._parcourssFilter = [...this.parcourss];
        });
        this.profService.findAll().subscribe((data) => {
            this.profs = data;
            this._profsFilter = [...this.profs];
        });
    }

    displayGroupeEtude(item: GroupeEtudeDto): string {
        return item && item.libelle ? item.libelle : '';
    }

    filterGroupeEtude(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._groupeEtudesFilter = this.groupeEtudes.filter((s) =>
                s.libelle?.toLowerCase()?.includes(value)
            );
        } else {
            this._groupeEtudesFilter = this.groupeEtudes;
        }
    }

    displayGroupeType(item: GroupeTypeDto): string {
        return item && item.libelle ? item.libelle : '';
    }

    filterGroupeType(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._groupeTypesFilter = this.groupeTypes.filter((s) =>
                s.libelle?.toLowerCase()?.includes(value)
            );
        } else {
            this._groupeTypesFilter = this.groupeTypes;
        }
    }

    displayGroupeEtat(item: GroupeEtatDto): string {
        return item && item.libelle ? item.libelle : '';
    }

    filterGroupeEtat(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._groupeEtatsFilter = this.groupeEtats.filter((s) =>
                s.libelle?.toLowerCase()?.includes(value)
            );
        } else {
            this._groupeEtatsFilter = this.groupeEtats;
        }
    }

    displayParcours(item: ParcoursDto): string {
        return item && item.libelle ? item.libelle : '';
    }

    filterParcours(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._parcourssFilter = this.parcourss.filter((s) =>
                s.libelle?.toLowerCase()?.includes(value)
            );
        } else {
            this._parcourssFilter = this.parcourss;
        }
    }

    displayProf(item: ProfDto): string {
        return item && item.fullName ? item.fullName : '';
    }

    filterProf(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._profsFilter = this.profs.filter((s) =>
                s.fullName?.toLowerCase()?.includes(value)
            );
        } else {
            this._profsFilter = this.profs;
        }
    }

    filterStudents(value: string) {
        value = value.toLowerCase();
        if (value && value.length > 0) {
            this._etudiantsFilter = this.etudiants.filter((s) =>
                s.fullName?.toLowerCase()?.includes(value) ||
                s.email?.toLowerCase()?.includes(value)
            );
        } else {
            this._etudiantsFilter = this.etudiants;
        }
    }

    public save(): void {
        this.submitted = true;
        this.validateForm();
        if (this.errorMessages.length === 0) {
            this.saveWithShowOption();
        } else {
            this.alert.show('info', 'something went wrong!, please try again.');
        }
    }

    public saveWithShowOption() {
        for (const item of this.selectedEtudiants) {
            const group: GroupeEtudiantDetailDto = new GroupeEtudiantDetailDto()
            group.etudiant = item
            this.item.groupeEtudiantDetails.push({...group})
        }
        this.item.nombrePlace = this.selectedEtudiants?.length | 0
        console.log(this.item)
        this.service.save()
            .subscribe(
                (item) => {
                    if (item != null) {
                        console.log(item)
                        this.item = new GroupeEtudiantDto();
                        this.refDialog.close(item)
                    } else {
                        this.alert.show(
                            'info',
                            'something went wrong!, please try again.'
                        );
                    }
                },
                (error) => {
                    console.log(error);
                }
            );
    }

    public hideCreateDialog() {
        this.createDialog = false;
        this.setValidation(true);
    }

    prepareGroupeEtudiantDetails(etudiants: Array<EtudiantDto>): void {
        if (etudiants != null) {
            etudiants.forEach((e) => {
                const groupeEtudiantDetail = new GroupeEtudiantDetailDto();
                groupeEtudiantDetail.etudiant = e;
                this.groupeEtudiantDetails.push(groupeEtudiantDetail);
            });
        }
    }

    public setValidation(value: boolean) {
    }

    public validateForm(): void {
        this.errorMessages = new Array<string>();
    }


    get groupeType(): GroupeTypeDto {
        return this.groupeTypeService.item;
    }

    set groupeType(value: GroupeTypeDto) {
        this.groupeTypeService.item = value;
    }

    get groupeTypes(): Array<GroupeTypeDto> {
        return this.groupeTypeService.items;
    }

    set groupeTypes(value: Array<GroupeTypeDto>) {
        this.groupeTypeService.items = value;
    }

    get createGroupeTypeDialog(): boolean {
        return this.groupeTypeService.createDialog;
    }

    set createGroupeTypeDialog(value: boolean) {
        this.groupeTypeService.createDialog = value;
    }

    get prof(): ProfDto {
        return this.profService.item;
    }

    set prof(value: ProfDto) {
        this.profService.item = value;
    }

    get profs(): Array<ProfDto> {
        return this.profService.items;
    }

    set profs(value: Array<ProfDto>) {
        this.profService.items = value;
    }

    get createProfDialog(): boolean {
        return this.profService.createDialog;
    }

    set createProfDialog(value: boolean) {
        this.profService.createDialog = value;
    }

    get groupeEtat(): GroupeEtatDto {
        return this.groupeEtatService.item;
    }

    set groupeEtat(value: GroupeEtatDto) {
        this.groupeEtatService.item = value;
    }

    get groupeEtats(): Array<GroupeEtatDto> {
        return this.groupeEtatService.items;
    }

    set groupeEtats(value: Array<GroupeEtatDto>) {
        this.groupeEtatService.items = value;
    }


    get parcours(): ParcoursDto {
        return this.parcoursService.item;
    }

    set parcours(value: ParcoursDto) {
        this.parcoursService.item = value;
    }

    get parcourss(): Array<ParcoursDto> {
        return this.parcoursService.items;
    }

    set parcourss(value: Array<ParcoursDto>) {
        this.parcoursService.items = value;
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


    get groupeEtude(): GroupeEtudeDto {
        return this.groupeEtudeService.item;
    }

    set groupeEtude(value: GroupeEtudeDto) {
        this.groupeEtudeService.item = value;
    }

    get groupeEtudes(): Array<GroupeEtudeDto> {
        return this.groupeEtudeService.items;
    }

    set groupeEtudes(value: Array<GroupeEtudeDto>) {
        this.groupeEtudeService.items = value;
    }


    get groupeEtudiantDetails(): Array<GroupeEtudiantDetailDto> {
        if (this._groupeEtudiantDetails == null)
            this._groupeEtudiantDetails = new Array();
        return this._groupeEtudiantDetails;
    }


    get groupeEtudiantDetailsElement(): GroupeEtudiantDetailDto {
        if (this._groupeEtudiantDetailsElement == null)
            this._groupeEtudiantDetailsElement = new GroupeEtudiantDetailDto();
        return this._groupeEtudiantDetailsElement;
    }

    set groupeEtudiantDetailsElement(value: GroupeEtudiantDetailDto) {
        this._groupeEtudiantDetailsElement = value;
    }

    get items(): Array<GroupeEtudiantDto> {
        return this.service.items;
    }

    set items(value: Array<GroupeEtudiantDto>) {
        this.service.items = value;
    }

    get item(): GroupeEtudiantDto {
        return this.service.item;
    }

    set item(value: GroupeEtudiantDto) {
        this.service.item = value;
    }

    get createDialog(): boolean {
        return this.service.createDialog;
    }

    set createDialog(value: boolean) {
        this.service.createDialog = value;
    }

    get criteria(): GroupeEtudiantCriteria {
        return this.service.criteria;
    }

    set criteria(value: GroupeEtudiantCriteria) {
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

    protected readonly compareObjects = compareObjects;

    deleteStudent(index: number) {
        this.selectedEtudiants.splice(index, 1)
    }
}
