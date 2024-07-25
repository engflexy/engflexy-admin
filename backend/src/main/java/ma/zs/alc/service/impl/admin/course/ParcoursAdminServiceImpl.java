package ma.zs.alc.service.impl.admin.course;


import ma.zs.alc.bean.core.course.Parcours;
import ma.zs.alc.dao.criteria.core.course.ParcoursCriteria;
import ma.zs.alc.dao.facade.core.course.ParcoursDao;
import ma.zs.alc.dao.specification.core.course.ParcoursSpecification;
import ma.zs.alc.service.facade.admin.course.ParcoursAdminService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import ma.zs.alc.service.facade.admin.collab.CollaboratorAdminService;
import ma.zs.alc.service.facade.admin.course.CoursAdminService ;
import ma.zs.alc.bean.core.course.Cours ;

@Service
public class ParcoursAdminServiceImpl extends AbstractServiceImpl<Parcours, ParcoursCriteria, ParcoursDao> implements ParcoursAdminService {


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
            ListUtil.emptyIfNull(resultCourss.get(0)).forEach(e -> e.setParcours(parcours));
            coursService.update(resultCourss.get(0),true);
        }
    }




    public Parcours findByReferenceEntity(Parcours t){
        return t.getId() == null ? null : dao.findById(t.getId()).orElse(null);
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
    private CollaboratorAdminService collaboratorService ;
    @Autowired
    private CoursAdminService coursService ;

    public ParcoursAdminServiceImpl(ParcoursDao dao) {
        super(dao);
    }

}
