package ma.zs.alc.service.impl.manager.homework;


import ma.zs.alc.bean.core.homework.HomeWorkQuestion;
import ma.zs.alc.dao.criteria.core.homework.HomeWorkQuestionCriteria;
import ma.zs.alc.dao.facade.core.homework.HomeWorkQuestionDao;
import ma.zs.alc.dao.specification.core.homework.HomeWorkQuestionSpecification;
import ma.zs.alc.service.facade.manager.homework.HomeWorkQuestionManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import static ma.zs.alc.zynerator.util.ListUtil.*;

import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import ma.zs.alc.service.facade.manager.homework.HoweWorkQSTReponseManagerService ;
import ma.zs.alc.bean.core.homework.HoweWorkQSTReponse ;
import ma.zs.alc.service.facade.manager.quizref.TypeDeQuestionManagerService ;
import ma.zs.alc.service.facade.manager.homework.HomeWorkManagerService ;

@Service
public class HomeWorkQuestionManagerServiceImpl extends AbstractServiceImpl<HomeWorkQuestion, HomeWorkQuestionCriteria, HomeWorkQuestionDao> implements HomeWorkQuestionManagerService {



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
            emptyIfNull(resultHoweWorkQSTReponses.get(0)).forEach(e -> e.setHomeWorkQuestion(homeWorkQuestion));
            howeWorkQSTReponseService.update(resultHoweWorkQSTReponses.get(0),true);
        }
    }




    public HomeWorkQuestion findByReferenceEntity(HomeWorkQuestion t){
        return t==null? null : dao.findByRef(t.getRef());
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
    private HoweWorkQSTReponseManagerService howeWorkQSTReponseService ;
    @Autowired
    private TypeDeQuestionManagerService typeDeQuestionService ;
    @Autowired
    private HomeWorkManagerService homeWorkService ;

    public HomeWorkQuestionManagerServiceImpl(HomeWorkQuestionDao dao) {
        super(dao);
    }

}