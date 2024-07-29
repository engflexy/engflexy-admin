package ma.zs.alc.dao.specification.core.collab;

import ma.zs.alc.dao.criteria.core.collab.PaiementInscriptionCollaboratorCriteria;
import ma.zs.alc.bean.core.collab.PaiementInscriptionCollaborator;
import ma.zs.alc.zynerator.specification.AbstractSpecification;


public class PaiementInscriptionCollaboratorSpecification extends  AbstractSpecification<PaiementInscriptionCollaboratorCriteria, PaiementInscriptionCollaborator>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicateBigDecimal("total", criteria.getTotal(), criteria.getTotalMin(), criteria.getTotalMax());
        addPredicateBigDecimal("discount", criteria.getDiscount(), criteria.getDiscountMin(), criteria.getDiscountMax());
        addPredicateBigDecimal("remaining", criteria.getRemaining(), criteria.getRemainingMin(), criteria.getRemainingMax());
        addPredicate("paiementDate", criteria.getPaiementDate(), criteria.getPaiementDateFrom(), criteria.getPaiementDateTo());
        addPredicateFk("inscriptionCollaborator","id", criteria.getInscriptionCollaborator()==null?null:criteria.getInscriptionCollaborator().getId());
        addPredicateFk("inscriptionCollaborator","id", criteria.getInscriptionCollaborators());
        addPredicateFk("paiementInscriptionCollaboratorState","id", criteria.getPaiementInscriptionCollaboratorState()==null?null:criteria.getPaiementInscriptionCollaboratorState().getId());
        addPredicateFk("paiementInscriptionCollaboratorState","id", criteria.getPaiementInscriptionCollaboratorStates());
        addPredicateFk("paiementInscriptionCollaboratorState","code", criteria.getPaiementInscriptionCollaboratorState()==null?null:criteria.getPaiementInscriptionCollaboratorState().getCode());
    }

    public PaiementInscriptionCollaboratorSpecification(PaiementInscriptionCollaboratorCriteria criteria) {
        super(criteria);
    }

    public PaiementInscriptionCollaboratorSpecification(PaiementInscriptionCollaboratorCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
