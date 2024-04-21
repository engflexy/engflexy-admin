package  ma.zs.zyn.dao.specification.core.inscriptionref;

import ma.zs.zyn.dao.criteria.core.inscriptionref.EtudiantClassRoomCriteria;
import ma.zs.zyn.bean.core.inscriptionref.EtudiantClassRoom;
import ma.zs.zyn.zynerator.specification.AbstractSpecification;


public class EtudiantClassRoomSpecification extends  AbstractSpecification<EtudiantClassRoomCriteria, EtudiantClassRoom>  {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicateFk("classRoom","id", criteria.getClassRoom()==null?null:criteria.getClassRoom().getId());
        addPredicateFk("classRoom","id", criteria.getClassRooms());
        addPredicateFk("classRoom","libelle", criteria.getClassRoom()==null?null:criteria.getClassRoom().getLibelle());
        addPredicateFk("etudiant","id", criteria.getEtudiant()==null?null:criteria.getEtudiant().getId());
        addPredicateFk("etudiant","id", criteria.getEtudiants());
        addPredicateFk("etudiant","ref", criteria.getEtudiant()==null?null:criteria.getEtudiant().getRef());
    }

    public EtudiantClassRoomSpecification(EtudiantClassRoomCriteria criteria) {
        super(criteria);
    }

    public EtudiantClassRoomSpecification(EtudiantClassRoomCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
