import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {BehaviorSubject, Observable} from 'rxjs';


import * as moment from 'moment/moment';
import {environment} from "../../../../../environments/environment";
import {PaginatedList} from "../../../../zynerator/dto/PaginatedList.model";
import {PackageCollaboratorDto} from "../../../model/collab/PackageCollaborator.model";
import {PackageCollaboratorCriteria} from "../../../criteria/collab/PackageCollaboratorCriteria.model";
import {
    PaiementInscriptionCollaboratorStateDto
} from "../../../model/collab/PaiementInscriptionCollaboratorState.model";
import {
    PaiementInscriptionCollaboratorStateCriteria
} from "../../../criteria/collab/PaiementInscriptionCollaboratorStateCriteria.model";



@Injectable({
  providedIn: 'root'
})
export class PaiementInscriptionCollaboratorStateCollaboratorService {
    protected _API = '';
    protected _items: Array<PaiementInscriptionCollaboratorStateDto>;
    protected _item: PaiementInscriptionCollaboratorStateDto;
    protected _selections: Array<PaiementInscriptionCollaboratorStateDto>;
    protected _createDialog: boolean;
    protected _editDialog: boolean;
    protected _viewDialog: boolean;
    protected _criteria: PaiementInscriptionCollaboratorStateCriteria;
    protected _validate = false;


    private _createActionIsValid = true;
    private _editActionIsValid = true;
    private _listActionIsValid = true;
    private _deleteActionIsValid = true;
    private _viewActionIsValid = true;
    private _duplicateActionIsValid = true;


    private _createAction = 'create';
    private _listAction = 'list';
    private _editAction = 'edit';
    private _deleteAction = 'delete';
    private _viewAction = 'view';
    private _duplicateAction = 'duplicate';
    private _entityName: string;

    protected API_PERMISSION: string ;


    constructor(private http: HttpClient) {
        this.API_PERMISSION = environment.apiUrl + 'modelPermissionUser/';
    }


    public findAll() {
        return this.http.get<Array<PaiementInscriptionCollaboratorStateDto>>(this.API);
    }

    public findAllOptimized() {
        return this.http.get<Array<PaiementInscriptionCollaboratorStateDto>>(this.API + 'optimized');
    }

    public findPaginatedByCriteria(criteria: PaiementInscriptionCollaboratorStateCriteria): Observable<PaginatedList<PaiementInscriptionCollaboratorStateDto>> {
        return this.http.post<PaginatedList<PaiementInscriptionCollaboratorStateDto>>(this.API + 'find-paginated-by-criteria', criteria);
    }

    public save(): Observable<PaiementInscriptionCollaboratorStateDto> {
        return this.http.post<PaiementInscriptionCollaboratorStateDto>(this.API, this.item);
    }

    public delete(dto: PaiementInscriptionCollaboratorStateDto) {
        return this.http.delete<number>(this.API + 'id/' + dto.id);
    }


    public edit(): Observable<PaiementInscriptionCollaboratorStateDto> {
        return this.http.put<PaiementInscriptionCollaboratorStateDto>(this.API, this.item);
    }


    public findByCriteria(criteria: PaiementInscriptionCollaboratorStateCriteria): Observable<Array<PaiementInscriptionCollaboratorStateDto>> {
        return this.http.post<Array<PaiementInscriptionCollaboratorStateDto>>(this.API + 'find-by-criteria', criteria);
    }

    public findByIdWithAssociatedList(item: PaiementInscriptionCollaboratorStateDto): Observable<PaiementInscriptionCollaboratorStateDto> {
        return this.http.get<PaiementInscriptionCollaboratorStateDto>(this.API + 'id/' + item.id);
    }

    public deleteMultiple() {
        return this.http.post<void>(this.API + 'multiple', this.selections);
    }


    public exportPdf(element: PaiementInscriptionCollaboratorStateDto): Observable<ArrayBuffer> {
        return this.http.post(this.API + 'exportPdf/', element, {responseType: 'arraybuffer'});
    }

    public hasActionPermission(username: string, actionReference: string): Observable<boolean> {
        // tslint:disable-next-line:max-line-length
        return this.http.get<boolean>(this.API_PERMISSION + 'user/' + username + '/model/' + this.entityName + '/action/' + actionReference);
    }

