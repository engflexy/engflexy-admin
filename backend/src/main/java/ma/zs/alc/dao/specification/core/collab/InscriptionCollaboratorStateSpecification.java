package ma.zs.alc.dao.specification.core.collab;

import ma.zs.alc.dao.criteria.core.collab.InscriptionCollaboratorStateCriteria;
import ma.zs.alc.bean.core.collab.InscriptionCollaboratorState;
import ma.zs.alc.zynerator.specification.AbstractSpecification;


public class InscriptionCollaboratorStateSpecification extends  AbstractSpecification<InscriptionCollaboratorStateCriteria, InscriptionCollaboratorState>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
    }

    public InscriptionCollaboratorStateSpecification(InscriptionCollaboratorStateCriteria criteria) {
        super(criteria);
    }

    public InscriptionCollaboratorStateSpecification(InscriptionCollaboratorStateCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
