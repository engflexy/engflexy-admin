package ma.zs.alc.service.impl.collaborator.inscriptionref;


import ma.zs.alc.bean.core.inscriptionref.NiveauEtude;
import ma.zs.alc.dao.criteria.core.inscriptionref.NiveauEtudeCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.NiveauEtudeDao;
import ma.zs.alc.dao.specification.core.inscriptionref.NiveauEtudeSpecification;
import ma.zs.alc.service.facade.collaborator.inscriptionref.NiveauEtudeCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class NiveauEtudeCollaboratorServiceImpl extends AbstractServiceImpl<NiveauEtude, NiveauEtudeCriteria, NiveauEtudeDao> implements NiveauEtudeCollaboratorService {






    public NiveauEtude findByReferenceEntity(NiveauEtude t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<NiveauEtude> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(NiveauEtude.class, NiveauEtudeSpecification.class);
    }



    public NiveauEtudeCollaboratorServiceImpl(NiveauEtudeDao dao) {
        super(dao);
    }

}
