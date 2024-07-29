package ma.zs.alc.service.impl.manager.homework;


import ma.zs.alc.bean.core.homework.HoweWorkQSTReponse;
import ma.zs.alc.dao.criteria.core.homework.HoweWorkQSTReponseCriteria;
import ma.zs.alc.dao.facade.core.homework.HoweWorkQSTReponseDao;
import ma.zs.alc.dao.specification.core.homework.HoweWorkQSTReponseSpecification;
import ma.zs.alc.service.facade.manager.homework.HoweWorkQSTReponseManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.manager.homework.HomeWorkQuestionManagerService ;

@Service
public class HoweWorkQSTReponseManagerServiceImpl extends AbstractServiceImpl<HoweWorkQSTReponse, HoweWorkQSTReponseCriteria, HoweWorkQSTReponseDao> implements HoweWorkQSTReponseManagerService {







    public HoweWorkQSTReponse findByReferenceEntity(HoweWorkQSTReponse t){
        return t==null? null : dao.findByRef(t.getRef());
    }
    public void findOrSaveAssociatedObject(HoweWorkQSTReponse t){
        if( t != null) {
            t.setHomeWorkQuestion(homeWorkQuestionService.findOrSave(t.getHomeWorkQuestion()));
        }
    }

    public List<HoweWorkQSTReponse> findByHomeWorkQuestionId(Long id){
        return dao.findByHomeWorkQuestionId(id);
    }
    public int deleteByHomeWorkQuestionId(Long id){
        return dao.deleteByHomeWorkQuestionId(id);
    }
    public long countByHomeWorkQuestionRef(String ref){
        return dao.countByHomeWorkQuestionRef(ref);
    }

    public List<HoweWorkQSTReponse> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(HoweWorkQSTReponse.class, HoweWorkQSTReponseSpecification.class);
    }


    @Autowired
    private HomeWorkQuestionManagerService homeWorkQuestionService ;

    public HoweWorkQSTReponseManagerServiceImpl(HoweWorkQSTReponseDao dao) {
        super(dao);
    }

}
