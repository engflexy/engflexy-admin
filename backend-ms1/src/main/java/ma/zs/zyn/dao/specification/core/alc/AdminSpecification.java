package  ma.zs.zyn.dao.specification.core.alc;

import ma.zs.zyn.dao.criteria.core.alc.AdminCriteria;
import ma.zs.zyn.bean.core.alc.Admin;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class AdminSpecification extends  AbstractSpecification<AdminCriteria, Admin>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("description", criteria.getDescription(),criteria.getDescriptionLike());
        addPredicateBool("credentialsNonExpired", criteria.getCredentialsNonExpired());
        addPredicateBool("enabled", criteria.getEnabled());
        addPredicateBool("accountNonExpired", criteria.getAccountNonExpired());
        addPredicateBool("accountNonLocked", criteria.getAccountNonLocked());
        addPredicateBool("passwordChanged", criteria.getPasswordChanged());
        addPredicate("username", criteria.getUsername(),criteria.getUsernameLike());
        addPredicate("password", criteria.getPassword(),criteria.getPasswordLike());
    }

    public AdminSpecification(AdminCriteria criteria) {
        super(criteria);
    }

    public AdminSpecification(AdminCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
