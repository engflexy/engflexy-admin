package ma.zs.alc.service.impl.manager.course;


import ma.zs.alc.bean.core.course.Cours;
import ma.zs.alc.bean.core.course.Section;
import ma.zs.alc.bean.core.homework.HomeWork;
import ma.zs.alc.dao.criteria.core.course.CoursCriteria;
import ma.zs.alc.dao.facade.core.course.CoursDao;
import ma.zs.alc.dao.specification.core.course.CoursSpecification;
import ma.zs.alc.service.facade.manager.course.CoursManagerService;
import ma.zs.alc.service.facade.manager.course.ParcoursManagerService;
import ma.zs.alc.service.facade.manager.course.SectionManagerService;
import ma.zs.alc.service.facade.manager.homework.HomeWorkManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static ma.zs.alc.zynerator.util.ListUtil.emptyIfNull;

@Service
public class CoursManagerServiceImpl extends AbstractServiceImpl<Cours, CoursCriteria, CoursDao> implements CoursManagerService {


    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public Cours create(Cours t) {
        Cours saved = super.create(t);
        if (saved != null && t.getSections() != null) {
            t.getSections().forEach(element -> {
                element.setCours(saved);
                sectionService.create(element);
            });
        }
        if (saved != null && t.getHomeWorks() != null) {
            t.getHomeWorks().forEach(element -> {
                element.setCours(saved);
                homeWorkService.create(element);
            });
        }
        return saved;

    }

    public Cours findWithAssociatedLists(Long id) {
        Cours result = dao.findById(id).orElse(null);
        if (result != null && result.getId() != null) {
            result.setHomeWorks(homeWorkService.findByCoursId(id));
        }
        return result;
    }

    @Transactional
    public void deleteAssociatedLists(Long id) {
        homeWorkService.deleteByCoursId(id);
    }


    public void updateWithAssociatedLists(Cours cours) {
        if (cours != null && cours.getId() != null) {
            List<List<Section>> resultSections = sectionService.getToBeSavedAndToBeDeleted(sectionService.findByCoursId(cours.getId()), cours.getSections());
            sectionService.delete(resultSections.get(1));
            emptyIfNull(resultSections.get(0)).forEach(e -> e.setCours(cours));
            sectionService.update(resultSections.get(0), true);
            List<List<HomeWork>> resultHomeWorks = homeWorkService.getToBeSavedAndToBeDeleted(homeWorkService.findByCoursId(cours.getId()), cours.getHomeWorks());
            homeWorkService.delete(resultHomeWorks.get(1));
            emptyIfNull(resultHomeWorks.get(0)).forEach(e -> e.setCours(cours));
            homeWorkService.update(resultHomeWorks.get(0), true);
        }
    }


    public Cours findByReferenceEntity(Cours t) {
        return t == null ? null : dao.findByCode(t.getCode());
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
    private ParcoursManagerService parcoursService;
    @Autowired
    private SectionManagerService sectionService;
    @Autowired
    private HomeWorkManagerService homeWorkService;

    public CoursManagerServiceImpl(CoursDao dao) {
        super(dao);
    }

}
