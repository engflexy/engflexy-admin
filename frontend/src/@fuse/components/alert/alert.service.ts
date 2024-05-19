import {Injectable} from '@angular/core';
import {Observable, ReplaySubject} from 'rxjs';


class alertModel {
    name: string;
    message: string


    constructor(name?: string, message?: string) {
        this.name = name;
        this.message = message;
    }
}

@Injectable({providedIn: 'root'})
export class FuseAlertService {
    private readonly _onDismiss: ReplaySubject<string> = new ReplaySubject<string>(1);
    private readonly _onShow: ReplaySubject<alertModel> = new ReplaySubject<alertModel>(1);


    /**
     * Constructor
     */
    constructor() {
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Accessors
    // -----------------------------------------------------------------------------------------------------

    /**
     * Getter for onDismiss
     */
    get onDismiss(): Observable<any> {
        return this._onDismiss.asObservable();
    }

    /**
     * Getter for onShow
     */
    get onShow(): Observable<any> {
        return this._onShow.asObservable();
    }

    // -----------------------------------------------------------------------------------------------------
    // @ Public methods
    // -----------------------------------------------------------------------------------------------------

    /**
     * Dismiss the alert
     *
     * @param name
     */
    dismiss(name: string): void {
        // Return if the name is not provided
        if (!name) {
            return;
        }

        // Execute the observable
        this._onDismiss.next(name);
    }

    /**
     * Show the dismissed alert
     *
     * @param name
     * @param message
     * @param duration
     */
    show(name: string, message: string, duration?: number): void {
        if (!duration || duration == 0) {
            duration = 3000
        }
        // Return if the name is not provided
        if (!name) {
            return;
        }

        // Execute the observable
        this._onShow.next(new alertModel(name, message));
        const timer = setInterval(() => {
            this.dismiss(name)
            clearInterval(timer);
        }, duration);
    }

}
