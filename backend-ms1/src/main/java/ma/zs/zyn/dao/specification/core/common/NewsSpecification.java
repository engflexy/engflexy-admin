package  ma.zs.zyn.dao.specification.core.common;

import ma.zs.zyn.dao.criteria.core.common.NewsCriteria;
import ma.zs.zyn.bean.core.common.News;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class NewsSpecification extends  AbstractSpecification<NewsCriteria, News>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("ref", criteria.getRef(),criteria.getRefLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
        addPredicate("image", criteria.getImage(),criteria.getImageLike());
        addPredicate("dateNews", criteria.getDateNews(), criteria.getDateNewsFrom(), criteria.getDateNewsTo());
        addPredicate("dateDebut", criteria.getDateDebut(), criteria.getDateDebutFrom(), criteria.getDateDebutTo());
        addPredicate("dateFin", criteria.getDateFin(), criteria.getDateFinFrom(), criteria.getDateFinTo());
        addPredicateInt("numeroOrdre", criteria.getNumeroOrdre(), criteria.getNumeroOrdreMin(), criteria.getNumeroOrdreMax());
        addPredicate("destinataire", criteria.getDestinataire(),criteria.getDestinataireLike());
    }

    public NewsSpecification(NewsCriteria criteria) {
        super(criteria);
    }

    public NewsSpecification(NewsCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
