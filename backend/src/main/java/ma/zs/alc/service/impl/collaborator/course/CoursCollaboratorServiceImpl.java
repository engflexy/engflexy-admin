package ma.zs.alc.service.impl.collaborator.course;


import ma.zs.alc.bean.core.course.Cours;
import ma.zs.alc.bean.core.course.Parcours;
import ma.zs.alc.bean.core.course.Section;
import ma.zs.alc.bean.core.homework.HomeWork;
import ma.zs.alc.dao.criteria.core.course.CoursCriteria;
import ma.zs.alc.dao.facade.core.course.CoursDao;
import ma.zs.alc.dao.facade.core.course.ParcoursDao;
import ma.zs.alc.dao.specification.core.course.CoursSpecification;
import ma.zs.alc.service.facade.collaborator.course.CoursCollaboratorService;
import ma.zs.alc.service.facade.collaborator.course.ParcoursCollaboratorService;
import ma.zs.alc.service.facade.collaborator.course.SectionCollaboratorService;
import ma.zs.alc.service.facade.collaborator.homework.HomeWorkCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CoursCollaboratorServiceImpl extends AbstractServiceImpl<Cours, CoursCriteria, CoursDao> implements CoursCollaboratorService {


    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public Cours create(Cours t) {
        Cours saved = super.create(t);
        if (saved != null) {
            Parcours parcours = parcoursService.findById(saved.getParcours().getId());
            parcours.increaseNreCourse();
            parcoursDao.save(parcours);

            if (t.getSections() != null) {
                t.getSections().forEach(element -> {
                    element.setCours(saved);
                    sectionService.create(element);
                });
            }
            if (t.getHomeWorks() != null) {
                t.getHomeWorks().forEach(element -> {
                    element.setCours(saved);
                    homeWorkService.create(element);
                });
            }
        }
        return saved;

    }

    public Cours findWithAssociatedLists(Long id) {
        Cours result = dao.findById(id).orElse(null);
        if (result != null && result.getId() != null) {
            result.setSections(sectionService.findByCoursId(id));
            result.setHomeWorks(homeWorkService.findByCoursId(id));
        }
        return result;
    }

    @Transactional
    public void deleteAssociatedLists(Long id) {
        sectionService.deleteByCoursId(id);
        homeWorkService.deleteByCoursId(id);
    }


    public void updateWithAssociatedLists(Cours cours) {
        if (cours != null && cours.getId() != null) {
            List<List<Section>> resultSections = sectionService.getToBeSavedAndToBeDeleted(sectionService.findByCoursId(cours.getId()), cours.getSections());
            sectionService.delete(resultSections.get(1));
            ListUtil.emptyIfNull(resultSections.get(0)).forEach(e -> e.setCours(cours));
            sectionService.update(resultSections.get(0), true);
            List<List<HomeWork>> resultHomeWorks = homeWorkService.getToBeSavedAndToBeDeleted(homeWorkService.findByCoursId(cours.getId()), cours.getHomeWorks());
            homeWorkService.delete(resultHomeWorks.get(1));
            ListUtil.emptyIfNull(resultHomeWorks.get(0)).forEach(e -> e.setCours(cours));
            homeWorkService.update(resultHomeWorks.get(0), true);
        }
    }


    public Cours findByReferenceEntity(Cours t) {
        return t.getId() == null ? null : findById(t.getId());
    }

    public void findOrSaveAssociatedObject(Cours t) {
        if (t != null) {
            t.setParcours(parcoursService.findOrSave(t.getParcours()));
        }
    }

    public List<Cours> findByParcoursId(Long id) {
        return dao.findByParcoursId(id);
    }

    public int deleteByParcoursId(Long id) {
        return dao.deleteByParcoursId(id);
    }

    public long countByParcoursCode(String code) {
        return dao.countByParcoursCode(code);
    }

    public List<Cours> findAllOptimized() {
        return dao.findAllOptimized();
    }


    public void configure() {
        super.configure(Cours.class, CoursSpecification.class);
    }


    @Autowired
    private ParcoursCollaboratorService parcoursService;
    @Autowired
    private ParcoursDao parcoursDao;
    @Autowired
    private SectionCollaboratorService sectionService;
    @Autowired
    private HomeWorkCollaboratorService homeWorkService;

    public CoursCollaboratorServiceImpl(CoursDao dao) {
        super(dao);
    }

}
