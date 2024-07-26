import {ChangeDetectionStrategy, Component, Input, OnInit, ViewEncapsulation} from '@angular/core';
import {UntypedFormBuilder, UntypedFormGroup} from '@angular/forms';
import {EtudiantDto} from "../../../../../../shared/model/inscription/Etudiant.model";

@Component({
    selector: 'settings-plan-billing',
    templateUrl: './plan-billing.component.html',
    encapsulation: ViewEncapsulation.None,
    changeDetection: ChangeDetectionStrategy.OnPush,
})
export class SettingsPlanBillingComponent implements OnInit {
    @Input()
    user: EtudiantDto = new EtudiantDto()
    current: Date = new Date();
    total: number = 0
    userCurrency: string = 'MAD'

    /**
     * Constructor
     */
    constructor() {
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Lifecycle hooks
    // -----------------------------------------------------------------------------------------------------

    /**
     * On init
     */
    ngOnInit(): void {
        this.user?.inscriptions.forEach(s => {
            if (s?.etatInscription?.libelle !== 'Pending')
                this.total += s.packStudent?.price?.price
        })
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
}
