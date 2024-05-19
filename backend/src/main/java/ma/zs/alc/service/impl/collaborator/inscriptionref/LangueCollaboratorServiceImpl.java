package ma.zs.alc.service.impl.collaborator.inscriptionref;


import ma.zs.alc.bean.core.inscriptionref.Langue;
import ma.zs.alc.dao.criteria.core.inscriptionref.LangueCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.LangueDao;
import ma.zs.alc.dao.specification.core.inscriptionref.LangueSpecification;
import ma.zs.alc.service.facade.collaborator.inscriptionref.LangueCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class LangueCollaboratorServiceImpl extends AbstractServiceImpl<Langue, LangueCriteria, LangueDao> implements LangueCollaboratorService {






    public Langue findByReferenceEntity(Langue t){
        return t==null? null : dao.findByRef(t.getRef());
    }


    public List<Langue> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Langue.class, LangueSpecification.class);
    }



    public LangueCollaboratorServiceImpl(LangueDao dao) {
        super(dao);
    }

}
