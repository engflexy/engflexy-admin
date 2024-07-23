import {ChangeDetectorRef, Component, Input, ViewChild} from '@angular/core';
import {CalendarOptions, EventDropArg} from "@fullcalendar/core";
// @ts-ignore
import {DateSelectArg, EventApi, EventClickArg, FullCalendarComponent, FullCalendarModule} from "@fullcalendar/angular";
import dayGridPlugin from '@fullcalendar/daygrid';
import interactionPlugin, {DateClickArg} from '@fullcalendar/interaction';
import timeGridPlugin from '@fullcalendar/timegrid';
import {DatePipe} from "@angular/common";
import {MatDialog} from "@angular/material/dialog";
import {Class} from "./models/Class";
import {
    ScheduleProfCollaboratorService
} from "../../../shared/service/collaborator/prof/ScheduleProfCollaborator.service";
import {AuthService} from "../../../zynerator/security/shared/service/Auth.service";
import {PopUpInfoComponent} from "./pop-up-info/pop-up-info.component";
import {GroupeEtudiantDto} from "../../../shared/model/grpe/GroupeEtudiant.model";
import {ProfDto} from "../../../shared/model/prof/Prof.model";
import {ScheduleProfCreateCollaboratorComponent} from "./create/schedule-prof-create-collaborator.component";
import {ScheduleProfDto} from "../../../shared/model/prof/ScheduleProf.model";

@Component({
    selector: 'app-calendar',
    styleUrls: ['./schedule.component.scss'],
    templateUrl: './schedule.component.html'
})
export class ScheduleComponent {
    @ViewChild('calendar') calendarComponent: FullCalendarComponent;
    schedules: Array<Class> = new Array<Class>();
    @Input()
    group: GroupeEtudiantDto = null;
    @Input()
    prof: ProfDto = null;

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
        editable: true,
        droppable: true,
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
        eventReceive: this.handleEventReceive.bind(this), // bind to make `this` refer to the component
        eventDrop: this.handleEventDrop.bind(this),
        dateClick: this.handleDateClick.bind(this), // bind to make `this` refer to the component
    };

    private handle_dateSet(start: Date, end: Date) {
        const startDate = this.datePipe.transform(start, "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        const endDate = this.datePipe.transform(end, "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
        const id = this.auth.authenticatedUser?.id

        this.scheduleService.get_schedules_between(startDate, endDate, id, this.group, this.prof)
            .subscribe(response => {
                this.schedules = response
                // @ts-ignore
                this.calendarOptions.events = this.schedules
                this.ref.markForCheck()
            })
    }

    handleDateClick(arg: DateClickArg) {
        console.log('Date clicked: ', arg.dateStr);
        this.item.startTime = arg.date
        this.item.endTime = new Date(arg.date.getTime() + 60 * 60 * 1000); // ajouter une heure
        this.create()
    }

    constructor(private scheduleService: ScheduleProfCollaboratorService,
                private ref: ChangeDetectorRef,
                public dialog: MatDialog,
                private auth: AuthService,
                private datePipe: DatePipe) {
    }

    get item(): ScheduleProfDto {
        return this.scheduleService.item;
    }

    set item(value: ScheduleProfDto) {
        this.scheduleService.item = value;
    }

    handleEventClick(clickInfo: EventClickArg) {
        const id = Number(clickInfo.event.id);
        const classe = this.schedules.filter(s => s.id === id)[0]
        const dialog = this.dialog.open(PopUpInfoComponent, {
            data: classe,
        });

        dialog.afterClosed().subscribe((res: { data: Class, type: string }) => {
            if (res != null) {
                if (res.type === 'create')
                    this.add_class_schedule(res.data);
                else
                    this.remove_class_schedule(res.data);
            }
        })
    }

    handleEventReceive(info) {
        // info.draggedEl is the HTML element being dragged
        // info.event is the Event Object that has been dropped
        console.log('Element dragged:', info.draggedEl);
        console.log('Event object:', info.event);

        // Save the event to your database here
    }

    handleEventDrop(info: EventDropArg) {
        // info.event is the Event Object that was moved
        console.log('Updated event:', info.event);
        console.log('start at ==> ' + info.event.start)
        console.log('end at ==> ' + info.event.end)
        console.log('event id ==> ' + info.event.id)
        const schedule: ScheduleProfDto = new ScheduleProfDto()
        schedule.id = Number(info.event.id)
        schedule.startTime = info.event.start
        schedule.endTime = info.event.end
        this.scheduleService.updateScheduleTime(schedule).subscribe()

        // Update the event in your database here
    }

    create() {
        if (this.group && this.group?.id) {
            this.item.groupeEtudiant = this.group
            this.item.prof = this.group.prof
        }
        const dialog = this.dialog.open(ScheduleProfCreateCollaboratorComponent, {
            autoFocus: false,
            height: "auto",
            width: "calc(100% - 100px)",
            maxWidth: "100%",
            disableClose: true,
            maxHeight: "100%"
        });
        dialog.afterClosed().subscribe((res: ScheduleProfDto) => {
            if (res != null) {
                const classe: Class = new Class();
                classe.end = res.endTime;
                classe.start = res.startTime;
                classe.title = res.cours.libelle;
                classe.group = res.groupeEtudiant.libelle;
                classe.teacher = res.prof.fullName;
                this.add_class_schedule(classe);
            }
            this.item = new ScheduleProfDto()
        })
    }

    private add_class_schedule(classe: Class) {
        if (classe?.id) {
            const index = this.schedules.findIndex(s => s.id === classe.id)
            this.schedules.splice(index, 1);
        }
        this.schedules.push({...classe});
        // @ts-ignore
        this.calendarOptions.events = [...this.schedules];

        // Refresh the calendar to show the new event
        const calendarApi = this.calendarComponent.getApi();
        calendarApi.removeAllEvents(); // Clear all existing events
        // @ts-ignore
        calendarApi.addEventSource(this.schedules); // Add updated events

        this.ref.markForCheck();
    }

    private remove_class_schedule(classe: Class) {
        if (classe?.id) {
            const index = this.schedules.findIndex(s => s.id === classe.id)
            this.schedules.splice(index, 1);
        }
        // @ts-ignore
        this.calendarOptions.events = [...this.schedules];

        // Refresh the calendar to show the new event
        const calendarApi = this.calendarComponent.getApi();
        calendarApi.removeAllEvents(); // Clear all existing events
        // @ts-ignore
        calendarApi.addEventSource(this.schedules); // Add updated events

        this.ref.markForCheck();
    }
}
