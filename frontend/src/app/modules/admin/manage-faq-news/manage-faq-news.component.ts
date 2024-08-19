import {Component, OnDestroy, OnInit} from '@angular/core';
import {MatButtonModule} from "@angular/material/button";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatIconModule} from "@angular/material/icon";
import {MatInputModule} from "@angular/material/input";
import {MatPaginatorModule} from "@angular/material/paginator";
import {Subject, takeUntil} from 'rxjs';
import {RouterLink} from "@angular/router";
import {NgFor, NgForOf, NgIf} from "@angular/common";
import {MatExpansionModule} from "@angular/material/expansion";
import {MatTooltipModule} from "@angular/material/tooltip";
import {FaqDto} from "../../../shared/model/faq/Faq.model";
import {FaqCollaboratorService} from "../../../shared/service/collaborator/faq/FaqCollaborator.service";
import {MatDialog} from "@angular/material/dialog";
import {FaqCreateAdminComponent} from "./create/faq-create-admin.component";
import {FaqEditAdminComponent} from "./edit/faq-edit-admin.component";
import {ExerciceDto} from "../../../shared/model/course/Exercice.model";
import {FuseConfirmationService} from "../../../../@fuse/services/confirmation";
import {SectionDto} from "../../../shared/model/course/Section.model";
import {FuseAlertService} from "../../../../@fuse/components/alert";
import {FaqTypeDto} from "../../../shared/model/faq/FaqType.model";
import {FaqTypeCollaboratorService} from "../../../shared/service/collaborator/faq/FaqTypeCollaborator.service";

@Component({
    selector: 'app-manage-faq-news',
    templateUrl: './manage-faq-news.component.html',
    imports: [
        MatButtonModule,
        MatFormFieldModule,
        MatIconModule,
        MatInputModule,
        MatPaginatorModule,
        RouterLink,
        NgFor, MatExpansionModule,
        NgForOf,
        NgIf, MatTooltipModule
    ],

    standalone: true
})
export class ManageFaqNewsComponent implements OnInit, OnDestroy {

    groupedFaqs: any;

    faqCategories: any[];
    typeFaq: FaqTypeDto

    private _unsubscribeAll: Subject<any> = new Subject();

    /**
     * Constructor
     */
    constructor(
        private _helpCenterService: FaqCollaboratorService,
        private _matDialog: MatDialog,
        private _fuseConfirmation: FuseConfirmationService,
        private alert: FuseAlertService,
        private _faqTypeCollaboratorService : FaqTypeCollaboratorService
    ) {
    }

    get item(): FaqDto {
        return this._helpCenterService.item;
    }

    set item(value: FaqDto) {
        this._helpCenterService.item = value;
    }


    get faqs(): FaqDto[] {
        return this._helpCenterService.items
    }

    set faqs(item: FaqDto[]) {
        this._helpCenterService.items = item
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Lifecycle hooks
    // -----------------------------------------------------------------------------------------------------

    /**
     * On init
     */
    ngOnInit(): void {
        this.fetchData();


    }

    private fetchData() {
        this._helpCenterService.findAllGroupedByFaqType()
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe((groupedFaqs) => {
                this.groupedFaqs = groupedFaqs;
                this.faqCategories = groupedFaqs;
            });
    }

    /**
     * On destroy
     */
    ngOnDestroy(): void {
        // Unsubscribe from all subscriptions
        this._unsubscribeAll.next(null);
        this._unsubscribeAll.complete();
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Public methods
    // -----------------------------------------------------------------------------------------------------

    /**
     * Track by function for ngFor loops
     *
     * @param index
     * @param item
     */
    trackByFn(index: number, item: any): any {
        return item.id || index;
    }

    create() {
        this.item = new FaqDto()
        const dialog = this._matDialog.open(FaqCreateAdminComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });
        dialog.afterClosed().subscribe((res: FaqDto) => {
            if (res != null) {
                this.fetchData();
                /*this.faqCategories.unshift({...res.faqType})
                res.faqType = null
                this.faqCategories.at(0).unshift({...res})
*/
            }
        })
    }


    openEdit(faq: FaqDto) {
        this.item = faq
        const dialog = this._matDialog.open(FaqEditAdminComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        }
        );

    }

    delete(faq: FaqDto) {
        const confirmation = this._fuseConfirmation.open({
            title: 'delete faq',
            message: 'Are you sure you want to remove this faq?',
            actions: {
                confirm: {
                    label: 'REMOVE',
                },
            },
        });
        // Subscribe to the confirmation dialog closed action
        confirmation.afterClosed().subscribe((result) => {
            // If the confirmation button pressed...
            if (result === 'confirmed') {
                this._helpCenterService.delete(faq).subscribe(res => {
                    this.alert.show('success', 'faq deleted successfully')
                    this.fetchData();
                }, error => {
                    this.alert.show('info', error?.error?.message || 'something went wrong!, please try again.')
                })
            }
        });
    }
}
