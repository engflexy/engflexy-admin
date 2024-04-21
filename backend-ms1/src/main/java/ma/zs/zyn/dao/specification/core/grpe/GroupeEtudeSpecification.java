package  ma.zs.zyn.dao.specification.core.grpe;

import ma.zs.zyn.dao.criteria.core.grpe.GroupeEtudeCriteria;
import ma.zs.zyn.bean.core.grpe.GroupeEtude;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class GroupeEtudeSpecification extends  AbstractSpecification<GroupeEtudeCriteria, GroupeEtude>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
        addPredicateLong("nombreEtudiant", criteria.getNombreEtudiant(), criteria.getNombreEtudiantMin(), criteria.getNombreEtudiantMax());
    }

    public GroupeEtudeSpecification(GroupeEtudeCriteria criteria) {
        super(criteria);
    }

    public GroupeEtudeSpecification(GroupeEtudeCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
