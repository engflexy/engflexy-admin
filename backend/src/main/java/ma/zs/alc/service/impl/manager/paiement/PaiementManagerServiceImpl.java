package ma.zs.alc.service.impl.manager.paiement;


import ma.zs.alc.bean.core.paiement.Paiement;
import ma.zs.alc.dao.criteria.core.paiement.PaiementCriteria;
import ma.zs.alc.dao.facade.core.paiement.PaiementDao;
import ma.zs.alc.dao.specification.core.paiement.PaiementSpecification;
import ma.zs.alc.service.facade.manager.paiement.PaiementManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.manager.grpe.GroupeEtudiantManagerService ;
import ma.zs.alc.service.facade.manager.prof.ProfManagerService ;

@Service
public class PaiementManagerServiceImpl extends AbstractServiceImpl<Paiement, PaiementCriteria, PaiementDao> implements PaiementManagerService {







    public void findOrSaveAssociatedObject(Paiement t){
        if( t != null) {
            t.setProf(profService.findOrSave(t.getProf()));
            t.setGroupeEtudiant(groupeEtudiantService.findOrSave(t.getGroupeEtudiant()));
        }
    }

    public List<Paiement> findByProfId(Long id){
        return dao.findByProfId(id);
    }
    public int deleteByProfId(Long id){
        return dao.deleteByProfId(id);
    }
    public long countByProfRef(String ref){
        return dao.countByProfRef(ref);
    }
    public List<Paiement> findByGroupeEtudiantId(Long id){
        return dao.findByGroupeEtudiantId(id);
    }
    public int deleteByGroupeEtudiantId(Long id){
        return dao.deleteByGroupeEtudiantId(id);
    }
    public long countByGroupeEtudiantId(Long id){
        return dao.countByGroupeEtudiantId(id);
    }






    public void configure() {
        super.configure(Paiement.class, PaiementSpecification.class);
    }


    @Autowired
    private GroupeEtudiantManagerService groupeEtudiantService ;
    @Autowired
    private ProfManagerService profService ;

    public PaiementManagerServiceImpl(PaiementDao dao) {
        super(dao);
    }

}
