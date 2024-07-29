package ma.zs.alc.dao.specification.core.collab;

import ma.zs.alc.bean.core.collab.Manager;
import ma.zs.alc.dao.criteria.core.collab.ManagerCriteria;
import ma.zs.alc.zynerator.specification.AbstractSpecification;


public class ManagerSpecification extends  AbstractSpecification<ManagerCriteria, Manager>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicateBool("credentialsNonExpired", criteria.getCredentialsNonExpired());
        addPredicateBool("enabled", criteria.getEnabled());
        addPredicateBool("accountNonExpired", criteria.getAccountNonExpired());
        addPredicateBool("accountNonLocked", criteria.getAccountNonLocked());
        addPredicateBool("passwordChanged", criteria.getPasswordChanged());
        addPredicate("username", criteria.getUsername(),criteria.getUsernameLike());
        addPredicate("password", criteria.getPassword(),criteria.getPasswordLike());
        addPredicate("avatar", criteria.getAvatar(),criteria.getAvatarLike());
        addPredicate("fullName", criteria.getFullName(),criteria.getFullNameLike());
        addPredicate("about", criteria.getAbout(),criteria.getAboutLike());
        addPredicateFk("collaborator","id", criteria.getCollaborator()==null?null:criteria.getCollaborator().getId());
        addPredicateFk("collaborator","id", criteria.getCollaborators());
    }

    public ManagerSpecification(ManagerCriteria criteria) {
        super(criteria);
    }

    public ManagerSpecification(ManagerCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
