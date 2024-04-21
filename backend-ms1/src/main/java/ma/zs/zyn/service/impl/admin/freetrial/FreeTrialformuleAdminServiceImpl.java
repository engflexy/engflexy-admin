package ma.zs.zyn.service.impl.admin.freetrial;


import ma.zs.zyn.bean.core.freetrial.FreeTrialformule;
import ma.zs.zyn.dao.criteria.core.freetrial.FreeTrialformuleCriteria;
import ma.zs.zyn.dao.facade.core.freetrial.FreeTrialformuleDao;
import ma.zs.zyn.dao.specification.core.freetrial.FreeTrialformuleSpecification;
import ma.zs.zyn.service.facade.admin.freetrial.FreeTrialformuleAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.zyn.service.facade.admin.grpe.InscriptionAdminService ;
import ma.zs.zyn.bean.core.grpe.Inscription ;

import java.util.List;
@Service
public class FreeTrialformuleAdminServiceImpl extends AbstractServiceImpl<FreeTrialformule, FreeTrialformuleCriteria, FreeTrialformuleDao> implements FreeTrialformuleAdminService {






    public FreeTrialformule findByReferenceEntity(FreeTrialformule t){
        return  dao.findByCode(t.getCode());
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
    private InscriptionAdminService inscriptionService ;

    public FreeTrialformuleAdminServiceImpl(FreeTrialformuleDao dao) {
        super(dao);
    }

}
