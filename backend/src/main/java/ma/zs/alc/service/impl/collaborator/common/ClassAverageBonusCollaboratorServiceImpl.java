package ma.zs.alc.service.impl.collaborator.common;


import ma.zs.alc.bean.core.common.ClassAverageBonus;
import ma.zs.alc.dao.criteria.core.common.ClassAverageBonusCriteria;
import ma.zs.alc.dao.facade.core.common.ClassAverageBonusDao;
import ma.zs.alc.dao.specification.core.common.ClassAverageBonusSpecification;
import ma.zs.alc.service.facade.collaborator.common.ClassAverageBonusCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.vocab.CollaboratorCollaboratorService ;
import ma.zs.alc.bean.core.vocab.Collaborator ;

import java.util.List;
@Service
public class ClassAverageBonusCollaboratorServiceImpl extends AbstractServiceImpl<ClassAverageBonus, ClassAverageBonusCriteria, ClassAverageBonusDao> implements ClassAverageBonusCollaboratorService {






    public ClassAverageBonus findByReferenceEntity(ClassAverageBonus t){
        return t.getId() == null ? null : dao.findById(t.getId()).orElse(null);
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
    private CollaboratorCollaboratorService collaboratorService ;

    public ClassAverageBonusCollaboratorServiceImpl(ClassAverageBonusDao dao) {
        super(dao);
    }

}
