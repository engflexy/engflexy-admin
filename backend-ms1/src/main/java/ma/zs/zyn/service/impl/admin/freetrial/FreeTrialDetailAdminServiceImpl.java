package ma.zs.zyn.service.impl.admin.freetrial;


import ma.zs.zyn.bean.core.freetrial.FreeTrialDetail;
import ma.zs.zyn.dao.criteria.core.freetrial.FreeTrialDetailCriteria;
import ma.zs.zyn.dao.facade.core.freetrial.FreeTrialDetailDao;
import ma.zs.zyn.dao.specification.core.freetrial.FreeTrialDetailSpecification;
import ma.zs.zyn.service.facade.admin.freetrial.FreeTrialDetailAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.zyn.service.facade.admin.inscription.EtudiantAdminService ;
import ma.zs.zyn.bean.core.inscription.Etudiant ;
import ma.zs.zyn.service.facade.admin.freetrial.FreeTrialAdminService ;
import ma.zs.zyn.bean.core.freetrial.FreeTrial ;

import java.util.List;
@Service
public class FreeTrialDetailAdminServiceImpl extends AbstractServiceImpl<FreeTrialDetail, FreeTrialDetailCriteria, FreeTrialDetailDao> implements FreeTrialDetailAdminService {






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
    public long countByEtudiantRef(String ref){
        return dao.countByEtudiantRef(ref);
    }






    public void configure() {
        super.configure(FreeTrialDetail.class, FreeTrialDetailSpecification.class);
    }


    @Autowired
    private EtudiantAdminService etudiantService ;
    @Autowired
    private FreeTrialAdminService freeTrialService ;

    public FreeTrialDetailAdminServiceImpl(FreeTrialDetailDao dao) {
        super(dao);
    }

}