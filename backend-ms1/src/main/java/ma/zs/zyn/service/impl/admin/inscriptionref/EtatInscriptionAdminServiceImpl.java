package ma.zs.zyn.service.impl.admin.inscriptionref;


import ma.zs.zyn.bean.core.inscriptionref.EtatInscription;
import ma.zs.zyn.dao.criteria.core.inscriptionref.EtatInscriptionCriteria;
import ma.zs.zyn.dao.facade.core.inscriptionref.EtatInscriptionDao;
import ma.zs.zyn.dao.specification.core.inscriptionref.EtatInscriptionSpecification;
import ma.zs.zyn.service.facade.admin.inscriptionref.EtatInscriptionAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class EtatInscriptionAdminServiceImpl extends AbstractServiceImpl<EtatInscription, EtatInscriptionCriteria, EtatInscriptionDao> implements EtatInscriptionAdminService {






    public EtatInscription findByReferenceEntity(EtatInscription t){
        return  dao.findByLibelle(t.getLibelle());
    }


    public List<EtatInscription> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(EtatInscription.class, EtatInscriptionSpecification.class);
    }



    public EtatInscriptionAdminServiceImpl(EtatInscriptionDao dao) {
        super(dao);
    }

}
