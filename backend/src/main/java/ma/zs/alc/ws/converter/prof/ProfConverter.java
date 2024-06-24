package ma.zs.alc.ws.converter.prof;

import ma.zs.alc.bean.core.course.Parcours;
import ma.zs.alc.bean.core.prof.CategorieProf;
import ma.zs.alc.bean.core.prof.Prof;
import ma.zs.alc.bean.core.common.Collaborator;
import ma.zs.alc.ws.converter.course.ParcoursConverter;
import ma.zs.alc.ws.converter.inscriptionref.LangueConverter;
import ma.zs.alc.ws.converter.recomrecla.RecommendTeacherConverter;
import ma.zs.alc.ws.converter.vocab.CollaboratorConverter;
import ma.zs.alc.ws.dto.prof.ProfDto;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.util.ListUtil;
import ma.zs.alc.zynerator.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ProfConverter extends AbstractConverter<Prof, ProfDto> {

    @Autowired
    private CollaboratorConverter collaboratorConverter;
    @Autowired
    private ParcoursConverter parcoursConverter;
    @Autowired
    private LangueConverter langueConverter;
    @Autowired
    private TypeTeacherConverter typeTeacherConverter;
    @Autowired
    private RecommendTeacherConverter recommendTeacherConverter;
    @Autowired
    private CategorieProfConverter categorieProfConverter;
    @Autowired
    private TrancheHoraireProfConverter trancheHoraireProfConverter;
    private boolean parcours;
    private boolean categorieProf;
    private boolean typeTeacher;
    private boolean collaborator;
    private boolean trancheHoraireProfs;
    private boolean recommendTeachers;

    public ProfConverter() {
        super(Prof.class, ProfDto.class);
        init(true);
    }

    @Override
    public Prof toItem(ProfDto dto) {
        if (dto == null) {
            return null;
        } else {
            Prof item = new Prof();
            if (StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if (StringUtil.isNotEmpty(dto.getRef()))
                item.setRef(dto.getRef());
            if (StringUtil.isNotEmpty(dto.getAbout()))
                item.setAbout(dto.getAbout());

            if (StringUtil.isNotEmpty(dto.getFullName())) item.setFullName(dto.getFullName());
            if (StringUtil.isNotEmpty(dto.getEmail())) item.setEmail(dto.getEmail());
            if (StringUtil.isNotEmpty(dto.getUsername())) item.setUsername(dto.getUsername());
            if (StringUtil.isNotEmpty(dto.getPasswordChanged())) item.setPasswordChanged(dto.getPasswordChanged());
            if (StringUtil.isNotEmpty(dto.getPhone())) item.setPhone(dto.getPhone());
            if (StringUtil.isNotEmpty(dto.getCountry())) item.setCountry(dto.getCountry());
            if (StringUtil.isNotEmpty(dto.getAbout())) item.setAbout(dto.getAbout());
            if (StringUtil.isNotEmpty(dto.getAvatar())) item.setAvatar(dto.getAvatar());
            item.setCredentialsNonExpired(dto.getCredentialsNonExpired());
            item.setEnabled(dto.getEnabled());
            item.setAccountNonExpired(dto.getAccountNonExpired());
            item.setAccountNonLocked(dto.getAccountNonLocked());
            item.setPasswordChanged(dto.getPasswordChanged());
            if (StringUtil.isNotEmpty(dto.getUsername())) item.setUsername(dto.getUsername());
            if (StringUtil.isNotEmpty(dto.getPassword())) item.setPassword(dto.getPassword());
            if (dto.getParcours() != null && dto.getParcours().getId() != null) {
                item.setParcours(new Parcours());
                item.getParcours().setId(dto.getParcours().getId());
                item.getParcours().setLibelle(dto.getParcours().getLibelle());
            }

            if (dto.getCategorieProf() != null && dto.getCategorieProf().getId() != null) {
                item.setCategorieProf(new CategorieProf());
                item.getCategorieProf().setId(dto.getCategorieProf().getId());
                item.getCategorieProf().setCode(dto.getCategorieProf().getCode());
            }

            if (this.typeTeacher && dto.getTypeTeacher() != null)
                item.setTypeTeacher(typeTeacherConverter.toItem(dto.getTypeTeacher()));

            if (dto.getCollaborator() != null && dto.getCollaborator().getId() != null) {
                item.setCollaborator(new Collaborator());
                item.getCollaborator().setId(dto.getCollaborator().getId());
                item.getCollaborator().setId(dto.getCollaborator().getId());
            }
            if (dto.getLangue() != null) item.setLangue(langueConverter.toItem(dto.getLangue()));


            if (this.trancheHoraireProfs && ListUtil.isNotEmpty(dto.getTrancheHoraireProfs()))
                item.setTrancheHoraireProfs(trancheHoraireProfConverter.toItem(dto.getTrancheHoraireProfs()));
            if (this.recommendTeachers && ListUtil.isNotEmpty(dto.getRecommendTeachers()))
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
            if (StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if (StringUtil.isNotEmpty(item.getRef()))
                dto.setRef(item.getRef());
            if (StringUtil.isNotEmpty(item.getFullName())) dto.setFullName(item.getFullName());
            if (StringUtil.isNotEmpty(item.getEmail())) dto.setEmail(item.getEmail());
            if (StringUtil.isNotEmpty(item.getUsername())) dto.setUsername(item.getUsername());
            if (StringUtil.isNotEmpty(item.getPasswordChanged())) dto.setPasswordChanged(item.getPasswordChanged());
            if (StringUtil.isNotEmpty(item.getPhone())) dto.setPhone(item.getPhone());
            if (StringUtil.isNotEmpty(item.getCountry())) dto.setCountry(item.getCountry());
            if (StringUtil.isNotEmpty(item.getAbout())) dto.setAbout(item.getAbout());
            if (StringUtil.isNotEmpty(item.getAvatar())) dto.setAvatar(item.getAvatar());
            if (StringUtil.isNotEmpty(item.getCredentialsNonExpired()))
                dto.setCredentialsNonExpired(item.getCredentialsNonExpired());
            if (StringUtil.isNotEmpty(item.getEnabled())) dto.setEnabled(item.getEnabled());
            if (StringUtil.isNotEmpty(item.getAccountNonExpired()))
                dto.setAccountNonExpired(item.getAccountNonExpired());
            if (StringUtil.isNotEmpty(item.getAccountNonLocked())) dto.setAccountNonLocked(item.getAccountNonLocked());
            if (StringUtil.isNotEmpty(item.getUsername())) dto.setUsername(item.getUsername());


            if (this.parcours && item.getParcours() != null) {
                dto.setParcours(parcoursConverter.toDto(item.getParcours()));

            }
            if (item.getLangue() != null) {
                dto.setLangue(langueConverter.toDto(item.getLangue()));
            }
            if (this.categorieProf && item.getCategorieProf() != null) {
                dto.setCategorieProf(categorieProfConverter.toDto(item.getCategorieProf()));

            }
            if (this.typeTeacher && item.getTypeTeacher() != null) {
                dto.setTypeTeacher(typeTeacherConverter.toDto(item.getTypeTeacher()));

            }
            if (this.collaborator && item.getCollaborator() != null) {
                dto.setCollaborator(collaboratorConverter.toDto(item.getCollaborator()));

            }
            if (this.trancheHoraireProfs && ListUtil.isNotEmpty(item.getTrancheHoraireProfs())) {
                trancheHoraireProfConverter.init(true);
                trancheHoraireProfConverter.setProf(false);
                dto.setTrancheHoraireProfs(trancheHoraireProfConverter.toDto(item.getTrancheHoraireProfs()));
                trancheHoraireProfConverter.setProf(true);

            }
            if (this.recommendTeachers && ListUtil.isNotEmpty(item.getRecommendTeachers())) {
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
        if (dto.getCollaborator() != null)
            collaboratorConverter.copy(dto.getCollaborator(), t.getCollaborator());
    }


    public void initList(boolean value) {
        this.trancheHoraireProfs = value;
        this.recommendTeachers = value;
    }

    public void initObject(boolean value) {
        this.parcours = value;
        this.categorieProf = value;
        this.typeTeacher = value;
        this.collaborator = value;
    }


    public CollaboratorConverter getCollaboratorConverter() {
        return this.collaboratorConverter;
    }

    public void setCollaboratorConverter(CollaboratorConverter collaboratorConverter) {
        this.collaboratorConverter = collaboratorConverter;
    }

    public ParcoursConverter getParcoursConverter() {
        return this.parcoursConverter;
    }

    public void setParcoursConverter(ParcoursConverter parcoursConverter) {
        this.parcoursConverter = parcoursConverter;
    }

    public TypeTeacherConverter getTypeTeacherConverter() {
        return this.typeTeacherConverter;
    }

    public void setTypeTeacherConverter(TypeTeacherConverter typeTeacherConverter) {
        this.typeTeacherConverter = typeTeacherConverter;
    }

    public RecommendTeacherConverter getRecommendTeacherConverter() {
        return this.recommendTeacherConverter;
    }

    public void setRecommendTeacherConverter(RecommendTeacherConverter recommendTeacherConverter) {
        this.recommendTeacherConverter = recommendTeacherConverter;
    }

    public CategorieProfConverter getCategorieProfConverter() {
        return this.categorieProfConverter;
    }

    public void setCategorieProfConverter(CategorieProfConverter categorieProfConverter) {
        this.categorieProfConverter = categorieProfConverter;
    }

    public TrancheHoraireProfConverter getTrancheHoraireProfConverter() {
        return this.trancheHoraireProfConverter;
    }

    public void setTrancheHoraireProfConverter(TrancheHoraireProfConverter trancheHoraireProfConverter) {
        this.trancheHoraireProfConverter = trancheHoraireProfConverter;
    }

    public boolean isParcours() {
        return this.parcours;
    }

    public void setParcours(boolean parcours) {
        this.parcours = parcours;
    }

    public boolean isCategorieProf() {
        return this.categorieProf;
    }

    public void setCategorieProf(boolean categorieProf) {
        this.categorieProf = categorieProf;
    }

    public boolean isTypeTeacher() {
        return this.typeTeacher;
    }

    public void setTypeTeacher(boolean typeTeacher) {
        this.typeTeacher = typeTeacher;
    }

    public boolean isCollaborator() {
        return this.collaborator;
    }

    public void setCollaborator(boolean collaborator) {
        this.collaborator = collaborator;
    }

    public boolean isTrancheHoraireProfs() {
        return this.trancheHoraireProfs;
    }

    public void setTrancheHoraireProfs(boolean trancheHoraireProfs) {
        this.trancheHoraireProfs = trancheHoraireProfs;
    }

    public boolean isRecommendTeachers() {
        return this.recommendTeachers;
    }

    public void setRecommendTeachers(boolean recommendTeachers) {
        this.recommendTeachers = recommendTeachers;
    }
}
