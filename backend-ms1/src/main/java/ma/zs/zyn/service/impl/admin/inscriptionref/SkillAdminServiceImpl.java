package ma.zs.zyn.service.impl.admin.inscriptionref;


import ma.zs.zyn.bean.core.inscriptionref.Skill;
import ma.zs.zyn.dao.criteria.core.inscriptionref.SkillCriteria;
import ma.zs.zyn.dao.facade.core.inscriptionref.SkillDao;
import ma.zs.zyn.dao.specification.core.inscriptionref.SkillSpecification;
import ma.zs.zyn.service.facade.admin.inscriptionref.SkillAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class SkillAdminServiceImpl extends AbstractServiceImpl<Skill, SkillCriteria, SkillDao> implements SkillAdminService {






    public Skill findByReferenceEntity(Skill t){
        return  dao.findByCode(t.getCode());
    }


    public List<Skill> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Skill.class, SkillSpecification.class);
    }



    public SkillAdminServiceImpl(SkillDao dao) {
        super(dao);
    }

}
