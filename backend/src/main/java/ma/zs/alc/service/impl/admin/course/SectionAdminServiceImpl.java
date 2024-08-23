package ma.zs.alc.service.impl.admin.course;


import ma.zs.alc.bean.core.course.Exercice;
import ma.zs.alc.bean.core.course.Section;
import ma.zs.alc.dao.criteria.core.course.SectionCriteria;
import ma.zs.alc.dao.facade.core.course.SectionDao;
import ma.zs.alc.dao.specification.core.course.SectionSpecification;
import ma.zs.alc.service.facade.admin.course.CoursAdminService;
import ma.zs.alc.service.facade.admin.course.ExerciceAdminService;
import ma.zs.alc.service.facade.admin.course.SectionAdminService;
import ma.zs.alc.service.facade.admin.quiz.QuizAdminService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SectionAdminServiceImpl extends AbstractServiceImpl<Section, SectionCriteria, SectionDao> implements SectionAdminService {


    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public Section create(Section t) {
        Section saved = super.create(t);
        if (saved != null && t.getExercices() != null) {
            t.getExercices().forEach(element -> {
                element.setSection(saved);
                exerciceService.create(element);
            });
        }
        return saved;

    }

    public Section updateField(Section section) {
        if (section.getId() != null) {
            Section saved = findById(section.getId());
            saved.setDescription(section.getDescription());
            saved.setLibelle(section.getLibelle());
            section = dao.save(saved);
        }
        return section;
    }

    public Section findWithAssociatedLists(Long id) {
        Section result = dao.findById(id).orElse(null);
        if (result != null && result.getId() != null) {
            result.setExercices(exerciceService.findBySectionId(id));
        }
        return result;
    }

   public Section findByReferenceEntity(Section section) {
        return section == null ? null : dao.findByCode(section.getCode());
    }

    @Transactional
    public void deleteAssociatedLists(Long id) {
        quizService.deleteBySectionId(id);
        exerciceService.deleteBySectionId(id);
    }


    public void updateWithAssociatedLists(Section section) {
        if (section != null && section.getId() != null) {
            List<List<Exercice>> resultExercices = exerciceService.getToBeSavedAndToBeDeleted(exerciceService.findBySectionId(section.getId()), section.getExercices());
            exerciceService.delete(resultExercices.get(1));
            ListUtil.emptyIfNull(resultExercices.get(0)).forEach(e -> e.setSection(section));
            exerciceService.update(resultExercices.get(0), true);
        }
    }


    public void findOrSaveAssociatedObject(Section t) {
        if (t != null) {
            t.setCours(coursService.findOrSave(t.getCours()));
        }
    }

    public List<Section> findByCoursId(Long id) {
        return dao.findByCoursIdOrderByNumeroAsc(id);
    }

    public int deleteByCoursId(Long id) {
        return dao.deleteByCoursId(id);
    }

    public long countByCoursCode(String code) {
        return dao.countByCoursCode(code);
    }

    public List<Section> findAllOptimized() {
        return dao.findAllOptimized();
    }


    public void configure() {
        super.configure(Section.class, SectionSpecification.class);
    }


    @Autowired
    private QuizAdminService quizService;
    @Autowired
    private ExerciceAdminService exerciceService;
    @Autowired
    private CoursAdminService coursService;

    public SectionAdminServiceImpl(SectionDao dao) {
        super(dao);
    }

}
