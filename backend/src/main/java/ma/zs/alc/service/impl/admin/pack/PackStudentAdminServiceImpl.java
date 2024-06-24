package ma.zs.alc.service.impl.admin.pack;


import ma.zs.alc.bean.core.pack.PackStudent;
import ma.zs.alc.dao.criteria.core.pack.PackStudentCriteria;
import ma.zs.alc.dao.facade.core.pack.PackStudentDao;
import ma.zs.alc.dao.specification.core.pack.PackStudentSpecification;
import ma.zs.alc.service.facade.admin.pack.PackStudentAdminService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.admin.course.ParcoursAdminService ;
import ma.zs.alc.service.facade.admin.price.PriceAdminService ;

@Service
public class PackStudentAdminServiceImpl extends AbstractServiceImpl<PackStudent, PackStudentCriteria, PackStudentDao> implements PackStudentAdminService {






    public PackStudent findByReferenceEntity(PackStudent t){
        return t.getId() == null ? null : dao.findById(t.getId()).orElse(null);
    }
    public void findOrSaveAssociatedObject(PackStudent t){
        if( t != null) {
            t.setLevel(parcoursService.findOrSave(t.getLevel()));
            t.setPrice(priceService.findOrSave(t.getPrice()));
        }
    }

    public List<PackStudent> findByParcoursId(Long id){
        return dao.findByLevelId(id);
    }
    public int deleteByParcoursId(Long id){
        return dao.deleteByLevelId(id);
    }
    public long countByParcoursCode(String code){
        return dao.countByLevelCode(code);
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
