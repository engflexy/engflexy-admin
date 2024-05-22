package ma.zs.alc.service.impl.collaborator.course;


import ma.zs.alc.bean.core.course.Exercice;
import ma.zs.alc.bean.core.course.Section;
import ma.zs.alc.dao.criteria.core.course.SectionCriteria;
import ma.zs.alc.dao.facade.core.course.SectionDao;
import ma.zs.alc.dao.specification.core.course.SectionSpecification;
import ma.zs.alc.service.facade.collaborator.course.CoursCollaboratorService;
import ma.zs.alc.service.facade.collaborator.course.ExerciceCollaboratorService;
import ma.zs.alc.service.facade.collaborator.course.SectionCollaboratorService;
import ma.zs.alc.service.facade.collaborator.quiz.QuizCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SectionCollaboratorServiceImpl extends AbstractServiceImpl<Section, SectionCriteria, SectionDao> implements SectionCollaboratorService {


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

    public Section findWithAssociatedLists(Long id) {
        Section result = dao.findById(id).orElse(null);
        if (result != null && result.getId() != null) {
            result.setExercices(exerciceService.findBySectionId(id));
        }
        return result;
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
        return dao.findByCoursId(id);
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
    private QuizCollaboratorService quizService;
    @Autowired
    private ExerciceCollaboratorService exerciceService;
    @Autowired
    private CoursCollaboratorService coursService;

    public SectionCollaboratorServiceImpl(SectionDao dao) {
        super(dao);
    }

}