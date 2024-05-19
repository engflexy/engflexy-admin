package ma.zs.alc.service.impl.collaborator.freetrial;


import ma.zs.alc.bean.core.freetrial.FreeTrialDetail;
import ma.zs.alc.dao.criteria.core.freetrial.FreeTrialDetailCriteria;
import ma.zs.alc.dao.facade.core.freetrial.FreeTrialDetailDao;
import ma.zs.alc.dao.specification.core.freetrial.FreeTrialDetailSpecification;
import ma.zs.alc.service.facade.collaborator.freetrial.FreeTrialDetailCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.inscription.EtudiantCollaboratorService ;
import ma.zs.alc.bean.core.inscription.Etudiant ;
import ma.zs.alc.service.facade.collaborator.freetrial.FreeTrialCollaboratorService ;
import ma.zs.alc.bean.core.freetrial.FreeTrial ;

import java.util.List;
@Service
public class FreeTrialDetailCollaboratorServiceImpl extends AbstractServiceImpl<FreeTrialDetail, FreeTrialDetailCriteria, FreeTrialDetailDao> implements FreeTrialDetailCollaboratorService {






    public void findOrSaveAssociatedObject(FreeTrialDetail t){
        if( t != null) {
            t.setFreeTrial(freeTrialService.findOrSave(t.getFreeTrial()));
            t.setEtudiant(etudiantService.findOrSave(t.getEtudiant()));
        }
    }

    public List<FreeTrialDetail> findByFreeTrialId(Long id){
        return dao.findByFreeTrialId(id);
    }
    public int deleteByFreeTrialId(Long id){
        return dao.deleteByFreeTrialId(id);
    }
    public long countByFreeTrialReference(String reference){
        return dao.countByFreeTrialReference(reference);
    }
    public List<FreeTrialDetail> findByEtudiantId(Long id){
        return dao.findByEtudiantId(id);
    }
    public int deleteByEtudiantId(Long id){
        return dao.deleteByEtudiantId(id);
    }
    public long countByEtudiantId(Long id){
        return dao.countByEtudiantId(id);
    }






    public void configure() {
        super.configure(FreeTrialDetail.class, FreeTrialDetailSpecification.class);
    }


    @Autowired
    private EtudiantCollaboratorService etudiantService ;
    @Autowired
    private FreeTrialCollaboratorService freeTrialService ;

    public FreeTrialDetailCollaboratorServiceImpl(FreeTrialDetailDao dao) {
        super(dao);
    }

}
