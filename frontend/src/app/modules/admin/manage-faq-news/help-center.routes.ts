import {inject} from '@angular/core';
import {Routes} from '@angular/router';
import {HelpCenterService} from "./help-center.service";
import {ManageFaqNewsComponent} from "./manage-faq-news.component";

export default [
    {
        path: '',
        component: ManageFaqNewsComponent,
        resolve: {
            faqs: () => inject(HelpCenterService).getAllFaqs(),
        },
    },
] as Routes;
