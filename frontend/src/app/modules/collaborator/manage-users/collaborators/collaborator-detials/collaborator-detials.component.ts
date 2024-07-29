import {ChangeDetectorRef, Component, OnDestroy, OnInit, ViewChild} from '@angular/core';
import {MatDrawer} from "@angular/material/sidenav";
import {Subject, takeUntil} from "rxjs";
import {ActivatedRoute, Router} from "@angular/router";
import {FuseMediaWatcherService} from "../../../../../../@fuse/services/media-watcher";
import {CollaboratorDto} from "../../../../../shared/model/vocab/Collaborator.model";
import {CollaboratorAdminService} from "../../../../../shared/service/admin/vocab/CollaboratorAdmin.service";

@Component({
    selector: 'app-collaborator-collaborator-detials',
    templateUrl: './collaborator-detials.component.html'
})
export class CollaboratorDetialsComponent implements OnInit, OnDestroy {
    @ViewChild('drawer') drawer: MatDrawer;
    drawerMode: 'over' | 'side' = 'side';
    drawerOpened: boolean = true;
    panels: any[] = [];
    selectedPanel: string = 'account';
    private _unsubscribeAll: Subject<any> = new Subject<any>();
    item: CollaboratorDto;

    /**
     * Constructor
     */
    constructor(
        private _changeDetectorRef: ChangeDetectorRef,
        private router: Router,
        private service: CollaboratorAdminService,
        private route: ActivatedRoute,
        private _fuseMediaWatcherService: FuseMediaWatcherService,
    ) {
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Lifecycle hooks
    // -----------------------------------------------------------------------------------------------------

    /**
     * On init
     */
    ngOnInit(): void {
        // Setup available panels
        this.panels = [
            {
                id: 'account',
                icon: 'heroicons_outline:user-circle',
                title: 'Profile',
                description: 'Manage collaborators profile and private information',
            },
            {
                id: 'security',
                icon: 'heroicons_outline:lock-closed',
                title: 'Security',
                description: 'Manage collaborators password and security preferences',
            },
            {
                id: 'notifications',
                icon: 'heroicons_outline:bell',
                title: 'Notifications',
                description: 'Manage when the collaborator will be notified on which channels',
            },
            {
                id: 'team',
                icon: 'heroicons_outline:adjustments-vertical',
                title: 'Statistics',
                description: 'discover collaborators statistics.',
            },
        ];

        // Subscribe to media changes
        this._fuseMediaWatcherService.onMediaChange$
            .pipe(takeUntil(this._unsubscribeAll))
            .subscribe(({matchingAliases}) => {
                // Set the drawerMode and drawerOpened
                if (matchingAliases.includes('lg')) {
                    this.drawerMode = 'side';
                    this.drawerOpened = true;
                } else {
                    this.drawerMode = 'over';
                    this.drawerOpened = false;
                }

                // Mark for check
                this._changeDetectorRef.markForCheck();
            });

        const id = this.route.snapshot.params.id
        if (id) {
            this.service.findByIdWithAssociatedList(new CollaboratorDto(id))
                .subscribe(res => {
                    console.log(res)
                    this.item = res
                })
        }
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
     * Navigate to the panel
     *
     * @param panel
     */
    goToPanel(panel: string): void {
        this.selectedPanel = panel;

        // Close the drawer on 'over' mode
        if (this.drawerMode === 'over') {
            this.drawer.close();
        }
    }

    /**
     * Get the details of the panel
     *
     * @param id
     */
    getPanelInfo(id: string): any {
        return this.panels.find(panel => panel.id === id);
    }

    /**
     * Track by function for ngFor loops
     *
     * @param index
     * @param item
     */
    trackByFn(index: number, item: any): any {
        return item.id || index;
    }
}
