package ma.zs.alc.dao.specification.core.collab;

import ma.zs.alc.dao.criteria.core.collab.CollaboratorCriteria;
import ma.zs.alc.bean.core.collab.Collaborator;
import ma.zs.alc.zynerator.specification.AbstractSpecification;


public class CollaboratorSpecification extends  AbstractSpecification<CollaboratorCriteria, Collaborator>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
        addPredicate("description", criteria.getDescription(),criteria.getDescriptionLike());
        addPredicateBool("credentialsNonExpired", criteria.getCredentialsNonExpired());
        addPredicateBool("enabled", criteria.getEnabled());
        addPredicateBool("accountNonExpired", criteria.getAccountNonExpired());
        addPredicateBool("accountNonLocked", criteria.getAccountNonLocked());
        addPredicateBool("passwordChanged", criteria.getPasswordChanged());
        addPredicate("username", criteria.getUsername(),criteria.getUsernameLike());
        addPredicate("password", criteria.getPassword(),criteria.getPasswordLike());
        addPredicateFk("typeCollaborator","id", criteria.getTypeCollaborator()==null?null:criteria.getTypeCollaborator().getId());
        addPredicateFk("typeCollaborator","id", criteria.getTypeCollaborators());
        addPredicateFk("typeCollaborator","code", criteria.getTypeCollaborator()==null?null:criteria.getTypeCollaborator().getCode());
    }

    public CollaboratorSpecification(CollaboratorCriteria criteria) {
        super(criteria);
    }

    public CollaboratorSpecification(CollaboratorCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
