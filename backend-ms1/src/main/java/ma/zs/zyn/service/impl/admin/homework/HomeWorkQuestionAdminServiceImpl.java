package ma.zs.zyn.service.impl.admin.homework;


import ma.zs.zyn.bean.core.homework.HomeWorkQuestion;
import ma.zs.zyn.dao.criteria.core.homework.HomeWorkQuestionCriteria;
import ma.zs.zyn.dao.facade.core.homework.HomeWorkQuestionDao;
import ma.zs.zyn.dao.specification.core.homework.HomeWorkQuestionSpecification;
import ma.zs.zyn.service.facade.admin.homework.HomeWorkQuestionAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import ma.zs.zyn.service.facade.admin.homework.HoweWorkQSTReponseAdminService ;
import ma.zs.zyn.bean.core.homework.HoweWorkQSTReponse ;
import ma.zs.zyn.service.facade.admin.quizref.TypeDeQuestionAdminService ;
import ma.zs.zyn.bean.core.quizref.TypeDeQuestion ;
import ma.zs.zyn.service.facade.admin.homework.HomeWorkAdminService ;
import ma.zs.zyn.bean.core.homework.HomeWork ;

import java.util.List;
@Service
public class HomeWorkQuestionAdminServiceImpl extends AbstractServiceImpl<HomeWorkQuestion, HomeWorkQuestionCriteria, HomeWorkQuestionDao> implements HomeWorkQuestionAdminService {


    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public HomeWorkQuestion create(HomeWorkQuestion t) {
        HomeWorkQuestion saved= super.create(t);
        if (saved != null && t.getHoweWorkQSTReponses() != null) {
                t.getHoweWorkQSTReponses().forEach(element-> {
                element.setHomeWorkQuestion(saved);
                howeWorkQSTReponseService.create(element);
            });
        }
        return saved;

    }

    public HomeWorkQuestion findWithAssociatedLists(Long id){
        HomeWorkQuestion result = dao.findById(id).orElse(null);
        if(result!=null && result.getId() != null) {
            result.setHoweWorkQSTReponses(howeWorkQSTReponseService.findByHomeWorkQuestionId(id));
        }
        return result;
    }
    @Transactional
    public void deleteAssociatedLists(Long id) {
        howeWorkQSTReponseService.deleteByHomeWorkQuestionId(id);
    }


    public void updateWithAssociatedLists(HomeWorkQuestion homeWorkQuestion){
    if(homeWorkQuestion !=null && homeWorkQuestion.getId() != null){
            List<List<HoweWorkQSTReponse>> resultHoweWorkQSTReponses= howeWorkQSTReponseService.getToBeSavedAndToBeDeleted(howeWorkQSTReponseService.findByHomeWorkQuestionId(homeWorkQuestion.getId()),homeWorkQuestion.getHoweWorkQSTReponses());
            howeWorkQSTReponseService.delete(resultHoweWorkQSTReponses.get(1));
            ListUtil.emptyIfNull(resultHoweWorkQSTReponses.get(0)).forEach(e -> e.setHomeWorkQuestion(homeWorkQuestion));
            howeWorkQSTReponseService.update(resultHoweWorkQSTReponses.get(0),true);
        }
    }




    public HomeWorkQuestion findByReferenceEntity(HomeWorkQuestion t){
        return  dao.findByRef(t.getRef());
    }
    public void findOrSaveAssociatedObject(HomeWorkQuestion t){
        if( t != null) {
            t.setTypeDeQuestion(typeDeQuestionService.findOrSave(t.getTypeDeQuestion()));
            t.setHomeWork(homeWorkService.findOrSave(t.getHomeWork()));
        }
    }

    public List<HomeWorkQuestion> findByTypeDeQuestionId(Long id){
        return dao.findByTypeDeQuestionId(id);
    }
    public int deleteByTypeDeQuestionId(Long id){
        return dao.deleteByTypeDeQuestionId(id);
    }
    public long countByTypeDeQuestionRef(String ref){
        return dao.countByTypeDeQuestionRef(ref);
    }
    public List<HomeWorkQuestion> findByHomeWorkId(Long id){
        return dao.findByHomeWorkId(id);
    }
    public int deleteByHomeWorkId(Long id){
        return dao.deleteByHomeWorkId(id);
    }
    public long countByHomeWorkId(Long id){
        return dao.countByHomeWorkId(id);
    }

    public List<HomeWorkQuestion> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(HomeWorkQuestion.class, HomeWorkQuestionSpecification.class);
    }


    @Autowired
    private HoweWorkQSTReponseAdminService howeWorkQSTReponseService ;
    @Autowired
    private TypeDeQuestionAdminService typeDeQuestionService ;
    @Autowired
    private HomeWorkAdminService homeWorkService ;

    public HomeWorkQuestionAdminServiceImpl(HomeWorkQuestionDao dao) {
        super(dao);
    }

}
