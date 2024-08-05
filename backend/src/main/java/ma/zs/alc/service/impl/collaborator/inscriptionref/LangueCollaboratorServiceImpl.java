package ma.zs.alc.service.impl.collaborator.inscriptionref;

import ma.zs.alc.bean.core.inscriptionref.Langue;
import ma.zs.alc.dao.criteria.core.inscriptionref.LangueCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.LangueDao;
import ma.zs.alc.dao.specification.core.inscriptionref.LangueSpecification;
import ma.zs.alc.service.facade.collaborator.inscriptionref.LangueCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LangueCollaboratorServiceImpl extends AbstractServiceImpl<Langue, LangueCriteria, LangueDao> implements LangueCollaboratorService {

    @Autowired
    public LangueCollaboratorServiceImpl(LangueDao dao) {
        super(dao);
    }

    @Override
    public Langue findByReferenceEntity(Langue t) {
        return t == null || t.getLibelle()==null ? null : dao.findByLibelle(t.getLibelle());
    }

    @Override
    public List<Langue> findAllOptimized() {
        return dao.findAllOptimized();
    }

    @Override
    public void configure() {
        super.configure(Langue.class, LangueSpecification.class);
    }
}
