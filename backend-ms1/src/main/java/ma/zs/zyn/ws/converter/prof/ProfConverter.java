package  ma.zs.zyn.ws.converter.prof;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ma.zs.zyn.zynerator.util.ListUtil;

import ma.zs.zyn.ws.converter.course.ParcoursConverter;
import ma.zs.zyn.ws.converter.prof.TypeTeacherConverter;
import ma.zs.zyn.ws.converter.recomrecla.RecommendTeacherConverter;
import ma.zs.zyn.ws.converter.prof.CategorieProfConverter;
import ma.zs.zyn.ws.converter.prof.TrancheHoraireProfConverter;
import ma.zs.zyn.ws.converter.inscriptionref.ClassRoomConverter;

import ma.zs.zyn.bean.core.course.Parcours;
import ma.zs.zyn.bean.core.prof.CategorieProf;


import ma.zs.zyn.zynerator.util.StringUtil;
import ma.zs.zyn.zynerator.converter.AbstractConverter;
import ma.zs.zyn.zynerator.util.DateUtil;
import ma.zs.zyn.bean.core.prof.Prof;
import ma.zs.zyn.ws.dto.prof.ProfDto;

@Component
public class ProfConverter extends AbstractConverter<Prof, ProfDto> {

    @Autowired
    private ParcoursConverter parcoursConverter ;
    @Autowired
    private TypeTeacherConverter typeTeacherConverter ;
    @Autowired
    private RecommendTeacherConverter recommendTeacherConverter ;
    @Autowired
    private CategorieProfConverter categorieProfConverter ;
    @Autowired
    private TrancheHoraireProfConverter trancheHoraireProfConverter ;
    @Autowired
    private ClassRoomConverter classRoomConverter ;
    private boolean parcours;
    private boolean categorieProf;
    private boolean typeTeacher;
    private boolean trancheHoraireProfs;
    private boolean classRooms;
    private boolean recommendTeachers;

    public  ProfConverter() {
        super(Prof.class, ProfDto.class);
        init(true);
    }

