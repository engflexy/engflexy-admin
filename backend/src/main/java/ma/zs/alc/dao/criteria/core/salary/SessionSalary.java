package ma.zs.alc.dao.criteria.core.salary;

import ma.zs.alc.bean.core.learning.SessionCours;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;

public class SessionSalary {
    public Long id;
    public String group;
    public String prof;
    public String course;
    public boolean courseFinished;
    public LocalDateTime date;
    public BigDecimal price;

    public SessionSalary(SessionCours s) {
        this.id = s.getId();
        this.group = s.getGroupeEtudiant().getLibelle();
        this.prof = s.getProf().getFullName();
        this.course = s.getCours().getLibelle();
        this.courseFinished = s.getPayer();
        this.date = s.getDateDebut();
        this.price = s.getProf().getCategorieProf().getLessonRate();
    }
}
