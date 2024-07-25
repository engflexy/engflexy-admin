package ma.zs.alc.service.impl.manager.inscriptionref;


import ma.zs.alc.bean.core.inscriptionref.NiveauEtude;
import ma.zs.alc.dao.criteria.core.inscriptionref.NiveauEtudeCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.NiveauEtudeDao;
import ma.zs.alc.dao.specification.core.inscriptionref.NiveauEtudeSpecification;
import ma.zs.alc.service.facade.manager.inscriptionref.NiveauEtudeManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class NiveauEtudeManagerServiceImpl extends AbstractServiceImpl<NiveauEtude, NiveauEtudeCriteria, NiveauEtudeDao> implements NiveauEtudeManagerService {







    public NiveauEtude findByReferenceEntity(NiveauEtude t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<NiveauEtude> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(NiveauEtude.class, NiveauEtudeSpecification.class);
    }



    public NiveauEtudeManagerServiceImpl(NiveauEtudeDao dao) {
        super(dao);
    }

}
