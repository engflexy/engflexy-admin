package ma.zs.alc.dao.criteria.core.prof;

import ma.zs.alc.bean.core.prof.ScheduleProf;
import ma.zs.alc.zynerator.util.DateUtil;

public class ScheduleEvent {
    public Long id;
    public String start;
    public String end;
    public String title;
    public String backgroundColor;
    public String borderColor;
    public String group;
    public String teacher;

    public ScheduleEvent(ScheduleProf scheduleProf) {
        this.id = scheduleProf.getId();
        this.start = DateUtil.dateTimeToStringForSchedule(scheduleProf.getStartTime());
        this.end = DateUtil.dateTimeToStringForSchedule(scheduleProf.getEndTime());
        this.title = scheduleProf.getSubject();
        this.backgroundColor = scheduleProf.getColor();
        this.borderColor = scheduleProf.getColor();
        this.group = scheduleProf.getGroupeEtudiant().getLibelle();
        this.teacher = scheduleProf.getProf().getFullName();
    }
}
