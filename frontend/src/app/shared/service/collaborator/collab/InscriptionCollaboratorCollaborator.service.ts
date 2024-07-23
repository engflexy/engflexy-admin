import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {BehaviorSubject, Observable} from 'rxjs';

import * as moment from 'moment/moment';
import {InscriptionCollaboratorDto} from "../../../model/collab/InscriptionCollaborator.model";
import {InscriptionCollaboratorCriteria} from "../../../criteria/collab/InscriptionCollaboratorCriteria.model";
import {environment} from "../../../../../environments/environment";
import {PaginatedList} from "../../../../zynerator/dto/PaginatedList.model";

@Injectable({
  providedIn: 'root'
})
export class InscriptionCollaboratorCollaboratorService {
    protected _API = '';
    protected _items: Array<InscriptionCollaboratorDto>;
    protected _item: InscriptionCollaboratorDto;
    protected _selections: Array<InscriptionCollaboratorDto>;
    protected _createDialog: boolean;
    protected _editDialog: boolean;
    protected _viewDialog: boolean;
    protected _criteria: InscriptionCollaboratorCriteria;
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
        return this.http.get<Array<InscriptionCollaboratorDto>>(this.API);
    }

    public findAllOptimized() {
        return this.http.get<Array<InscriptionCollaboratorDto>>(this.API + 'optimized');
    }

    public findPaginatedByCriteria(criteria: InscriptionCollaboratorCriteria): Observable<PaginatedList<InscriptionCollaboratorDto>> {
        return this.http.post<PaginatedList<InscriptionCollaboratorDto>>(this.API + 'find-paginated-by-criteria', criteria);
    }


    public save(): Observable<InscriptionCollaboratorDto> {
        return this.http.post<InscriptionCollaboratorDto>(this.API, this.item);
    }

    public delete(dto: InscriptionCollaboratorDto) {
        return this.http.delete<number>(this.API + 'id/' + dto.id);
    }


    public edit(): Observable<InscriptionCollaboratorDto> {
        return this.http.put<InscriptionCollaboratorDto>(this.API, this.item);
    }


    public findByCollaboratorTypeCollaboratorIdSchool(): Observable<Array<InscriptionCollaboratorDto>> {
        return this.http.get<Array<InscriptionCollaboratorDto>>(this.API + 'school');
    }

    public findByCollaboratorTypeCollaboratorIdTeacher(): Observable<Array<InscriptionCollaboratorDto>> {
        return this.http.get<Array<InscriptionCollaboratorDto>>(this.API + 'teacher');
    }


    public findByCriteria(criteria: InscriptionCollaboratorCriteria): Observable<Array<InscriptionCollaboratorDto>> {
        return this.http.post<Array<InscriptionCollaboratorDto>>(this.API + 'find-by-criteria', criteria);
    }

    public findByIdWithAssociatedList(item: InscriptionCollaboratorDto): Observable<InscriptionCollaboratorDto> {
        return this.http.get<InscriptionCollaboratorDto>(this.API + 'id/' + item.id);
    }

    public deleteMultiple() {
        return this.http.post<void>(this.API + 'multiple', this.selections);
    }


    public exportPdf(element: InscriptionCollaboratorDto): Observable<ArrayBuffer> {
        return this.http.post(this.API + 'exportPdf/', element, {responseType: 'arraybuffer'});
    }

    public hasActionPermission(username: string, actionReference: string): Observable<boolean> {
        // tslint:disable-next-line:max-line-length
        return this.http.get<boolean>(this.API_PERMISSION + 'user/' + username + '/model/' + this.entityName + '/action/' + actionReference);
    }

    public importExcel(file: File): Observable<Array<InscriptionCollaboratorDto>> {
        const formData: FormData = new FormData();
        formData.append('file', file, file.name);
        return this.http.post<Array<InscriptionCollaboratorDto>>(this.API + 'import-excel', formData);
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
        return environment.apiUrlAlcservice + 'collaborator/inscriptionCollaborator/';
    }

    public get items(): Array<InscriptionCollaboratorDto> {
        if (this._items == null) {
            this._items = new Array<InscriptionCollaboratorDto>();
        }
        return this._items;
    }

    public set items(value: Array<InscriptionCollaboratorDto>) {
        this._items = value;
    }

    public get item(): InscriptionCollaboratorDto {
        if (this._item == null) {
            this._item = new InscriptionCollaboratorDto();
        }
        return this._item;
    }

    public set item(value: InscriptionCollaboratorDto) {
        this._item = value;
    }

    public get selections(): Array<InscriptionCollaboratorDto> {
        if (this._selections == null) {
            this._selections = new Array<InscriptionCollaboratorDto>();
        }
        return this._selections;
    }


    public set selections(value: Array<InscriptionCollaboratorDto>) {
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

    public get criteria(): InscriptionCollaboratorCriteria {
        if (this._criteria == null) {
            this._criteria = new InscriptionCollaboratorCriteria();
        }
        return this._criteria;
    }

    public set criteria(value: InscriptionCollaboratorCriteria) {
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
