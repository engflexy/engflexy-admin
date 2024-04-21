package ma.zs.zyn.service.impl.admin.pack;


import ma.zs.zyn.bean.core.pack.PackStudent;
import ma.zs.zyn.dao.criteria.core.pack.PackStudentCriteria;
import ma.zs.zyn.dao.facade.core.pack.PackStudentDao;
import ma.zs.zyn.dao.specification.core.pack.PackStudentSpecification;
import ma.zs.zyn.service.facade.admin.pack.PackStudentAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.zyn.service.facade.admin.course.ParcoursAdminService ;
import ma.zs.zyn.bean.core.course.Parcours ;
import ma.zs.zyn.service.facade.admin.price.PriceAdminService ;
import ma.zs.zyn.bean.core.price.Price ;

import java.util.List;
@Service
public class PackStudentAdminServiceImpl extends AbstractServiceImpl<PackStudent, PackStudentCriteria, PackStudentDao> implements PackStudentAdminService {






    public PackStudent findByReferenceEntity(PackStudent t){
        return  dao.findByCode(t.getCode());
    }
    public void findOrSaveAssociatedObject(PackStudent t){
        if( t != null) {
            t.setParcours(parcoursService.findOrSave(t.getParcours()));
            t.setPrice(priceService.findOrSave(t.getPrice()));
        }
    }

    public List<PackStudent> findByParcoursId(Long id){
        return dao.findByParcoursId(id);
    }
    public int deleteByParcoursId(Long id){
        return dao.deleteByParcoursId(id);
    }
    public long countByParcoursCode(String code){
        return dao.countByParcoursCode(code);
    }
    public List<PackStudent> findByPriceId(Long id){
        return dao.findByPriceId(id);
    }
    public int deleteByPriceId(Long id){
        return dao.deleteByPriceId(id);
    }
    public long countByPriceId(Long id){
        return dao.countByPriceId(id);
    }

    public List<PackStudent> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(PackStudent.class, PackStudentSpecification.class);
    }


    @Autowired
    private ParcoursAdminService parcoursService ;
    @Autowired
    private PriceAdminService priceService ;

    public PackStudentAdminServiceImpl(PackStudentDao dao) {
        super(dao);
    }

}
