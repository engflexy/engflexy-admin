package ma.zs.zyn.service.impl.admin.inscriptionref;


import ma.zs.zyn.bean.core.inscriptionref.InteretEtudiant;
import ma.zs.zyn.dao.criteria.core.inscriptionref.InteretEtudiantCriteria;
import ma.zs.zyn.dao.facade.core.inscriptionref.InteretEtudiantDao;
import ma.zs.zyn.dao.specification.core.inscriptionref.InteretEtudiantSpecification;
import ma.zs.zyn.service.facade.admin.inscriptionref.InteretEtudiantAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class InteretEtudiantAdminServiceImpl extends AbstractServiceImpl<InteretEtudiant, InteretEtudiantCriteria, InteretEtudiantDao> implements InteretEtudiantAdminService {






    public InteretEtudiant findByReferenceEntity(InteretEtudiant t){
        return  dao.findByCode(t.getCode());
    }


    public List<InteretEtudiant> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(InteretEtudiant.class, InteretEtudiantSpecification.class);
    }



    public InteretEtudiantAdminServiceImpl(InteretEtudiantDao dao) {
        super(dao);
    }

}
