package ma.zs.alc.dao.specification.core.collab;

import ma.zs.alc.bean.core.collab.InscriptionCollaborator;
import ma.zs.alc.dao.criteria.core.collab.InscriptionCollaboratorCriteria;
import ma.zs.alc.zynerator.specification.AbstractSpecification;


public class InscriptionCollaboratorSpecification extends AbstractSpecification<InscriptionCollaboratorCriteria, InscriptionCollaborator> {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicateBigDecimal("price", criteria.getPrice(), criteria.getPriceMin(), criteria.getPriceMax());
        addPredicateBigDecimal("nbrStudent", criteria.getNbrStudent(), criteria.getNbrStudentMin(), criteria.getNbrStudentMax());
        addPredicateBool("logo", criteria.getLogo());
        addPredicateBool("color", criteria.getColor());
        addPredicateBool("bannerAd", criteria.getBannerAd());
        addPredicate("startDate", criteria.getStartDate(), criteria.getStartDateFrom(), criteria.getStartDateTo());
        addPredicate("endDate", criteria.getEndDate(), criteria.getEndDateFrom(), criteria.getEndDateTo());
        addPredicateFk("packageCollaborator", "id", criteria.getPackageCollaborator() == null ? null : criteria.getPackageCollaborator().getId());
        addPredicateFk("packageCollaborator", "id", criteria.getPackageCollaborators());
        addPredicateFk("collaborator", "id", criteria.getCollaborator() == null ? null : criteria.getCollaborator().getId());
        // addPredicateFk("collaborator.typeCollaborator", "id", (criteria.getCollaborator()==null || criteria.getCollaborator().getTypeCollaborator() == null) ? null : criteria.getCollaborator().getTypeCollaborator().getId());
        if (false && criteria.getCollaborator() != null && criteria.getCollaborator().getTypeCollaborator() != null) {
            Long id = criteria.getCollaborator().getTypeCollaborator().getId();
            addPredicateLong("collaborator.typeCollaborator.id", id);
        }

        addPredicateFk("inscriptionCollaboratorState", "id", criteria.getInscriptionCollaboratorState() == null ? null : criteria.getInscriptionCollaboratorState().getId());
        addPredicateFk("inscriptionCollaboratorState", "id", criteria.getInscriptionCollaboratorStates());
        addPredicateFk("inscriptionCollaboratorState", "code", criteria.getInscriptionCollaboratorState() == null ? null : criteria.getInscriptionCollaboratorState().getCode());
    }

    public InscriptionCollaboratorSpecification(InscriptionCollaboratorCriteria criteria) {
        super(criteria);
    }

    public InscriptionCollaboratorSpecification(InscriptionCollaboratorCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
