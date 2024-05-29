package ma.zs.alc.service.impl.admin.quiz;


import ma.zs.alc.bean.core.quiz.Question;
import ma.zs.alc.bean.core.quiz.Quiz;
import ma.zs.alc.dao.criteria.core.quiz.QuizCriteria;
import ma.zs.alc.dao.facade.core.quiz.QuizDao;
import ma.zs.alc.dao.specification.core.quiz.QuizSpecification;
import ma.zs.alc.service.facade.admin.course.ExerciceAdminService;
import ma.zs.alc.service.facade.admin.quiz.QuestionAdminService;
import ma.zs.alc.service.facade.admin.quiz.QuizAdminService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class QuizAdminServiceImpl extends AbstractServiceImpl<Quiz, QuizCriteria, QuizDao> implements QuizAdminService {



    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public Quiz create(Quiz t) {
        if (t != null) {
            Quiz saved = new Quiz();
            if (t.getId() != null) {
                saved = findById(t.getId());
            }
            saved.setNumero(t.getNumero());
            saved.setLib(t.getLib());
            saved.setRef(t.getRef());
            saved.setSeuilReussite(t.getSeuilReussite());
            saved = dao.save(saved);
            if (!t.getQuestions().isEmpty()) {
                Quiz finalSaved = saved;
                t.getQuestions().forEach(qst -> {
                    qst.setQuiz(finalSaved);
                    qst = questionService.create(qst);
                });
                saved.setQuestions(t.getQuestions());
            }
            return saved;
        }
        return null;
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
        return (t != null && t.getId() != null) ? dao.findById(t.getId()).orElse(null) : null;
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
    private QuestionAdminService questionService;
    @Autowired
    private ExerciceAdminService exerciceAdminService;

    public QuizAdminServiceImpl(QuizDao dao) {
        super(dao);
    }

}