    public importExcel(file: File): Observable<Array<PaiementInscriptionCollaboratorStateDto>> {
        const formData: FormData = new FormData();
        formData.append('file', file, file.name);
        return this.http.post<Array<PaiementInscriptionCollaboratorStateDto>>(this.API + 'import-excel', formData);
    }



    public format(myDate: Date): Date {
        if (myDate != null) {
            const newdate = new Date(myDate);
            const formattedDate = moment(newdate).format(environment.dateFormatEdit);
            console.log(formattedDate);
            myDate = new Date(formattedDate);
        }
        return myDate;
    }

    get API() {
        return environment.apiUrlAlcservice + 'collaborator/paiementInscriptionCollaboratorState/';
    }

    public get items(): Array<PaiementInscriptionCollaboratorStateDto> {
        if (this._items == null) {
            this._items = new Array<PaiementInscriptionCollaboratorStateDto>();
        }
        return this._items;
    }

    public set items(value: Array<PaiementInscriptionCollaboratorStateDto>) {
        this._items = value;
    }

    public get item(): PaiementInscriptionCollaboratorStateDto {
        if (this._item == null) {
            this._item = new PaiementInscriptionCollaboratorStateDto();
        }
        return this._item;
    }

    public set item(value: PaiementInscriptionCollaboratorStateDto) {
        this._item = value;
    }

    public get selections(): Array<PaiementInscriptionCollaboratorStateDto> {
        if (this._selections == null) {
            this._selections = new Array<PaiementInscriptionCollaboratorStateDto>();
        }
        return this._selections;
    }


    public set selections(value: Array<PaiementInscriptionCollaboratorStateDto>) {
        this._selections = value;
    }

    public get createDialog(): boolean {
        return this._createDialog;
    }

    public set createDialog(value: boolean) {
        this._createDialog = value;
    }

    public get editDialog(): boolean {
        return this._editDialog;
    }

    public set editDialog(value: boolean) {
        this._editDialog = value;
    }

    public get viewDialog(): boolean {
        return this._viewDialog;
    }

    public set viewDialog(value: boolean) {
        this._viewDialog = value;
    }

    public get criteria(): PaiementInscriptionCollaboratorStateCriteria {
        if (this._criteria == null) {
            this._criteria = new PaiementInscriptionCollaboratorStateCriteria();
        }
        return this._criteria;
    }

    public set criteria(value: PaiementInscriptionCollaboratorStateCriteria) {
        this._criteria = value;
    }


    public setApi(API: string) {
        this._API = API;
    }

    set validate(value: boolean) {
        this._validate = value;
    }


    get createAction(): string {
        return this._createAction;
    }

    set createAction(value: string) {
        this._createAction = value;
    }

    get listAction(): string {
        return this._listAction;
    }

    set listAction(value: string) {
        this._listAction = value;
    }

    get editAction(): string {
        return this._editAction;
    }

    set editAction(value: string) {
        this._editAction = value;
    }

    get deleteAction(): string {
        return this._deleteAction;
    }

    set deleteAction(value: string) {
        this._deleteAction = value;
    }

    get createActionIsValid(): boolean {
        return this._createActionIsValid;
    }

    set createActionIsValid(value: boolean) {
        this._createActionIsValid = value;
    }


    get editActionIsValid(): boolean {
        return this._editActionIsValid;
    }

    set editActionIsValid(value: boolean) {
        this._editActionIsValid = value;
    }

    get listActionIsValid(): boolean {
        return this._listActionIsValid;
    }

    set listActionIsValid(value: boolean) {
        this._listActionIsValid = value;
    }

    get deleteActionIsValid(): boolean {
        return this._deleteActionIsValid;
    }

    set deleteActionIsValid(value: boolean) {
        this._deleteActionIsValid = value;
    }

    get viewAction(): string {
        return this._viewAction;
    }

    set viewAction(value: string) {
        this._viewAction = value;
    }

    get duplicateAction(): string {
        return this._duplicateAction;
    }

    set duplicateAction(value: string) {
        this._duplicateAction = value;
    }

    get viewActionIsValid(): boolean {
        return this._viewActionIsValid;
    }

    set viewActionIsValid(value: boolean) {
        this._viewActionIsValid = value;
    }

    get duplicateActionIsValid(): boolean {
        return this._duplicateActionIsValid;
    }

    set duplicateActionIsValid(value: boolean) {
        this._duplicateActionIsValid = value;
    }

    get entityName(): string {
        return this._entityName;
    }

    set entityName(value: string) {
        this._entityName = value;
    }

}
