import {Component, OnInit, Input} from '@angular/core';
import {ConfirmationService, MessageService} from 'primeng/api';
import {FileTempDto} from 'src/app/zynerator/dto/FileTempDto.model';
import {DatePipe} from '@angular/common';
import {Router} from '@angular/router';
import {Inject, Injectable, PLATFORM_ID} from '@angular/core';

import {environment} from 'src/environments/environment';

import {RoleService} from 'src/app/zynerator/security/shared/service/Role.service';
import {StringUtilService} from 'src/app/zynerator/util/StringUtil.service';
import {ServiceLocator} from 'src/app/zynerator/service/ServiceLocator';




import {WorkloadBonusProfCollaboratorService} from 'src/app/shared/service/collaborator/salary/WorkloadBonusProfCollaborator.service';
import {WorkloadBonusProfDto} from 'src/app/shared/model/salary/WorkloadBonusProf.model';
import {WorkloadBonusProfCriteria} from 'src/app/shared/criteria/salary/WorkloadBonusProfCriteria.model';


import {SalaryDto} from 'src/app/shared/model/salary/Salary.model';
import {SalaryCollaboratorService} from 'src/app/shared/service/collaborator/salary/SalaryCollaborator.service';
import {WorkloadBonusDto} from 'src/app/shared/model/salary/WorkloadBonus.model';
import {WorkloadBonusCollaboratorService} from 'src/app/shared/service/collaborator/salary/WorkloadBonusCollaborator.service';
import {ProfDto} from 'src/app/shared/model/prof/Prof.model';
import {ProfCollaboratorService} from 'src/app/shared/service/collaborator/prof/ProfCollaborator.service';

@Component({
  selector: 'app-workload-bonus-prof-edit-collaborator',
  templateUrl: './workload-bonus-prof-edit-collaborator.component.html'
})
export class WorkloadBonusProfEditCollaboratorComponent implements OnInit {

	protected _submitted = false;
    protected _errorMessages = new Array<string>();


    protected datePipe: DatePipe;
    protected messageService: MessageService;
    protected confirmationService: ConfirmationService;
    protected roleService: RoleService;
    protected router: Router;
    protected stringUtilService: StringUtilService;
    private _activeTab = 0;
    private _file: any;
    private _files: any;




    private _validWorkloadBonusCode = true;
    private _validProfRef = true;
    private _validSalaryCode = true;



    constructor(private service: WorkloadBonusProfCollaboratorService , private salaryService: SalaryCollaboratorService, private workloadBonusService: WorkloadBonusCollaboratorService, private profService: ProfCollaboratorService, @Inject(PLATFORM_ID) private platformId?) {
        this.datePipe = ServiceLocator.injector.get(DatePipe);
        this.messageService = ServiceLocator.injector.get(MessageService);
        this.confirmationService = ServiceLocator.injector.get(ConfirmationService);
        this.roleService = ServiceLocator.injector.get(RoleService);
        this.router = ServiceLocator.injector.get(Router);
        this.stringUtilService = ServiceLocator.injector.get(StringUtilService);
    }

    ngOnInit(): void {
        this.workloadBonusService.findAll().subscribe((data) => this.workloadBonuss = data);
        this.profService.findAll().subscribe((data) => this.profs = data);
        this.salaryService.findAll().subscribe((data) => this.salarys = data);
    }

    public prepareEdit() {
    }



 public edit(): void {
        this.submitted = true;
        this.prepareEdit();
        this.validateForm();
        if (this.errorMessages.length === 0) {
            this.editWithShowOption(false);
        } else {
            this.messageService.add({
                severity: 'error',
                summary: 'Erreurs',
                detail: 'Merci de corrigé les erreurs sur le formulaire'
            });
        }
    }

    public editWithShowOption(showList: boolean) {
        this.service.edit().subscribe(religion=>{
            const myIndex = this.items.findIndex(e => e.id === this.item.id);
            this.items[myIndex] = religion;
            this.editDialog = false;
            this.submitted = false;
            this.item = new WorkloadBonusProfDto();
        } , error =>{
            console.log(error);
        });
    }

    public hideEditDialog() {
        this.editDialog = false;
        this.setValidation(true);
    }





    public setValidation(value: boolean){
    }

    public validateForm(): void{
        this.errorMessages = new Array<string>();
    }




   public async openCreateWorkloadBonus(workloadBonus: string) {
        const isPermistted = await this.roleService.isPermitted('WorkloadBonus', 'edit');
        if (isPermistted) {
             this.workloadBonus = new WorkloadBonusDto();
             this.createWorkloadBonusDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }
   public async openCreateSalary(salary: string) {
        const isPermistted = await this.roleService.isPermitted('Salary', 'edit');
        if (isPermistted) {
             this.salary = new SalaryDto();
             this.createSalaryDialog = true;
        }else {
             this.messageService.add({
                severity: 'error', summary: 'erreur', detail: 'problème de permission'
            });
        }
    }

    get workloadBonus(): WorkloadBonusDto {
        return this.workloadBonusService.item;
    }
    set workloadBonus(value: WorkloadBonusDto) {
        this.workloadBonusService.item = value;
    }
    get workloadBonuss(): Array<WorkloadBonusDto> {
        return this.workloadBonusService.items;
    }
    set workloadBonuss(value: Array<WorkloadBonusDto>) {
        this.workloadBonusService.items = value;
    }
    get createWorkloadBonusDialog(): boolean {
        return this.workloadBonusService.createDialog;
    }
    set createWorkloadBonusDialog(value: boolean) {
        this.workloadBonusService.createDialog= value;
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
        this.profService.createDialog= value;
    }
    get salary(): SalaryDto {
        return this.salaryService.item;
    }
    set salary(value: SalaryDto) {
        this.salaryService.item = value;
    }
    get salarys(): Array<SalaryDto> {
        return this.salaryService.items;
    }
    set salarys(value: Array<SalaryDto>) {
        this.salaryService.items = value;
    }
    get createSalaryDialog(): boolean {
        return this.salaryService.createDialog;
    }
    set createSalaryDialog(value: boolean) {
        this.salaryService.createDialog= value;
    }



    get validWorkloadBonusCode(): boolean {
        return this._validWorkloadBonusCode;
    }
    set validWorkloadBonusCode(value: boolean) {
        this._validWorkloadBonusCode = value;
    }
    get validProfRef(): boolean {
        return this._validProfRef;
    }
    set validProfRef(value: boolean) {
        this._validProfRef = value;
    }
    get validSalaryCode(): boolean {
        return this._validSalaryCode;
    }
    set validSalaryCode(value: boolean) {
        this._validSalaryCode = value;
    }

	get items(): Array<WorkloadBonusProfDto> {
        return this.service.items;
    }

    set items(value: Array<WorkloadBonusProfDto>) {
        this.service.items = value;
    }

    get item(): WorkloadBonusProfDto {
        return this.service.item;
    }

    set item(value: WorkloadBonusProfDto) {
        this.service.item = value;
    }

    get editDialog(): boolean {
        return this.service.editDialog;
    }

    set editDialog(value: boolean) {
        this.service.editDialog = value;
    }

    get criteria(): WorkloadBonusProfCriteria {
        return this.service.criteria;
    }

    set criteria(value: WorkloadBonusProfCriteria) {
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
