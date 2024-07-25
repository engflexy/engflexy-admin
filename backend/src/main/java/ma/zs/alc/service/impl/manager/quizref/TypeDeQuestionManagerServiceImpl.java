package ma.zs.alc.service.impl.manager.quizref;


import ma.zs.alc.bean.core.quizref.TypeDeQuestion;
import ma.zs.alc.dao.criteria.core.quizref.TypeDeQuestionCriteria;
import ma.zs.alc.dao.facade.core.quizref.TypeDeQuestionDao;
import ma.zs.alc.dao.specification.core.quizref.TypeDeQuestionSpecification;
import ma.zs.alc.service.facade.manager.quizref.TypeDeQuestionManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeDeQuestionManagerServiceImpl extends AbstractServiceImpl<TypeDeQuestion, TypeDeQuestionCriteria, TypeDeQuestionDao> implements TypeDeQuestionManagerService {







    public TypeDeQuestion findByReferenceEntity(TypeDeQuestion t){
        return t==null? null : dao.findByRef(t.getRef());
    }


    public List<TypeDeQuestion> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(TypeDeQuestion.class, TypeDeQuestionSpecification.class);
    }



    public TypeDeQuestionManagerServiceImpl(TypeDeQuestionDao dao) {
        super(dao);
    }

}
