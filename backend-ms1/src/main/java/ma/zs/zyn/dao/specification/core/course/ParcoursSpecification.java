package  ma.zs.zyn.dao.specification.core.course;

import ma.zs.zyn.dao.criteria.core.course.ParcoursCriteria;
import ma.zs.zyn.bean.core.course.Parcours;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class ParcoursSpecification extends  AbstractSpecification<ParcoursCriteria, Parcours>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("datePublication", criteria.getDatePublication(), criteria.getDatePublicationFrom(), criteria.getDatePublicationTo());
        addPredicate("dateCreation", criteria.getDateCreation(), criteria.getDateCreationFrom(), criteria.getDateCreationTo());
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
        addPredicateInt("numeroOrder", criteria.getNumeroOrder(), criteria.getNumeroOrderMin(), criteria.getNumeroOrderMax());
        addPredicateInt("nombreCours", criteria.getNombreCours(), criteria.getNombreCoursMin(), criteria.getNombreCoursMax());
        addPredicateFk("centre","id", criteria.getCentre()==null?null:criteria.getCentre().getId());
        addPredicateFk("centre","id", criteria.getCentres());
        addPredicateFk("centre","ref", criteria.getCentre()==null?null:criteria.getCentre().getRef());
    }

    public ParcoursSpecification(ParcoursCriteria criteria) {
        super(criteria);
    }

    public ParcoursSpecification(ParcoursCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
