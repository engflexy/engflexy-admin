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
import {HelpCenterService} from "./help-center.service";
import {MatTooltipModule} from "@angular/material/tooltip";

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


    private _unsubscribeAll: Subject<any> = new Subject();

    /**
     * Constructor
     */
    constructor(
        private _helpCenterService: HelpCenterService,

    ) {
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Lifecycle hooks
    // -----------------------------------------------------------------------------------------------------

    /**
     * On init
     */
    ngOnInit(): void {
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

    create(){
    }




}
