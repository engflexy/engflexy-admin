package ma.zs.alc.service.impl.manager.course;


import ma.zs.alc.bean.core.course.Exercice;
import ma.zs.alc.bean.core.course.Section;
import ma.zs.alc.bean.core.quiz.Quiz;
import ma.zs.alc.dao.criteria.core.course.SectionCriteria;
import ma.zs.alc.dao.facade.core.course.SectionDao;
import ma.zs.alc.dao.specification.core.course.SectionSpecification;
import ma.zs.alc.service.facade.manager.course.ExerciceManagerService;
import ma.zs.alc.service.facade.manager.course.SectionManagerService;
import ma.zs.alc.service.facade.manager.quiz.QuizManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static ma.zs.alc.zynerator.util.ListUtil.emptyIfNull;

@Service
public class SectionManagerServiceImpl extends AbstractServiceImpl<Section, SectionCriteria, SectionDao> implements SectionManagerService {



    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public Section create(Section t) {
        Section saved= super.create(t);
        if (saved != null && t.getExercices() != null) {
                t.getExercices().forEach(element-> {
                    element.setSection(saved);
                    exerciceService.create(element);
            });
        }
        return saved;

    }

    public Section findWithAssociatedLists(Long id){
        Section result = dao.findById(id).orElse(null);
        if(result!=null && result.getId() != null) {
            result.setExercices(exerciceService.findBySectionId(id));
        }
        return result;
    }
    @Transactional
    public void deleteAssociatedLists(Long id) {
        exerciceService.deleteBySectionId(id);
    }


    public void updateWithAssociatedLists(Section section){
    if(section !=null && section.getId() != null){
            List<List<Exercice>> resultExercices= exerciceService.getToBeSavedAndToBeDeleted(exerciceService.findBySectionId(section.getId()),section.getExercices());
            exerciceService.delete(resultExercices.get(1));
            emptyIfNull(resultExercices.get(0)).forEach(e -> e.setSection(section));
            exerciceService.update(resultExercices.get(0),true);
        }
    }




    public Section findByReferenceEntity(Section t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<Section> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Section.class, SectionSpecification.class);
    }


    @Autowired
    private QuizManagerService quizService ;
    @Autowired
    private ExerciceManagerService exerciceService ;

    public SectionManagerServiceImpl(SectionDao dao) {
        super(dao);
    }

    @Override
    public List<Section> findByCoursId(Long id) {
        return null;
    }

    @Override
    public int deleteByCoursId(Long id) {
        return 0;
    }

    @Override
    public long countByCoursCode(String code) {
        return 0;
    }

    @Override
    public Section updateField(Section section) {
        return null;
    }
}
