package ma.zs.zyn.service.impl.admin.inscriptionref;


import ma.zs.zyn.bean.core.inscriptionref.NiveauEtude;
import ma.zs.zyn.dao.criteria.core.inscriptionref.NiveauEtudeCriteria;
import ma.zs.zyn.dao.facade.core.inscriptionref.NiveauEtudeDao;
import ma.zs.zyn.dao.specification.core.inscriptionref.NiveauEtudeSpecification;
import ma.zs.zyn.service.facade.admin.inscriptionref.NiveauEtudeAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class NiveauEtudeAdminServiceImpl extends AbstractServiceImpl<NiveauEtude, NiveauEtudeCriteria, NiveauEtudeDao> implements NiveauEtudeAdminService {






    public NiveauEtude findByReferenceEntity(NiveauEtude t){
        return  dao.findByCode(t.getCode());
    }


    public List<NiveauEtude> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(NiveauEtude.class, NiveauEtudeSpecification.class);
    }



    public NiveauEtudeAdminServiceImpl(NiveauEtudeDao dao) {
        super(dao);
    }

}
