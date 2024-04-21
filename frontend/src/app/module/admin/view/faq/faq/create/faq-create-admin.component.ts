import {Component, OnInit} from '@angular/core';

import {AbstractCreateController} from 'src/app/zynerator/controller/AbstractCreateController';

import {FaqAdminService} from 'src/app/shared/service/admin/faq/FaqAdmin.service';
import {FaqDto} from 'src/app/shared/model/faq/Faq.model';
import {FaqCriteria} from 'src/app/shared/criteria/faq/FaqCriteria.model';
import {FaqTypeDto} from 'src/app/shared/model/faq/FaqType.model';
import {FaqTypeAdminService} from 'src/app/shared/service/admin/faq/FaqTypeAdmin.service';

@Component({
    selector: 'app-faq-create-admin',
    templateUrl: './faq-create-admin.component.html'
})
export class FaqCreateAdminComponent extends AbstractCreateController<FaqDto, FaqCriteria, FaqAdminService> implements OnInit {


    constructor(private faqService: FaqAdminService, private faqTypeService: FaqTypeAdminService) {
        super(faqService);
    }

    private _validFaqLibelle = true;

    get validFaqLibelle(): boolean {
        return this._validFaqLibelle;
    }

    set validFaqLibelle(value: boolean) {
        this._validFaqLibelle = value;
    }

    private _validFaqTypeLibelle = true;

    get validFaqTypeLibelle(): boolean {
        return this._validFaqTypeLibelle;
    }

    set validFaqTypeLibelle(value: boolean) {
        this._validFaqTypeLibelle = value;
    }

    get faqType(): FaqTypeDto {
        return this.faqTypeService.item;
    }

    set faqType(value: FaqTypeDto) {
        this.faqTypeService.item = value;
    }

    get faqTypes(): Array<FaqTypeDto> {
        return this.faqTypeService.items;
    }

    set faqTypes(value: Array<FaqTypeDto>) {
        this.faqTypeService.items = value;
    }

    get createFaqTypeDialog(): boolean {
        return this.faqTypeService.createDialog;
    }

    set createFaqTypeDialog(value: boolean) {
        this.faqTypeService.createDialog = value;
    }

    ngOnInit(): void {
        this.faqType = new FaqTypeDto();
        this.faqTypeService.findAll().subscribe((data) => this.faqTypes = data);
    }

    public override setValidation(value: boolean) {
        this.validFaqLibelle = value;
    }

    public override validateForm(): void {
        this.errorMessages = new Array<string>();
        this.validateFaqLibelle();
    }

    public validateFaqLibelle() {
        if (this.stringUtilService.isEmpty(this.item.libelle)) {
            this.errorMessages.push('Libelle non valide');
            this.validFaqLibelle = false;
        } else {
            this.validFaqLibelle = true;
        }
    }

    public async openCreateFaqType(faqType: string) {
        const isPermistted = await this.roleService.isPermitted('FaqType', 'add');
        if (isPermistted) {
            this.faqType = new FaqTypeDto();
            this.createFaqTypeDialog = true;
        } else {
            this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }


}
