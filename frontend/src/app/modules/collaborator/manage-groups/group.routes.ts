import {Routes} from "@angular/router";
import {ManageGroupsComponent} from "./manage-groups.component";
import {GroupDetailsComponent} from "./group-details/group-details.component";

export default [
    {
        path: '',
        component: ManageGroupsComponent,
    },
    {
        path: 'group-details/:id',
        component: GroupDetailsComponent,
    },

] as Routes;
