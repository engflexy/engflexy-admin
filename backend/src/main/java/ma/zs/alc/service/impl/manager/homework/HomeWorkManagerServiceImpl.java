package ma.zs.alc.service.impl.manager.homework;


import ma.zs.alc.bean.core.homework.HomeWork;
import ma.zs.alc.dao.criteria.core.homework.HomeWorkCriteria;
import ma.zs.alc.dao.facade.core.homework.HomeWorkDao;
import ma.zs.alc.dao.specification.core.homework.HomeWorkSpecification;
import ma.zs.alc.service.facade.manager.homework.HomeWorkManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import static ma.zs.alc.zynerator.util.ListUtil.*;

import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import ma.zs.alc.service.facade.manager.homework.HomeWorkEtudiantManagerService ;
import ma.zs.alc.bean.core.homework.HomeWorkEtudiant ;
import ma.zs.alc.service.facade.manager.homework.HomeWorkQuestionManagerService ;
import ma.zs.alc.bean.core.homework.HomeWorkQuestion ;
import ma.zs.alc.service.facade.manager.homework.TypeHomeWorkManagerService ;
import ma.zs.alc.service.facade.manager.course.CoursManagerService ;

@Service
public class HomeWorkManagerServiceImpl extends AbstractServiceImpl<HomeWork, HomeWorkCriteria, HomeWorkDao> implements HomeWorkManagerService {



    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public HomeWork create(HomeWork t) {
        HomeWork saved= super.create(t);
        if (saved != null && t.getHomeWorkQuestions() != null) {
                t.getHomeWorkQuestions().forEach(element-> {
                    element.setHomeWork(saved);
                    homeWorkQuestionService.create(element);
            });
        }
        return saved;

    }

    public HomeWork findWithAssociatedLists(Long id){
        HomeWork result = dao.findById(id).orElse(null);
        if(result!=null && result.getId() != null) {
            result.setHomeWorkQuestions(homeWorkQuestionService.findByHomeWorkId(id));
        }
        return result;
    }
    @Transactional
    public void deleteAssociatedLists(Long id) {
        homeWorkQuestionService.deleteByHomeWorkId(id);
        homeWorkEtudiantService.deleteByHomeWorkId(id);
    }


    public void updateWithAssociatedLists(HomeWork homeWork){
    if(homeWork !=null && homeWork.getId() != null){
            List<List<HomeWorkQuestion>> resultHomeWorkQuestions= homeWorkQuestionService.getToBeSavedAndToBeDeleted(homeWorkQuestionService.findByHomeWorkId(homeWork.getId()),homeWork.getHomeWorkQuestions());
            homeWorkQuestionService.delete(resultHomeWorkQuestions.get(1));
            emptyIfNull(resultHomeWorkQuestions.get(0)).forEach(e -> e.setHomeWork(homeWork));
            homeWorkQuestionService.update(resultHomeWorkQuestions.get(0),true);
         }
    }




    public void findOrSaveAssociatedObject(HomeWork t){
        if( t != null) {
            t.setCours(coursService.findOrSave(t.getCours()));
            t.setTypeHomeWork(typeHomeWorkService.findOrSave(t.getTypeHomeWork()));
        }
    }

    public List<HomeWork> findByCoursId(Long id){
        return dao.findByCoursId(id);
    }
    public int deleteByCoursId(Long id){
        return dao.deleteByCoursId(id);
    }
    public long countByCoursCode(String code){
        return dao.countByCoursCode(code);
    }
    public List<HomeWork> findByTypeHomeWorkId(Long id){
        return dao.findByTypeHomeWorkId(id);
    }
    public int deleteByTypeHomeWorkId(Long id){
        return dao.deleteByTypeHomeWorkId(id);
    }
    public long countByTypeHomeWorkCode(String code){
        return dao.countByTypeHomeWorkCode(code);
    }

    public List<HomeWork> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(HomeWork.class, HomeWorkSpecification.class);
    }


    @Autowired
    private HomeWorkEtudiantManagerService homeWorkEtudiantService ;
    @Autowired
    private HomeWorkQuestionManagerService homeWorkQuestionService ;
    @Autowired
    private TypeHomeWorkManagerService typeHomeWorkService ;
    @Autowired
    private CoursManagerService coursService ;

    public HomeWorkManagerServiceImpl(HomeWorkDao dao) {
        super(dao);
    }

}