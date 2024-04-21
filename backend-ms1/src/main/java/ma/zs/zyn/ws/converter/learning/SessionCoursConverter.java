package  ma.zs.zyn.ws.converter.learning;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ma.zs.zyn.zynerator.util.ListUtil;

import ma.zs.zyn.ws.converter.salary.SalaryConverter;
import ma.zs.zyn.ws.converter.grpe.GroupeEtudiantConverter;
import ma.zs.zyn.ws.converter.learning.SessionCoursSectionConverter;
import ma.zs.zyn.ws.converter.course.SectionConverter;
import ma.zs.zyn.ws.converter.course.CoursConverter;
import ma.zs.zyn.ws.converter.prof.ProfConverter;

import ma.zs.zyn.bean.core.prof.Prof;
import ma.zs.zyn.bean.core.course.Cours;
import ma.zs.zyn.bean.core.grpe.GroupeEtudiant;


import ma.zs.zyn.zynerator.util.StringUtil;
import ma.zs.zyn.zynerator.converter.AbstractConverter;
import ma.zs.zyn.zynerator.util.DateUtil;
import ma.zs.zyn.bean.core.learning.SessionCours;
import ma.zs.zyn.ws.dto.learning.SessionCoursDto;

@Component
public class SessionCoursConverter extends AbstractConverter<SessionCours, SessionCoursDto> {

    @Autowired
    private SalaryConverter salaryConverter ;
    @Autowired
    private GroupeEtudiantConverter groupeEtudiantConverter ;
    @Autowired
    private SessionCoursSectionConverter sessionCoursSectionConverter ;
    @Autowired
    private SectionConverter sectionConverter ;
    @Autowired
    private CoursConverter coursConverter ;
    @Autowired
    private ProfConverter profConverter ;
    private boolean prof;
    private boolean cours;
    private boolean groupeEtudiant;
    private boolean salary;
    private boolean sessionCoursSections;

    public  SessionCoursConverter() {
        super(SessionCours.class, SessionCoursDto.class);
        init(true);
    }

