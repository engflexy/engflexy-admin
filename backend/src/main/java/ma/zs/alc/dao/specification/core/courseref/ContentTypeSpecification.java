package  ma.zs.alc.dao.specification.core.courseref;

import ma.zs.alc.dao.criteria.core.courseref.ContentTypeCriteria;
import ma.zs.alc.bean.core.courseref.ContentType;
import ma.zs.alc.zynerator.specification.AbstractSpecification;


public class ContentTypeSpecification extends  AbstractSpecification<ContentTypeCriteria, ContentType>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
    }

    public ContentTypeSpecification(ContentTypeCriteria criteria) {
        super(criteria);
    }

    public ContentTypeSpecification(ContentTypeCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
