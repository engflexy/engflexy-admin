import {ChangeDetectorRef, Component, OnInit, ViewChild} from '@angular/core';
import {FormBuilder, FormGroup, FormsModule, NgForm, ReactiveFormsModule, UntypedFormGroup} from "@angular/forms";
import {MatButtonModule} from "@angular/material/button";
import {MatDialogModule, MatDialogRef} from "@angular/material/dialog";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatInputModule} from "@angular/material/input";
import {MatOptionModule} from "@angular/material/core";
import {MatSelectModule} from "@angular/material/select";
import {NgForOf, NgIf} from "@angular/common";
import {CollaboratorAdminService} from "../../../../../shared/service/admin/vocab/CollaboratorAdmin.service";
import {MatIconModule} from "@angular/material/icon";
import {CollaboratorDto} from "../../../../../shared/model/vocab/Collaborator.model";
import {FuseAlertService} from "../../../../../../@fuse/components/alert";
import {TypeCollaboratorAdminService} from "../../../../../shared/service/admin/prof/TypeCollaboratorAdmin.service";
import {ImagesService} from "../../../../../shared/service/public/images.service";
import {ActivatedRoute} from "@angular/router";
import {MatAutocompleteModule} from "@angular/material/autocomplete";
import {MatCheckboxModule} from "@angular/material/checkbox";
import {MatDatepickerModule} from "@angular/material/datepicker";
import {TranslocoModule} from "@ngneat/transloco";
import {InscriptionCollaboratorDto} from "../../../../../shared/model/collab/InscriptionCollaborator.model";
import {compareObjects} from "../../../../../zynerator/util/Gloabl";
import {
    CollaboratorCollaboratorService
} from "../../../../../shared/service/collaborator/vocab/CollaboratorCollaborator.service";
import {
    InscriptionCollaboratorCollaboratorService
} from "../../../../../shared/service/collaborator/collab/InscriptionCollaboratorCollaborator.service";

@Component({
    selector: 'app-create-admin',
    templateUrl: './create-admin.component.html',
    standalone: true,
    imports: [
        FormsModule,
        MatButtonModule,
        MatDialogModule,
        MatFormFieldModule,
        MatInputModule,
        MatOptionModule,
        MatSelectModule,
        NgIf,
        ReactiveFormsModule,
        MatIconModule,
        MatAutocompleteModule,
        MatCheckboxModule,
        MatDatepickerModule,
        NgForOf,
        TranslocoModule
    ],
    styleUrls: ['./create-admin.component.scss']
})
export class CreateAdminComponent implements OnInit{
    form: FormGroup;
    @ViewChild('ngForm') ngForm: NgForm;
    _collaboratorsFilter: CollaboratorDto[];

    constructor(
        public refDialog: MatDialogRef<CreateAdminComponent>,
        private alert: FuseAlertService,
        private collaboratorService: CollaboratorCollaboratorService,
        private ref: ChangeDetectorRef,
        private typeService: TypeCollaboratorAdminService,
        private service: CollaboratorAdminService,
        private imageService: ImagesService,
        private route: ActivatedRoute,
    ) {
    }

    ngOnInit(): void {
        this.collaboratorService.findAll().subscribe((data) => {
            this.collaborators = data;
            this._collaboratorsFilter = [...this.collaborators]
        });
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
    get item(): CollaboratorDto {
        return this.service.item;
    }

    set item(value: CollaboratorDto) {
        this.service.item = value;
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
    protected readonly compareObjects = compareObjects;

    save() {

    }
}
