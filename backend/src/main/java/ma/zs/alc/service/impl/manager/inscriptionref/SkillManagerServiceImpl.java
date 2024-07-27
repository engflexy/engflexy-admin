package ma.zs.alc.service.impl.manager.inscriptionref;


import ma.zs.alc.bean.core.inscriptionref.Skill;
import ma.zs.alc.dao.criteria.core.inscriptionref.SkillCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.SkillDao;
import ma.zs.alc.dao.specification.core.inscriptionref.SkillSpecification;
import ma.zs.alc.service.facade.manager.inscriptionref.SkillManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class SkillManagerServiceImpl extends AbstractServiceImpl<Skill, SkillCriteria, SkillDao> implements SkillManagerService {







    public Skill findByReferenceEntity(Skill t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<Skill> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Skill.class, SkillSpecification.class);
    }



    public SkillManagerServiceImpl(SkillDao dao) {
        super(dao);
    }

}
