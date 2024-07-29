package ma.zs.alc.dao.specification.core.prof;

import ma.zs.alc.bean.core.prof.Prof;
import ma.zs.alc.dao.criteria.core.prof.ProfCriteria;
import ma.zs.alc.zynerator.security.dao.specification.core.UserSpecification;
import ma.zs.alc.zynerator.specification.AbstractSpecification;
import org.springframework.beans.factory.annotation.Autowired;


public class ProfSpecification extends AbstractSpecification<ProfCriteria, Prof> {



    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("email", criteria.getEmail(), criteria.getEmailLike());
        addPredicate("username", criteria.getUsername(), criteria.getUsernameLike());
        addPredicate("fullName", criteria.getFullName(), criteria.getFullName());
        addPredicate("phone", criteria.getPhone(), criteria.getPhoneLike());
        addPredicate("ref", criteria.getRef(), criteria.getRefLike());
        addPredicate("about", criteria.getAbout(), criteria.getAboutLike());
        addPredicateBool("credentialsNonExpired", criteria.getCredentialsNonExpired());
        addPredicateBool("enabled", criteria.getEnabled());
        addPredicateBool("accountNonExpired", criteria.getAccountNonExpired());
        addPredicateBool("accountNonLocked", criteria.getAccountNonLocked());
        addPredicateBool("passwordChanged", criteria.getPasswordChanged());
        addPredicate("username", criteria.getUsername(), criteria.getUsernameLike());
        addPredicate("password", criteria.getPassword(), criteria.getPasswordLike());
        addPredicateFk("parcours", "id", criteria.getParcours() == null ? null : criteria.getParcours().getId());
        addPredicateFk("parcours", "id", criteria.getParcourss());
        addPredicateFk("parcours", "code", criteria.getParcours() == null ? null : criteria.getParcours().getCode());
        addPredicateFk("categorieProf", "id", criteria.getCategorieProf() == null ? null : criteria.getCategorieProf().getId());
        addPredicateFk("categorieProf", "id", criteria.getCategorieProfs());
        addPredicateFk("categorieProf", "code", criteria.getCategorieProf() == null ? null : criteria.getCategorieProf().getCode());
        addPredicateFk("typeTeacher", "id", criteria.getTypeTeacher() == null ? null : criteria.getTypeTeacher().getId());
        addPredicateFk("typeTeacher", "id", criteria.getTypeTeachers());
        addPredicateFk("typeTeacher", "code", criteria.getTypeTeacher() == null ? null : criteria.getTypeTeacher().getCode());
        addPredicateFk("collaborator", "id", criteria.getCollaborator() == null ? null : criteria.getCollaborator().getId());
        addPredicateFk("collaborator", "id", criteria.getCollaborators());
    }

    public ProfSpecification(ProfCriteria criteria) {
        super(criteria);
    }

    public ProfSpecification(ProfCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
