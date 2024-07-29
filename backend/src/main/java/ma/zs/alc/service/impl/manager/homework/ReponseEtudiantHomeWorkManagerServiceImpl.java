package ma.zs.alc.service.impl.manager.homework;


import ma.zs.alc.bean.core.homework.ReponseEtudiantHomeWork;
import ma.zs.alc.dao.criteria.core.homework.ReponseEtudiantHomeWorkCriteria;
import ma.zs.alc.dao.facade.core.homework.ReponseEtudiantHomeWorkDao;
import ma.zs.alc.dao.specification.core.homework.ReponseEtudiantHomeWorkSpecification;
import ma.zs.alc.service.facade.manager.homework.HomeWorkEtudiantManagerService;
import ma.zs.alc.service.facade.manager.homework.HomeWorkQuestionManagerService;
import ma.zs.alc.service.facade.manager.homework.HoweWorkQSTReponseManagerService;
import ma.zs.alc.service.facade.manager.homework.ReponseEtudiantHomeWorkManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReponseEtudiantHomeWorkManagerServiceImpl extends AbstractServiceImpl<ReponseEtudiantHomeWork, ReponseEtudiantHomeWorkCriteria, ReponseEtudiantHomeWorkDao> implements ReponseEtudiantHomeWorkManagerService {







    public void findOrSaveAssociatedObject(ReponseEtudiantHomeWork t){
        if( t != null) {
            t.setHoweWorkQSTReponse(howeWorkQSTReponseService.findOrSave(t.getHoweWorkQSTReponse()));
            t.setHomeWorkEtudiant(homeWorkEtudiantService.findOrSave(t.getHomeWorkEtudiant()));
            t.setHomeWorkQuestion(homeWorkQuestionService.findOrSave(t.getHomeWorkQuestion()));
        }
    }

    public List<ReponseEtudiantHomeWork> findByHoweWorkQSTReponseId(Long id){
        return dao.findByHoweWorkQSTReponseId(id);
    }
    public int deleteByHoweWorkQSTReponseId(Long id){
        return dao.deleteByHoweWorkQSTReponseId(id);
    }
    public long countByHoweWorkQSTReponseRef(String ref){
        return dao.countByHoweWorkQSTReponseRef(ref);
    }
    public List<ReponseEtudiantHomeWork> findByHomeWorkEtudiantId(Long id){
        return dao.findByHomeWorkEtudiantId(id);
    }
    public int deleteByHomeWorkEtudiantId(Long id){
        return dao.deleteByHomeWorkEtudiantId(id);
    }
    public long countByHomeWorkEtudiantId(Long id){
        return dao.countByHomeWorkEtudiantId(id);
    }
    public List<ReponseEtudiantHomeWork> findByHomeWorkQuestionId(Long id){
        return dao.findByHomeWorkQuestionId(id);
    }
    public int deleteByHomeWorkQuestionId(Long id){
        return dao.deleteByHomeWorkQuestionId(id);
    }
    public long countByHomeWorkQuestionRef(String ref){
        return dao.countByHomeWorkQuestionRef(ref);
    }






    public void configure() {
        super.configure(ReponseEtudiantHomeWork.class, ReponseEtudiantHomeWorkSpecification.class);
    }


    @Autowired
    private HoweWorkQSTReponseManagerService howeWorkQSTReponseService ;
    @Autowired
    private HomeWorkEtudiantManagerService homeWorkEtudiantService ;
    @Autowired
    private HomeWorkQuestionManagerService homeWorkQuestionService ;

    public ReponseEtudiantHomeWorkManagerServiceImpl(ReponseEtudiantHomeWorkDao dao) {
        super(dao);
    }

}
