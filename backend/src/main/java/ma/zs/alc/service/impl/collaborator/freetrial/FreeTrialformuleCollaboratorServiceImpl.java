package ma.zs.alc.service.impl.collaborator.freetrial;


import ma.zs.alc.bean.core.freetrial.FreeTrialformule;
import ma.zs.alc.dao.criteria.core.freetrial.FreeTrialformuleCriteria;
import ma.zs.alc.dao.facade.core.freetrial.FreeTrialformuleDao;
import ma.zs.alc.dao.specification.core.freetrial.FreeTrialformuleSpecification;
import ma.zs.alc.service.facade.collaborator.freetrial.FreeTrialformuleCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.grpe.InscriptionCollaboratorService ;
import ma.zs.alc.bean.core.grpe.Inscription ;

import java.util.List;
@Service
public class FreeTrialformuleCollaboratorServiceImpl extends AbstractServiceImpl<FreeTrialformule, FreeTrialformuleCriteria, FreeTrialformuleDao> implements FreeTrialformuleCollaboratorService {






    public FreeTrialformule findByReferenceEntity(FreeTrialformule t){
        return t==null? null : dao.findByCode(t.getCode());
    }
    public void findOrSaveAssociatedObject(FreeTrialformule t){
        if( t != null) {
            t.setInscription(inscriptionService.findOrSave(t.getInscription()));
        }
    }

    public List<FreeTrialformule> findByInscriptionId(Long id){
        return dao.findByInscriptionId(id);
    }
    public int deleteByInscriptionId(Long id){
        return dao.deleteByInscriptionId(id);
    }
    public long countByInscriptionId(Long id){
        return dao.countByInscriptionId(id);
    }

    public List<FreeTrialformule> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(FreeTrialformule.class, FreeTrialformuleSpecification.class);
    }


    @Autowired
    private InscriptionCollaboratorService inscriptionService ;

    public FreeTrialformuleCollaboratorServiceImpl(FreeTrialformuleDao dao) {
        super(dao);
    }

}
