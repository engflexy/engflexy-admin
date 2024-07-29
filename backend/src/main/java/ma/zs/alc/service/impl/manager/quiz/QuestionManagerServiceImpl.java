package ma.zs.alc.service.impl.manager.quiz;


import ma.zs.alc.bean.core.quiz.Question;
import ma.zs.alc.dao.criteria.core.quiz.QuestionCriteria;
import ma.zs.alc.dao.facade.core.quiz.QuestionDao;
import ma.zs.alc.dao.specification.core.quiz.QuestionSpecification;
import ma.zs.alc.service.facade.manager.quiz.QuestionManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import static ma.zs.alc.zynerator.util.ListUtil.*;

import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import ma.zs.alc.service.facade.manager.quiz.QuizManagerService ;
import ma.zs.alc.service.facade.manager.quizref.TypeDeQuestionManagerService ;
import ma.zs.alc.service.facade.manager.quiz.ReponseManagerService ;
import ma.zs.alc.bean.core.quiz.Reponse ;

@Service
public class QuestionManagerServiceImpl extends AbstractServiceImpl<Question, QuestionCriteria, QuestionDao> implements QuestionManagerService {



    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public Question create(Question t) {
        Question saved= super.create(t);
        if (saved != null && t.getReponses() != null) {
                t.getReponses().forEach(element-> {
                    element.setQuestion(saved);
                    reponseService.create(element);
            });
        }
        return saved;

    }

    public Question findWithAssociatedLists(Long id){
        Question result = dao.findById(id).orElse(null);
        if(result!=null && result.getId() != null) {
            result.setReponses(reponseService.findByQuestionId(id));
        }
        return result;
    }
    @Transactional
    public void deleteAssociatedLists(Long id) {
        reponseService.deleteByQuestionId(id);
    }


    public void updateWithAssociatedLists(Question question){
    if(question !=null && question.getId() != null){
            List<List<Reponse>> resultReponses= reponseService.getToBeSavedAndToBeDeleted(reponseService.findByQuestionId(question.getId()),question.getReponses());
            reponseService.delete(resultReponses.get(1));
            emptyIfNull(resultReponses.get(0)).forEach(e -> e.setQuestion(question));
            reponseService.update(resultReponses.get(0),true);
        }
    }




    public Question findByReferenceEntity(Question t){
        return t==null? null : dao.findByLibelle(t.getLibelle());
    }
    public void findOrSaveAssociatedObject(Question t){
        if( t != null) {
            t.setTypeDeQuestion(typeDeQuestionService.findOrSave(t.getTypeDeQuestion()));
            t.setQuiz(quizService.findOrSave(t.getQuiz()));
        }
    }

    public List<Question> findByTypeDeQuestionId(Long id){
        return dao.findByTypeDeQuestionId(id);
    }
    public int deleteByTypeDeQuestionId(Long id){
        return dao.deleteByTypeDeQuestionId(id);
    }
    public long countByTypeDeQuestionRef(String ref){
        return dao.countByTypeDeQuestionRef(ref);
    }
    public List<Question> findByQuizId(Long id){
        return dao.findByQuizId(id);
    }
    public int deleteByQuizId(Long id){
        return dao.deleteByQuizId(id);
    }
    public long countByQuizRef(String ref){
        return dao.countByQuizRef(ref);
    }

    public List<Question> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Question.class, QuestionSpecification.class);
    }


    @Autowired
    private QuizManagerService quizService ;
    @Autowired
    private TypeDeQuestionManagerService typeDeQuestionService ;
    @Autowired
    private ReponseManagerService reponseService ;

    public QuestionManagerServiceImpl(QuestionDao dao) {
        super(dao);
    }

}
