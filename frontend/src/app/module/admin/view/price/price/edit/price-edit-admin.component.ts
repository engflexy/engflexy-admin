import {Component, OnInit} from '@angular/core';


import {AbstractEditController} from 'src/app/zynerator/controller/AbstractEditController';

import {PriceAdminService} from 'src/app/shared/service/admin/price/PriceAdmin.service';
import {PriceDto} from 'src/app/shared/model/price/Price.model';
import {PriceCriteria} from 'src/app/shared/criteria/price/PriceCriteria.model';


@Component({
    selector: 'app-price-edit-admin',
    templateUrl: './price-edit-admin.component.html'
})
export class PriceEditAdminComponent extends AbstractEditController<PriceDto, PriceCriteria, PriceAdminService> implements OnInit {


    constructor(private priceService: PriceAdminService) {
        super(priceService);
    }

    private _validPriceLib = true;

    get validPriceLib(): boolean {
        return this._validPriceLib;
    }

    set validPriceLib(value: boolean) {
        this._validPriceLib = value;
    }

    ngOnInit(): void {
    }

    public override setValidation(value: boolean) {
        this.validPriceLib = value;
    }

    public override validateForm(): void {
        this.errorMessages = new Array<string>();
        this.validatePriceLib();
    }

    public validatePriceLib() {
        if (this.stringUtilService.isEmpty(this.item.lib)) {
            this.errorMessages.push('Lib non valide');
            this.validPriceLib = false;
        } else {
            this.validPriceLib = true;
        }
    }

}
