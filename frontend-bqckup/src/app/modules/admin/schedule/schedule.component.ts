import {ChangeDetectorRef, Component, ViewChild} from '@angular/core';
import {CalendarOptions} from "@fullcalendar/core";
// @ts-ignore
import {DateSelectArg, EventApi, EventClickArg, FullCalendarComponent, FullCalendarModule} from "@fullcalendar/angular";
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin from '@fullcalendar/interaction';
import timeGridPlugin from '@fullcalendar/timegrid';
import {DatePipe} from "@angular/common";
import {MatDialog} from "@angular/material/dialog";
import {Class} from "./models/Class";
import {
    ScheduleProfCollaboratorService
} from "../../../shared/service/collaborator/prof/ScheduleProfCollaborator.service";
import {AuthService} from "../../../zynerator/security/shared/service/Auth.service";
import {PopUpInfoComponent} from "./pop-up-info/pop-up-info.component";
import {MatButtonModule} from "@angular/material/button";
import {MatFormFieldModule} from "@angular/material/form-field";
import {MatIconModule} from "@angular/material/icon";
import {MatInputModule} from "@angular/material/input";

@Component({
    selector: 'app-calendar-teacher',
    styleUrls: ['./schedule.component.scss'],
    templateUrl: './schedule.component.html',
    standalone: true,
    imports: [FullCalendarModule, MatButtonModule, MatFormFieldModule, MatIconModule, MatInputModule]
})
export class ScheduleComponent {
    @ViewChild('calendar') calendarComponent: FullCalendarComponent;
    schedules: Array<Class> = new Array<Class>();

    calendarOptions: CalendarOptions = {
        plugins: [timeGridPlugin, dayGridPlugin, interactionPlugin],
        headerToolbar: {
            left: 'prev,today,next',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        slotLabelFormat: {
            hour: '2-digit',
            minute: '2-digit',
            omitZeroMinute: false,
            hour12: false, // Set this to false to use 24-hour format
        },
        initialView: 'timeGridWeek',
        height: '100%',
        weekends: true,
        editable: false,
        selectable: true,
        selectMirror: true,
        dayMaxEvents: true,
        datesSet: (info) => {
            const start = info.start;
            const end = info.end;
            this.handle_dateSet(start, end);
            // You can now use 'start' and 'end' as the start and end dates of the current view
        },
        eventClick: this.handleEventClick.bind(this),
    };

    private handle_dateSet(start: Date, end: Date) {
        const startDate = this.datePipe.transform(start, "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        const endDate = this.datePipe.transform(end, "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        const id = this.auth.authenticatedUser?.id
        this.scheduleService.get_schedules_between(startDate, endDate, id)
            .subscribe(response => {
                this.schedules = response
                // @ts-ignore
                this.calendarOptions.events = this.schedules
                this.ref.markForCheck()
            })
    }


    constructor(private scheduleService: ScheduleProfCollaboratorService,
                private ref: ChangeDetectorRef,
                public dialog: MatDialog,
                private auth: AuthService,
                private datePipe: DatePipe) {
    }

    handleEventClick(clickInfo: EventClickArg) {
        const id = Number(clickInfo.event.id);
        const classe = this.schedules.filter(s => s.id === id)[0]
        this.dialog.open(PopUpInfoComponent, {
            data: classe,
        });
    }


    create() {

    }
}
