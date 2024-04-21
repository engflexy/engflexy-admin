package ma.zs.zyn.service.impl.admin.inscriptionref;


import ma.zs.zyn.bean.core.inscriptionref.Langue;
import ma.zs.zyn.dao.criteria.core.inscriptionref.LangueCriteria;
import ma.zs.zyn.dao.facade.core.inscriptionref.LangueDao;
import ma.zs.zyn.dao.specification.core.inscriptionref.LangueSpecification;
import ma.zs.zyn.service.facade.admin.inscriptionref.LangueAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class LangueAdminServiceImpl extends AbstractServiceImpl<Langue, LangueCriteria, LangueDao> implements LangueAdminService {






    public Langue findByReferenceEntity(Langue t){
        return  dao.findByLibelle(t.getLibelle());
    }


    public List<Langue> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Langue.class, LangueSpecification.class);
    }



    public LangueAdminServiceImpl(LangueDao dao) {
        super(dao);
    }

}
