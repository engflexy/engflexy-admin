import {Component, OnInit, ViewEncapsulation} from '@angular/core';
import {CoursAdminService} from "../../../shared/service/admin/course/CoursAdmin.service";

@Component({
    selector: 'example',
    standalone: true,
    templateUrl: './example.component.html',
    encapsulation: ViewEncapsulation.None,
})
export class ExampleComponent implements OnInit {
    /**
     * Constructor
     */
    constructor(private coursService: CoursAdminService) {
    }

    ngOnInit() {
        this.coursService.findAllOptimized()
            .subscribe(data => {
                console.log(data)
            })
    }
}
