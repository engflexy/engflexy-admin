package ma.zs.zyn.service.impl.admin.quiz;


import ma.zs.zyn.bean.core.quiz.Reponse;
import ma.zs.zyn.dao.criteria.core.quiz.ReponseCriteria;
import ma.zs.zyn.dao.facade.core.quiz.ReponseDao;
import ma.zs.zyn.dao.specification.core.quiz.ReponseSpecification;
import ma.zs.zyn.service.facade.admin.quiz.ReponseAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.zyn.service.facade.admin.quiz.QuestionAdminService ;
import ma.zs.zyn.bean.core.quiz.Question ;

import java.util.List;
@Service
public class ReponseAdminServiceImpl extends AbstractServiceImpl<Reponse, ReponseCriteria, ReponseDao> implements ReponseAdminService {






    public Reponse findByReferenceEntity(Reponse t){
        return  dao.findByRef(t.getRef());
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
    private QuestionAdminService questionService ;

    public ReponseAdminServiceImpl(ReponseDao dao) {
        super(dao);
    }

}
