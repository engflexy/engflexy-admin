package ma.zs.alc.service.impl.manager.quiz;


import ma.zs.alc.bean.core.quiz.Reponse;
import ma.zs.alc.dao.criteria.core.quiz.ReponseCriteria;
import ma.zs.alc.dao.facade.core.quiz.ReponseDao;
import ma.zs.alc.dao.specification.core.quiz.ReponseSpecification;
import ma.zs.alc.service.facade.manager.quiz.QuestionManagerService;
import ma.zs.alc.service.facade.manager.quiz.ReponseManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReponseManagerServiceImpl extends AbstractServiceImpl<Reponse, ReponseCriteria, ReponseDao> implements ReponseManagerService {







    public Reponse findByReferenceEntity(Reponse t){
        return t==null? null : dao.findByRef(t.getRef());
    }
    public void findOrSaveAssociatedObject(Reponse t){
        if( t != null) {
            t.setQuestion(questionService.findOrSave(t.getQuestion()));
        }
    }

    public List<Reponse> findByQuestionId(Long id){
        return dao.findByQuestionId(id);
    }
    public int deleteByQuestionId(Long id){
        return dao.deleteByQuestionId(id);
    }
    public long countByQuestionLibelle(String libelle){
        return dao.countByQuestionLibelle(libelle);
    }

    public List<Reponse> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Reponse.class, ReponseSpecification.class);
    }


    @Autowired
    private QuestionManagerService questionService ;

    public ReponseManagerServiceImpl(ReponseDao dao) {
        super(dao);
    }

}
