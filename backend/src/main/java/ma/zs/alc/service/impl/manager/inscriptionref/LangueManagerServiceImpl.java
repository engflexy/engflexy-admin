package ma.zs.alc.service.impl.manager.inscriptionref;


import ma.zs.alc.bean.core.inscriptionref.Langue;
import ma.zs.alc.dao.criteria.core.inscriptionref.LangueCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.LangueDao;
import ma.zs.alc.dao.specification.core.inscriptionref.LangueSpecification;
import ma.zs.alc.service.facade.manager.inscriptionref.LangueManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class LangueManagerServiceImpl extends AbstractServiceImpl<Langue, LangueCriteria, LangueDao> implements LangueManagerService {







    public Langue findByReferenceEntity(Langue t){
        return t==null? null : dao.findByRef(t.getRef());
    }


    public List<Langue> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Langue.class, LangueSpecification.class);
    }



    public LangueManagerServiceImpl(LangueDao dao) {
        super(dao);
    }

}