    @Override
    public SessionCours toItem(SessionCoursDto dto) {
        if (dto == null) {
            return null;
        } else {
        SessionCours item = new SessionCours();
            if(StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if(StringUtil.isNotEmpty(dto.getReference()))
                item.setReference(dto.getReference());
            if(StringUtil.isNotEmpty(dto.getDuree()))
                item.setDuree(dto.getDuree());
            if(StringUtil.isNotEmpty(dto.getTotalheure()))
                item.setTotalheure(dto.getTotalheure());
            if(StringUtil.isNotEmpty(dto.getMois()))
                item.setMois(dto.getMois());
            if(StringUtil.isNotEmpty(dto.getAnnee()))
                item.setAnnee(dto.getAnnee());
            if(StringUtil.isNotEmpty(dto.getDateFin()))
                item.setDateFin(DateUtil.stringEnToDate(dto.getDateFin()));
            if(StringUtil.isNotEmpty(dto.getDateDebut()))
                item.setDateDebut(DateUtil.stringEnToDate(dto.getDateDebut()));
            if(dto.getPayer() != null)
                item.setPayer(dto.getPayer());
            if(StringUtil.isNotEmpty(dto.getNreKeySectionFinished()))
                item.setNreKeySectionFinished(dto.getNreKeySectionFinished());
            if(StringUtil.isNotEmpty(dto.getNreAddSectionFinished()))
                item.setNreAddSectionFinished(dto.getNreAddSectionFinished());
            if(StringUtil.isNotEmpty(dto.getTotalKeySection()))
                item.setTotalKeySection(dto.getTotalKeySection());
            if(StringUtil.isNotEmpty(dto.getTotalAddSection()))
                item.setTotalAddSection(dto.getTotalAddSection());
            if(StringUtil.isNotEmpty(dto.getNreWords()))
                item.setNreWords(dto.getNreWords());
//            if(dto.getHomeworkFinished() != null)
                item.setHomeworkFinished(dto.getHomeworkFinished());
//            if(dto.getCourseFinished() != null)
                item.setCourseFinished(dto.getCourseFinished());
            if(dto.getProf() != null && dto.getProf().getId() != null){
                item.setProf(new Prof());
                item.getProf().setId(dto.getProf().getId());
                item.getProf().setRef(dto.getProf().getRef());
            }

            if(dto.getCours() != null && dto.getCours().getId() != null){
                item.setCours(new Cours());
                item.getCours().setId(dto.getCours().getId());
                item.getCours().setLibelle(dto.getCours().getLibelle());
            }

            if(dto.getGroupeEtudiant() != null && dto.getGroupeEtudiant().getId() != null){
                item.setGroupeEtudiant(new GroupeEtudiant());
                item.getGroupeEtudiant().setId(dto.getGroupeEtudiant().getId());
                item.getGroupeEtudiant().setId(dto.getGroupeEtudiant().getId());
            }

            if(this.salary && dto.getSalary()!=null)
                item.setSalary(salaryConverter.toItem(dto.getSalary())) ;


            if(this.sessionCoursSections && ListUtil.isNotEmpty(dto.getSessionCoursSections()))
                item.setSessionCoursSections(sessionCoursSectionConverter.toItem(dto.getSessionCoursSections()));


        return item;
        }
    }

    @Override
    public SessionCoursDto toDto(SessionCours item) {
        if (item == null) {
            return null;
        } else {
            SessionCoursDto dto = new SessionCoursDto();
            if(StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if(StringUtil.isNotEmpty(item.getReference()))
                dto.setReference(item.getReference());
            if(StringUtil.isNotEmpty(item.getDuree()))
                dto.setDuree(item.getDuree());
            if(StringUtil.isNotEmpty(item.getTotalheure()))
                dto.setTotalheure(item.getTotalheure());
            if(StringUtil.isNotEmpty(item.getMois()))
                dto.setMois(item.getMois());
            if(StringUtil.isNotEmpty(item.getAnnee()))
                dto.setAnnee(item.getAnnee());
            if(item.getDateFin()!=null)
                dto.setDateFin(DateUtil.dateTimeToString(item.getDateFin()));
            if(item.getDateDebut()!=null)
                dto.setDateDebut(DateUtil.dateTimeToString(item.getDateDebut()));
                dto.setPayer(item.getPayer());
            if(StringUtil.isNotEmpty(item.getNreKeySectionFinished()))
                dto.setNreKeySectionFinished(item.getNreKeySectionFinished());
            if(StringUtil.isNotEmpty(item.getNreAddSectionFinished()))
                dto.setNreAddSectionFinished(item.getNreAddSectionFinished());
            if(StringUtil.isNotEmpty(item.getTotalKeySection()))
                dto.setTotalKeySection(item.getTotalKeySection());
            if(StringUtil.isNotEmpty(item.getTotalAddSection()))
                dto.setTotalAddSection(item.getTotalAddSection());
            if(StringUtil.isNotEmpty(item.getNreWords()))
                dto.setNreWords(item.getNreWords());
                dto.setHomeworkFinished(item.getHomeworkFinished());
                dto.setCourseFinished(item.getCourseFinished());
            if(this.prof && item.getProf()!=null) {
                dto.setProf(profConverter.toDto(item.getProf())) ;

            }
            if(this.cours && item.getCours()!=null) {
                dto.setCours(coursConverter.toDto(item.getCours())) ;

            }
            if(this.groupeEtudiant && item.getGroupeEtudiant()!=null) {
                dto.setGroupeEtudiant(groupeEtudiantConverter.toDto(item.getGroupeEtudiant())) ;

            }
            if(this.salary && item.getSalary()!=null) {
                dto.setSalary(salaryConverter.toDto(item.getSalary())) ;

            }
        if(this.sessionCoursSections && ListUtil.isNotEmpty(item.getSessionCoursSections())){
            sessionCoursSectionConverter.init(true);
            sessionCoursSectionConverter.setSessionCours(false);
            dto.setSessionCoursSections(sessionCoursSectionConverter.toDto(item.getSessionCoursSections()));
            sessionCoursSectionConverter.setSessionCours(true);

        }


        return dto;
        }
    }

    public void copy(SessionCoursDto dto, SessionCours t) {
    super.copy(dto, t);
    if (dto.getProf() != null)
        profConverter.copy(dto.getProf(), t.getProf());
    if (dto.getCours() != null)
        coursConverter.copy(dto.getCours(), t.getCours());
    if (dto.getGroupeEtudiant() != null)
        groupeEtudiantConverter.copy(dto.getGroupeEtudiant(), t.getGroupeEtudiant());
    if (dto.getSalary() != null)
        salaryConverter.copy(dto.getSalary(), t.getSalary());
    if (dto.getSessionCoursSections() != null)
        t.setSessionCoursSections(sessionCoursSectionConverter.copy(dto.getSessionCoursSections()));
    }


    public void initList(boolean value) {
        this.sessionCoursSections = value;
    }

    public void initObject(boolean value) {
        this.prof = value;
        this.cours = value;
        this.groupeEtudiant = value;
        this.salary = value;
    }


    public SalaryConverter getSalaryConverter(){
        return this.salaryConverter;
    }
    public void setSalaryConverter(SalaryConverter salaryConverter ){
        this.salaryConverter = salaryConverter;
    }
    public GroupeEtudiantConverter getGroupeEtudiantConverter(){
        return this.groupeEtudiantConverter;
    }
    public void setGroupeEtudiantConverter(GroupeEtudiantConverter groupeEtudiantConverter ){
        this.groupeEtudiantConverter = groupeEtudiantConverter;
    }
    public SessionCoursSectionConverter getSessionCoursSectionConverter(){
        return this.sessionCoursSectionConverter;
    }
    public void setSessionCoursSectionConverter(SessionCoursSectionConverter sessionCoursSectionConverter ){
        this.sessionCoursSectionConverter = sessionCoursSectionConverter;
    }
    public SectionConverter getSectionConverter(){
        return this.sectionConverter;
    }
    public void setSectionConverter(SectionConverter sectionConverter ){
        this.sectionConverter = sectionConverter;
    }
    public CoursConverter getCoursConverter(){
        return this.coursConverter;
    }
    public void setCoursConverter(CoursConverter coursConverter ){
        this.coursConverter = coursConverter;
    }
    public ProfConverter getProfConverter(){
        return this.profConverter;
    }
    public void setProfConverter(ProfConverter profConverter ){
        this.profConverter = profConverter;
    }
    public boolean  isProf(){
        return this.prof;
    }
    public void  setProf(boolean prof){
        this.prof = prof;
    }
    public boolean  isCours(){
        return this.cours;
    }
    public void  setCours(boolean cours){
        this.cours = cours;
    }
    public boolean  isGroupeEtudiant(){
        return this.groupeEtudiant;
    }
    public void  setGroupeEtudiant(boolean groupeEtudiant){
        this.groupeEtudiant = groupeEtudiant;
    }
    public boolean  isSalary(){
        return this.salary;
    }
    public void  setSalary(boolean salary){
        this.salary = salary;
    }
    public boolean  isSessionCoursSections(){
        return this.sessionCoursSections ;
    }
    public void  setSessionCoursSections(boolean sessionCoursSections ){
        this.sessionCoursSections  = sessionCoursSections ;
    }
}
