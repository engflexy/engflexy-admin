package ma.zs.alc.service.impl.manager.course;


import ma.zs.alc.bean.core.course.Cours;
import ma.zs.alc.bean.core.course.Parcours;
import ma.zs.alc.dao.criteria.core.course.ParcoursCriteria;
import ma.zs.alc.dao.facade.core.course.ParcoursDao;
import ma.zs.alc.dao.specification.core.course.ParcoursSpecification;
import ma.zs.alc.service.facade.manager.collab.CollaboratorManagerService;
import ma.zs.alc.service.facade.manager.course.CoursManagerService;
import ma.zs.alc.service.facade.manager.course.ParcoursManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static ma.zs.alc.zynerator.util.ListUtil.emptyIfNull;

@Service
public class ParcoursManagerServiceImpl extends AbstractServiceImpl<Parcours, ParcoursCriteria, ParcoursDao> implements ParcoursManagerService {



    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public Parcours create(Parcours t) {
        Parcours saved= super.create(t);
        if (saved != null && t.getCourss() != null) {
                t.getCourss().forEach(element-> {
                    element.setParcours(saved);
                    coursService.create(element);
            });
        }
        return saved;

    }

    public Parcours findWithAssociatedLists(Long id){
        Parcours result = dao.findById(id).orElse(null);
        if(result!=null && result.getId() != null) {
            result.setCourss(coursService.findByParcoursId(id));
        }
        return result;
    }
    @Transactional
    public void deleteAssociatedLists(Long id) {
        coursService.deleteByParcoursId(id);
    }


    public void updateWithAssociatedLists(Parcours parcours){
    if(parcours !=null && parcours.getId() != null){
            List<List<Cours>> resultCourss= coursService.getToBeSavedAndToBeDeleted(coursService.findByParcoursId(parcours.getId()),parcours.getCourss());
            coursService.delete(resultCourss.get(1));
            emptyIfNull(resultCourss.get(0)).forEach(e -> e.setParcours(parcours));
            coursService.update(resultCourss.get(0),true);
        }
    }




    public Parcours findByReferenceEntity(Parcours t){
        return t==null? null : dao.findByCode(t.getCode());
    }
    public void findOrSaveAssociatedObject(Parcours t){
        if( t != null) {
            t.setCollaborator(collaboratorService.findOrSave(t.getCollaborator()));
        }
    }

    public List<Parcours> findByCollaboratorId(Long id){
        return dao.findByCollaboratorId(id);
    }
    public int deleteByCollaboratorId(Long id){
        return dao.deleteByCollaboratorId(id);
    }
    public long countByCollaboratorId(Long id){
        return dao.countByCollaboratorId(id);
    }

    public List<Parcours> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Parcours.class, ParcoursSpecification.class);
    }


    @Autowired
    private CollaboratorManagerService collaboratorService ;
    @Autowired
    private CoursManagerService coursService ;

    public ParcoursManagerServiceImpl(ParcoursDao dao) {
        super(dao);
    }

}
