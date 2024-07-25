package ma.zs.alc.service.impl.manager.pack;


import ma.zs.alc.bean.core.pack.PackStudent;
import ma.zs.alc.dao.criteria.core.pack.PackStudentCriteria;
import ma.zs.alc.dao.facade.core.pack.PackStudentDao;
import ma.zs.alc.dao.specification.core.pack.PackStudentSpecification;
import ma.zs.alc.service.facade.manager.course.ParcoursManagerService;
import ma.zs.alc.service.facade.manager.pack.PackStudentManagerService;
import ma.zs.alc.service.facade.manager.price.PriceManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PackStudentManagerServiceImpl extends AbstractServiceImpl<PackStudent, PackStudentCriteria, PackStudentDao> implements PackStudentManagerService {


    public PackStudent findByReferenceEntity(PackStudent t) {
        return t == null ? null : dao.findByCode(t.getCode());
    }

    public void findOrSaveAssociatedObject(PackStudent t) {
        if (t != null) {
            t.setLevel(parcoursService.findOrSave(t.getLevel()));
            t.setPrice(priceService.findOrSave(t.getPrice()));
        }
    }

    public List<PackStudent> findByParcoursId(Long id) {
        return dao.findByLevelId(id);
    }

    public int deleteByParcoursId(Long id) {
        return dao.deleteByLevelId(id);
    }

    public long countByParcoursCode(String code) {
        return dao.countByLevelCode(code);
    }

    public List<PackStudent> findByPriceId(Long id) {
        return dao.findByPriceId(id);
    }

    public int deleteByPriceId(Long id) {
        return dao.deleteByPriceId(id);
    }

    public long countByPriceId(Long id) {
        return dao.countByPriceId(id);
    }

    public List<PackStudent> findAllOptimized() {
        return dao.findAllOptimized();
    }


    public void configure() {
        super.configure(PackStudent.class, PackStudentSpecification.class);
    }


    @Autowired
    private ParcoursManagerService parcoursService;
    @Autowired
    private PriceManagerService priceService;

    public PackStudentManagerServiceImpl(PackStudentDao dao) {
        super(dao);
    }

}
