package ma.zs.zyn.service.impl.admin.homework;


import ma.zs.zyn.bean.core.homework.HoweWorkQSTReponse;
import ma.zs.zyn.dao.criteria.core.homework.HoweWorkQSTReponseCriteria;
import ma.zs.zyn.dao.facade.core.homework.HoweWorkQSTReponseDao;
import ma.zs.zyn.dao.specification.core.homework.HoweWorkQSTReponseSpecification;
import ma.zs.zyn.service.facade.admin.homework.HoweWorkQSTReponseAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.zyn.service.facade.admin.homework.HomeWorkQuestionAdminService ;
import ma.zs.zyn.bean.core.homework.HomeWorkQuestion ;

import java.util.List;
@Service
public class HoweWorkQSTReponseAdminServiceImpl extends AbstractServiceImpl<HoweWorkQSTReponse, HoweWorkQSTReponseCriteria, HoweWorkQSTReponseDao> implements HoweWorkQSTReponseAdminService {






    public HoweWorkQSTReponse findByReferenceEntity(HoweWorkQSTReponse t){
        return  dao.findByRef(t.getRef());
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
    private HomeWorkQuestionAdminService homeWorkQuestionService ;

    public HoweWorkQSTReponseAdminServiceImpl(HoweWorkQSTReponseDao dao) {
        super(dao);
    }

}
