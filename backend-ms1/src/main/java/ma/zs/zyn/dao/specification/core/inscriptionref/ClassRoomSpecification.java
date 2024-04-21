package  ma.zs.zyn.dao.specification.core.inscriptionref;

import ma.zs.zyn.dao.criteria.core.inscriptionref.ClassRoomCriteria;
import ma.zs.zyn.bean.core.inscriptionref.ClassRoom;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class ClassRoomSpecification extends  AbstractSpecification<ClassRoomCriteria, ClassRoom>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
    }

    public ClassRoomSpecification(ClassRoomCriteria criteria) {
        super(criteria);
    }

    public ClassRoomSpecification(ClassRoomCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
