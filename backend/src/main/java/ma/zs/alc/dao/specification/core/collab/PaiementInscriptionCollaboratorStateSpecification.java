package ma.zs.alc.dao.specification.core.collab;

import ma.zs.alc.dao.criteria.core.collab.PaiementInscriptionCollaboratorStateCriteria;
import ma.zs.alc.bean.core.collab.PaiementInscriptionCollaboratorState;
import ma.zs.alc.zynerator.specification.AbstractSpecification;


public class PaiementInscriptionCollaboratorStateSpecification extends  AbstractSpecification<PaiementInscriptionCollaboratorStateCriteria, PaiementInscriptionCollaboratorState>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("code", criteria.getCode(),criteria.getCodeLike());
        addPredicate("libelle", criteria.getLibelle(),criteria.getLibelleLike());
    }

    public PaiementInscriptionCollaboratorStateSpecification(PaiementInscriptionCollaboratorStateCriteria criteria) {
        super(criteria);
    }

    public PaiementInscriptionCollaboratorStateSpecification(PaiementInscriptionCollaboratorStateCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
