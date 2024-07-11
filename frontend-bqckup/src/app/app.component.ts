import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import {FuseAlertComponent} from "../@fuse/components/alert";

@Component({
    selector   : 'app-root',
    templateUrl: './app.component.html',
    styleUrls  : ['./app.component.scss'],
    standalone : true,
    imports: [RouterOutlet, FuseAlertComponent],
})
export class AppComponent
{
    /**
     * Constructor
     */
    constructor()
    {
    }
}
