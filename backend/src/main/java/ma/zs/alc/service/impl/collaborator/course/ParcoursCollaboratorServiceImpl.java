package ma.zs.alc.service.impl.collaborator.course;


import ma.zs.alc.bean.core.collab.Collaborator;
import ma.zs.alc.bean.core.course.Cours;
import ma.zs.alc.bean.core.course.Parcours;
import ma.zs.alc.dao.criteria.core.course.ParcoursCriteria;
import ma.zs.alc.dao.facade.core.course.ParcoursDao;
import ma.zs.alc.dao.specification.core.course.ParcoursSpecification;
import ma.zs.alc.service.facade.collaborator.collab.CollaboratorCollaboratorService;
import ma.zs.alc.service.facade.collaborator.course.CoursCollaboratorService;
import ma.zs.alc.service.facade.collaborator.course.ParcoursCollaboratorService;
import ma.zs.alc.zynerator.security.bean.User;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ParcoursCollaboratorServiceImpl extends AbstractServiceImpl<Parcours, ParcoursCriteria, ParcoursDao> implements ParcoursCollaboratorService {


    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public Parcours create(Parcours t) {
        Parcours saved = super.create(t);
        if (saved != null && t.getCourss() != null) {
            t.getCourss().forEach(element -> {
                element.setParcours(saved);
                coursService.create(element);
            });
        }
        return saved;

    }

    public Parcours findWithAssociatedLists(Long id) {
        Parcours result = dao.findById(id).orElse(null);
        if (result != null && result.getId() != null) {
            result.setCourss(coursService.findByParcoursId(id));
        }
        return result;
    }

    @Transactional
    public void deleteAssociatedLists(Long id) {
        coursService.deleteByParcoursId(id);
    }

    @Override
    public boolean deleteById(Long id) {
        boolean condition = deleteByIdCheckCondition(id);
        if (condition) {
            deleteAssociatedLists(id);
            //TODO
            // 1- get list of incriptions parcourdsID
            // 2-update inscriptions set parcours to null
            // 3-update inscription
            dao.deleteById(id);
        }
        return condition;
    }

    public void updateWithAssociatedLists(Parcours parcours) {
        if (parcours != null && parcours.getId() != null) {
            List<List<Cours>> resultCourss = coursService.getToBeSavedAndToBeDeleted(coursService.findByParcoursId(parcours.getId()), parcours.getCourss());
            coursService.delete(resultCourss.get(1));
            ListUtil.emptyIfNull(resultCourss.get(0)).forEach(e -> e.setParcours(parcours));
            coursService.update(resultCourss.get(0), true);
        }
    }


    public Parcours findByReferenceEntity(Parcours t) {
        return t.getId() == null ? null : dao.findById(t.getId()).orElse(null);
    }

    public void findOrSaveAssociatedObject(Parcours t) {
        if (t != null) {
            t.setCollaborator(collaboratorService.findOrSave(t.getCollaborator()));
        }
    }

    public List<Parcours> findByCollaboratorId(Long id) {
        return dao.findByCollaboratorId(id);
    }

    public int deleteByCollaboratorId(Long id) {
        return dao.deleteByCollaboratorId(id);
    }

    public long countByCollaboratorId(Long id) {
        return dao.countByCollaboratorId(id);
    }

    public List<Parcours> findAllOptimized() {
        return dao.findAllOptimized();
    }


    public void configure() {
        super.configure(Parcours.class, ParcoursSpecification.class);
    }

    @Override
    public List<Parcours> findByForExgFlexy() {
        return dao.findByCollaboratorId(3L);
    }

    @Override
    public List<Parcours> findForCurrentCollaborator(Long id) {
       // User currentUser = getCurrentUser();
        //Collaborator collaborator = collaboratorService.findByUsername(currentUser.getUsername());
        return dao.findByCollaboratorId(id);
        //return dao.findByCollaboratorId(collaborator.getId());
    }



    private List<Parcours> findByCollaboratorIdAndLibelleLike(Long idCollqborator, String libelle) {
        return dao.findByCollaboratorIdAndLibelleLike(idCollqborator, "%" + libelle + "%");
    }


    @Override
    public List<Parcours> findByLibelleLikeForEngFlexy(String libelle) {
        return findByCollaboratorIdAndLibelleLike(3L, libelle);
    }

    @Override
    public List<Parcours> findByLibelleLikeForCurrent(String libelle) {
        User currentUser = getCurrentUser();
        if (currentUser != null) {
            Collaborator collaborator = collaboratorService.findByUsername(currentUser.getUsername());
        }
        return findByCollaboratorIdAndLibelleLike(2L, libelle);
    }

    @Autowired
    private CollaboratorCollaboratorService collaboratorService;
    @Autowired
    private CoursCollaboratorService coursService;

    public ParcoursCollaboratorServiceImpl(ParcoursDao dao) {
        super(dao);
    }

}
