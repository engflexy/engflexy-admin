package ma.zs.alc.service.impl.collaborator.pack;


import ma.zs.alc.bean.core.pack.PackStudent;
import ma.zs.alc.dao.criteria.core.pack.PackStudentCriteria;
import ma.zs.alc.dao.facade.core.pack.PackStudentDao;
import ma.zs.alc.dao.specification.core.pack.PackStudentSpecification;
import ma.zs.alc.service.facade.collaborator.pack.PackStudentCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.course.ParcoursCollaboratorService ;
import ma.zs.alc.bean.core.course.Parcours ;
import ma.zs.alc.service.facade.collaborator.price.PriceCollaboratorService ;
import ma.zs.alc.bean.core.price.Price ;

import java.util.List;
@Service
public class PackStudentCollaboratorServiceImpl extends AbstractServiceImpl<PackStudent, PackStudentCriteria, PackStudentDao> implements PackStudentCollaboratorService {






    public PackStudent findByReferenceEntity(PackStudent t){
        return t.getId() == null ? null : dao.findById(t.getId()).orElse(null);
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
    private ParcoursCollaboratorService parcoursService ;
    @Autowired
    private PriceCollaboratorService priceService ;

    public PackStudentCollaboratorServiceImpl(PackStudentDao dao) {
        super(dao);
    }

}
