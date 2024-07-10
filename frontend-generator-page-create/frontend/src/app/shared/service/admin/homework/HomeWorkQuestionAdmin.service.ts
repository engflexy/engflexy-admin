import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {BehaviorSubject, Observable} from 'rxjs';

import {environment} from 'src/environments/environment';
import {PaginatedList} from 'src/app/zynerator/dto/PaginatedList.model';
import * as moment from 'moment/moment';

import {HomeWorkQuestionDto} from 'src/app/shared/model/homework/HomeWorkQuestion.model';
import {HomeWorkQuestionCriteria} from 'src/app/shared/criteria/homework/HomeWorkQuestionCriteria.model';


@Injectable({
  providedIn: 'root'
})
export class HomeWorkQuestionAdminService {
    protected _API = '';
    protected _items: Array<HomeWorkQuestionDto>;
    protected _item: HomeWorkQuestionDto;
    protected _selections: Array<HomeWorkQuestionDto>;
    protected _createDialog: boolean;
    protected _editDialog: boolean;
    protected _viewDialog: boolean;
    protected _criteria: HomeWorkQuestionCriteria;
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
        return this.http.get<Array<HomeWorkQuestionDto>>(this.API);
    }

    public findAllOptimized() {
        return this.http.get<Array<HomeWorkQuestionDto>>(this.API + 'optimized');
    }

    public findPaginatedByCriteria(criteria: HomeWorkQuestionCriteria): Observable<PaginatedList<HomeWorkQuestionDto>> {
        return this.http.post<PaginatedList<HomeWorkQuestionDto>>(this.API + 'find-paginated-by-criteria', criteria);
    }

    public save(): Observable<HomeWorkQuestionDto> {
        return this.http.post<HomeWorkQuestionDto>(this.API, this.item);
    }

    public delete(dto: HomeWorkQuestionDto) {
        return this.http.delete<number>(this.API + 'id/' + dto.id);
    }


    public edit(): Observable<HomeWorkQuestionDto> {
        return this.http.put<HomeWorkQuestionDto>(this.API, this.item);
    }


    public findByCriteria(criteria: HomeWorkQuestionCriteria): Observable<Array<HomeWorkQuestionDto>> {
        return this.http.post<Array<HomeWorkQuestionDto>>(this.API + 'find-by-criteria', criteria);
    }

    public findByIdWithAssociatedList(item: HomeWorkQuestionDto): Observable<HomeWorkQuestionDto> {
        return this.http.get<HomeWorkQuestionDto>(this.API + 'id/' + item.id);
    }

    public deleteMultiple() {
        return this.http.post<void>(this.API + 'multiple', this.selections);
    }


    public exportPdf(element: HomeWorkQuestionDto): Observable<ArrayBuffer> {
        return this.http.post(this.API + 'exportPdf/', element, {responseType: 'arraybuffer'});
    }

    public hasActionPermission(username: string, actionReference: string): Observable<boolean> {
        // tslint:disable-next-line:max-line-length
        return this.http.get<boolean>(this.API_PERMISSION + 'user/' + username + '/model/' + this.entityName + '/action/' + actionReference);
    }

    public importExcel(file: File): Observable<Array<HomeWorkQuestionDto>> {
        const formData: FormData = new FormData();
        formData.append('file', file, file.name);
        return this.http.post<Array<HomeWorkQuestionDto>>(this.API + 'import-excel', formData);
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
        return environment.apiUrlAlcservice + 'admin/homeWorkQuestion/';
    }

    public get items(): Array<HomeWorkQuestionDto> {
        if (this._items == null) {
            this._items = new Array<HomeWorkQuestionDto>();
        }
        return this._items;
    }

    public set items(value: Array<HomeWorkQuestionDto>) {
        this._items = value;
    }

    public get item(): HomeWorkQuestionDto {
        if (this._item == null) {
            this._item = new HomeWorkQuestionDto();
        }
        return this._item;
    }

    public set item(value: HomeWorkQuestionDto) {
        this._item = value;
    }

    public get selections(): Array<HomeWorkQuestionDto> {
        if (this._selections == null) {
            this._selections = new Array<HomeWorkQuestionDto>();
        }
        return this._selections;
    }


    public set selections(value: Array<HomeWorkQuestionDto>) {
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

    public get criteria(): HomeWorkQuestionCriteria {
        if (this._criteria == null) {
            this._criteria = new HomeWorkQuestionCriteria();
        }
        return this._criteria;
    }

    public set criteria(value: HomeWorkQuestionCriteria) {
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
