package ma.zs.alc.service.impl.manager.common;


import ma.zs.alc.bean.core.common.ClassAverageBonus;
import ma.zs.alc.dao.criteria.core.common.ClassAverageBonusCriteria;
import ma.zs.alc.dao.facade.core.common.ClassAverageBonusDao;
import ma.zs.alc.dao.specification.core.common.ClassAverageBonusSpecification;
import ma.zs.alc.service.facade.manager.common.ClassAverageBonusManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.manager.collab.CollaboratorManagerService ;
import ma.zs.alc.bean.core.collab.Collaborator ;

@Service
public class ClassAverageBonusManagerServiceImpl extends AbstractServiceImpl<ClassAverageBonus, ClassAverageBonusCriteria, ClassAverageBonusDao> implements ClassAverageBonusManagerService {







    public ClassAverageBonus findByReferenceEntity(ClassAverageBonus t){
        return t==null? null : dao.findByCode(t.getCode());
    }
    public void findOrSaveAssociatedObject(ClassAverageBonus t){
        if( t != null) {
            t.setCollaborator(collaboratorService.findOrSave(t.getCollaborator()));
        }
    }

    public List<ClassAverageBonus> findByCollaboratorId(Long id){
        return dao.findByCollaboratorId(id);
    }
    public int deleteByCollaboratorId(Long id){
        return dao.deleteByCollaboratorId(id);
    }
    public long countByCollaboratorId(Long id){
        return dao.countByCollaboratorId(id);
    }

    public List<ClassAverageBonus> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(ClassAverageBonus.class, ClassAverageBonusSpecification.class);
    }


    @Autowired
    private CollaboratorManagerService collaboratorService ;

    public ClassAverageBonusManagerServiceImpl(ClassAverageBonusDao dao) {
        super(dao);
    }

}