    @Override
    public Prof toItem(ProfDto dto) {
        if (dto == null) {
            return null;
        } else {
        Prof item = new Prof();
            if(StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if(StringUtil.isNotEmpty(dto.getRef()))
                item.setRef(dto.getRef());
            if(StringUtil.isNotEmpty(dto.getAbout()))
                item.setAbout(dto.getAbout());
            item.setCredentialsNonExpired(dto.getCredentialsNonExpired());
            item.setEnabled(dto.getEnabled());
            item.setAccountNonExpired(dto.getAccountNonExpired());
            item.setAccountNonLocked(dto.getAccountNonLocked());
            item.setPasswordChanged(dto.getPasswordChanged());
            if(StringUtil.isNotEmpty(dto.getUsername()))
                item.setUsername(dto.getUsername());
            if(StringUtil.isNotEmpty(dto.getPassword()))
                item.setPassword(dto.getPassword());
            if(dto.getParcours() != null && dto.getParcours().getId() != null){
                item.setParcours(new Parcours());
                item.getParcours().setId(dto.getParcours().getId());
                item.getParcours().setLibelle(dto.getParcours().getLibelle());
            }

            if(dto.getCategorieProf() != null && dto.getCategorieProf().getId() != null){
                item.setCategorieProf(new CategorieProf());
                item.getCategorieProf().setId(dto.getCategorieProf().getId());
                item.getCategorieProf().setCode(dto.getCategorieProf().getCode());
            }

            if(this.typeTeacher && dto.getTypeTeacher()!=null)
                item.setTypeTeacher(typeTeacherConverter.toItem(dto.getTypeTeacher())) ;


            if(this.trancheHoraireProfs && ListUtil.isNotEmpty(dto.getTrancheHoraireProfs()))
                item.setTrancheHoraireProfs(trancheHoraireProfConverter.toItem(dto.getTrancheHoraireProfs()));
//            if(this.classRooms && ListUtil.isNotEmpty(dto.getClassRooms()))
//                item.setClassRooms(classRoomConverter.toItem(dto.getClassRooms()));
            if(this.recommendTeachers && ListUtil.isNotEmpty(dto.getRecommendTeachers()))
                item.setRecommendTeachers(recommendTeacherConverter.toItem(dto.getRecommendTeachers()));

            //item.setRoles(dto.getRoles());

        return item;
        }
    }

    @Override
    public ProfDto toDto(Prof item) {
        if (item == null) {
            return null;
        } else {
            ProfDto dto = new ProfDto();
            if(StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if(StringUtil.isNotEmpty(item.getRef()))
                dto.setRef(item.getRef());
            if(StringUtil.isNotEmpty(item.getAbout()))
                dto.setAbout(item.getAbout());
            if(StringUtil.isNotEmpty(item.getCredentialsNonExpired()))
                dto.setCredentialsNonExpired(item.getCredentialsNonExpired());
            if(StringUtil.isNotEmpty(item.getEnabled()))
                dto.setEnabled(item.getEnabled());
            if(StringUtil.isNotEmpty(item.getAccountNonExpired()))
                dto.setAccountNonExpired(item.getAccountNonExpired());
            if(StringUtil.isNotEmpty(item.getAccountNonLocked()))
                dto.setAccountNonLocked(item.getAccountNonLocked());
            if(StringUtil.isNotEmpty(item.getPasswordChanged()))
                dto.setPasswordChanged(item.getPasswordChanged());
            if(StringUtil.isNotEmpty(item.getUsername()))
                dto.setUsername(item.getUsername());
            if(StringUtil.isNotEmpty(item.getPassword()))
                dto.setPassword(item.getPassword());
            if(this.parcours && item.getParcours()!=null) {
                dto.setParcours(parcoursConverter.toDto(item.getParcours())) ;

            }
            if(this.categorieProf && item.getCategorieProf()!=null) {
                dto.setCategorieProf(categorieProfConverter.toDto(item.getCategorieProf())) ;

            }
            if(this.typeTeacher && item.getTypeTeacher()!=null) {
                dto.setTypeTeacher(typeTeacherConverter.toDto(item.getTypeTeacher())) ;

            }
        if(this.trancheHoraireProfs && ListUtil.isNotEmpty(item.getTrancheHoraireProfs())){
            trancheHoraireProfConverter.init(true);
            trancheHoraireProfConverter.setProf(false);
            dto.setTrancheHoraireProfs(trancheHoraireProfConverter.toDto(item.getTrancheHoraireProfs()));
            trancheHoraireProfConverter.setProf(true);

        }

        if(this.recommendTeachers && ListUtil.isNotEmpty(item.getRecommendTeachers())){
            recommendTeacherConverter.init(true);
            recommendTeacherConverter.setProf(false);
            dto.setRecommendTeachers(recommendTeacherConverter.toDto(item.getRecommendTeachers()));
            recommendTeacherConverter.setProf(true);

        }


        return dto;
        }
    }

    public void copy(ProfDto dto, Prof t) {
    super.copy(dto, t);
    if (dto.getParcours() != null)
        parcoursConverter.copy(dto.getParcours(), t.getParcours());
    if (dto.getTrancheHoraireProfs() != null)
        t.setTrancheHoraireProfs(trancheHoraireProfConverter.copy(dto.getTrancheHoraireProfs()));
    if (dto.getCategorieProf() != null)
        categorieProfConverter.copy(dto.getCategorieProf(), t.getCategorieProf());
    if (dto.getRecommendTeachers() != null)
        t.setRecommendTeachers(recommendTeacherConverter.copy(dto.getRecommendTeachers()));
    if (dto.getTypeTeacher() != null)
        typeTeacherConverter.copy(dto.getTypeTeacher(), t.getTypeTeacher());
    }


    public void initList(boolean value) {
        this.trancheHoraireProfs = value;
        this.classRooms = value;
        this.recommendTeachers = value;
    }

    public void initObject(boolean value) {
        this.parcours = value;
        this.categorieProf = value;
        this.typeTeacher = value;
    }


    public ParcoursConverter getParcoursConverter(){
        return this.parcoursConverter;
    }
    public void setParcoursConverter(ParcoursConverter parcoursConverter ){
        this.parcoursConverter = parcoursConverter;
    }
    public TypeTeacherConverter getTypeTeacherConverter(){
        return this.typeTeacherConverter;
    }
    public void setTypeTeacherConverter(TypeTeacherConverter typeTeacherConverter ){
        this.typeTeacherConverter = typeTeacherConverter;
    }
    public RecommendTeacherConverter getRecommendTeacherConverter(){
        return this.recommendTeacherConverter;
    }
    public void setRecommendTeacherConverter(RecommendTeacherConverter recommendTeacherConverter ){
        this.recommendTeacherConverter = recommendTeacherConverter;
    }
    public CategorieProfConverter getCategorieProfConverter(){
        return this.categorieProfConverter;
    }
    public void setCategorieProfConverter(CategorieProfConverter categorieProfConverter ){
        this.categorieProfConverter = categorieProfConverter;
    }
    public TrancheHoraireProfConverter getTrancheHoraireProfConverter(){
        return this.trancheHoraireProfConverter;
    }
    public void setTrancheHoraireProfConverter(TrancheHoraireProfConverter trancheHoraireProfConverter ){
        this.trancheHoraireProfConverter = trancheHoraireProfConverter;
    }
    public ClassRoomConverter getClassRoomConverter(){
        return this.classRoomConverter;
    }
    public void setClassRoomConverter(ClassRoomConverter classRoomConverter ){
        this.classRoomConverter = classRoomConverter;
    }
    public boolean  isParcours(){
        return this.parcours;
    }
    public void  setParcours(boolean parcours){
        this.parcours = parcours;
    }
    public boolean  isCategorieProf(){
        return this.categorieProf;
    }
    public void  setCategorieProf(boolean categorieProf){
        this.categorieProf = categorieProf;
    }
    public boolean  isTypeTeacher(){
        return this.typeTeacher;
    }
    public void  setTypeTeacher(boolean typeTeacher){
        this.typeTeacher = typeTeacher;
    }
    public boolean  isTrancheHoraireProfs(){
        return this.trancheHoraireProfs ;
    }
    public void  setTrancheHoraireProfs(boolean trancheHoraireProfs ){
        this.trancheHoraireProfs  = trancheHoraireProfs ;
    }
    public boolean  isClassRooms(){
        return this.classRooms ;
    }
    public void  setClassRooms(boolean classRooms ){
        this.classRooms  = classRooms ;
    }
    public boolean  isRecommendTeachers(){
        return this.recommendTeachers ;
    }
    public void  setRecommendTeachers(boolean recommendTeachers ){
        this.recommendTeachers  = recommendTeachers ;
    }
}
