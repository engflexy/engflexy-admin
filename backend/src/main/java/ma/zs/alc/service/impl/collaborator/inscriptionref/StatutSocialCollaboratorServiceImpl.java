package ma.zs.alc.service.impl.collaborator.inscriptionref;


import ma.zs.alc.bean.core.inscriptionref.StatutSocial;
import ma.zs.alc.dao.criteria.core.inscriptionref.StatutSocialCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.StatutSocialDao;
import ma.zs.alc.dao.specification.core.inscriptionref.StatutSocialSpecification;
import ma.zs.alc.service.facade.collaborator.inscriptionref.StatutSocialCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class StatutSocialCollaboratorServiceImpl extends AbstractServiceImpl<StatutSocial, StatutSocialCriteria, StatutSocialDao> implements StatutSocialCollaboratorService {






    public StatutSocial findByReferenceEntity(StatutSocial t){
        return t.getId() == null ? null : dao.findById(t.getId()).orElse(null);
    }


    public List<StatutSocial> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(StatutSocial.class, StatutSocialSpecification.class);
    }



    public StatutSocialCollaboratorServiceImpl(StatutSocialDao dao) {
        super(dao);
    }

}
