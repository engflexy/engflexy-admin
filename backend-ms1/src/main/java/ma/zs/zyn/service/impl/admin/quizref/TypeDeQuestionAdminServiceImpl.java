package ma.zs.zyn.service.impl.admin.quizref;


import ma.zs.zyn.bean.core.quizref.TypeDeQuestion;
import ma.zs.zyn.dao.criteria.core.quizref.TypeDeQuestionCriteria;
import ma.zs.zyn.dao.facade.core.quizref.TypeDeQuestionDao;
import ma.zs.zyn.dao.specification.core.quizref.TypeDeQuestionSpecification;
import ma.zs.zyn.service.facade.admin.quizref.TypeDeQuestionAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class TypeDeQuestionAdminServiceImpl extends AbstractServiceImpl<TypeDeQuestion, TypeDeQuestionCriteria, TypeDeQuestionDao> implements TypeDeQuestionAdminService {






    public TypeDeQuestion findByReferenceEntity(TypeDeQuestion t){
        return  dao.findByRef(t.getRef());
    }


    public List<TypeDeQuestion> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(TypeDeQuestion.class, TypeDeQuestionSpecification.class);
    }



    public TypeDeQuestionAdminServiceImpl(TypeDeQuestionDao dao) {
        super(dao);
    }

}
