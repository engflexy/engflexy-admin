package ma.zs.alc.service.impl.collaborator.quiz;


import ma.zs.alc.bean.core.quiz.Question;
import ma.zs.alc.bean.core.quiz.Quiz;
import ma.zs.alc.dao.criteria.core.quiz.QuizCriteria;
import ma.zs.alc.dao.facade.core.quiz.QuizDao;
import ma.zs.alc.dao.specification.core.quiz.QuizSpecification;
import ma.zs.alc.service.facade.admin.course.ExerciceAdminService;
import ma.zs.alc.service.facade.collaborator.quiz.QuestionCollaboratorService;
import ma.zs.alc.service.facade.collaborator.quiz.QuizCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class QuizCollaboratorServiceImpl extends AbstractServiceImpl<Quiz, QuizCriteria, QuizDao> implements QuizCollaboratorService {


    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public Quiz create(Quiz t) {
        Quiz saved = super.create(t);
        if (saved != null && t.getQuestions() != null) {
            t.getQuestions().forEach(element -> {
                element.setQuiz(saved);
                questionService.create(element);
            });
        }
        return saved;

    }

    public Quiz findWithAssociatedLists(Long id) {
        Quiz result = dao.findById(id).orElse(null);
        if (result != null && result.getId() != null) {
            result.setQuestions(questionService.findByQuizId(id));
        }
        return result;
    }

    @Transactional
    public void deleteAssociatedLists(Long id) {
        questionService.deleteByQuizId(id);
    }


    public void updateWithAssociatedLists(Quiz quiz) {
        if (quiz != null && quiz.getId() != null) {
            List<List<Question>> resultQuestions = questionService.getToBeSavedAndToBeDeleted(questionService.findByQuizId(quiz.getId()), quiz.getQuestions());
            questionService.delete(resultQuestions.get(1));
            ListUtil.emptyIfNull(resultQuestions.get(0)).forEach(e -> e.setQuiz(quiz));
            questionService.update(resultQuestions.get(0), true);
        }
    }


    public Quiz findByReferenceEntity(Quiz t) {
        return t == null ? null : dao.findByRef(t.getRef());
    }

    public void findOrSaveAssociatedObject(Quiz t) {
        if (t != null) {
            t.setExercice(exerciceAdminService.findOrSave(t.getExercice()));
        }
    }

    public List<Quiz> findBySectionId(Long id) {
        return dao.findByExerciceId(id);
    }

    public int deleteBySectionId(Long id) {
        return dao.deleteByExerciceId(id);
    }

    public long countBySectionCode(String code) {
        return dao.countByExerciceLibelle(code);
    }

    public List<Quiz> findAllOptimized() {
        return dao.findAllOptimized();
    }


    public void configure() {
        super.configure(Quiz.class, QuizSpecification.class);
    }


    @Autowired
    private QuestionCollaboratorService questionService;
    @Autowired
    private ExerciceAdminService exerciceAdminService;

    public QuizCollaboratorServiceImpl(QuizDao dao) {
        super(dao);
    }

}
