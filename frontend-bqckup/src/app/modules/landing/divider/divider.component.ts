import {Component, Input} from '@angular/core';

@Component({
    selector: 'app-divider',
    templateUrl: './divider.component.html',
    standalone: true
})
export class DividerComponent {
    @Input()
    text: string
    @Input()
    color: string = 'white'
}
