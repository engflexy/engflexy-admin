package ma.zs.zyn.service.impl.admin.course;


import ma.zs.zyn.bean.core.course.Parcours;
import ma.zs.zyn.dao.criteria.core.course.ParcoursCriteria;
import ma.zs.zyn.dao.facade.core.course.ParcoursDao;
import ma.zs.zyn.dao.specification.core.course.ParcoursSpecification;
import ma.zs.zyn.service.facade.admin.course.ParcoursAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import ma.zs.zyn.service.facade.admin.inscription.EtudiantAdminService ;
import ma.zs.zyn.bean.core.inscription.Etudiant ;
import ma.zs.zyn.service.facade.admin.courseref.CentreAdminService ;
import ma.zs.zyn.bean.core.courseref.Centre ;
import ma.zs.zyn.service.facade.admin.course.CoursAdminService ;
import ma.zs.zyn.bean.core.course.Cours ;

import java.util.List;
@Service
public class ParcoursAdminServiceImpl extends AbstractServiceImpl<Parcours, ParcoursCriteria, ParcoursDao> implements ParcoursAdminService {


    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public Parcours create(Parcours t) {
        Parcours saved= super.create(t);
        if (saved != null && t.getCourss() != null) {
                t.getCourss().forEach(element-> {
                element.setParcours(saved);
                coursService.create(element);
            });
        }
        if (saved != null && t.getEtudiants() != null) {
                t.getEtudiants().forEach(element-> {
                element.setParcours(saved);
                etudiantService.create(element);
            });
        }
        return saved;

    }

    public Parcours findWithAssociatedLists(Long id){
        Parcours result = dao.findById(id).orElse(null);
        if(result!=null && result.getId() != null) {
            result.setCourss(coursService.findByParcoursId(id));
            result.setEtudiants(etudiantService.findByParcoursId(id));
        }
        return result;
    }
    @Transactional
    public void deleteAssociatedLists(Long id) {
        coursService.deleteByParcoursId(id);
        etudiantService.deleteByParcoursId(id);
    }


    public void updateWithAssociatedLists(Parcours parcours){
    if(parcours !=null && parcours.getId() != null){
            List<List<Cours>> resultCourss= coursService.getToBeSavedAndToBeDeleted(coursService.findByParcoursId(parcours.getId()),parcours.getCourss());
            coursService.delete(resultCourss.get(1));
            ListUtil.emptyIfNull(resultCourss.get(0)).forEach(e -> e.setParcours(parcours));
            coursService.update(resultCourss.get(0),true);
            List<List<Etudiant>> resultEtudiants= etudiantService.getToBeSavedAndToBeDeleted(etudiantService.findByParcoursId(parcours.getId()),parcours.getEtudiants());
            etudiantService.delete(resultEtudiants.get(1));
            ListUtil.emptyIfNull(resultEtudiants.get(0)).forEach(e -> e.setParcours(parcours));
            etudiantService.update(resultEtudiants.get(0),true);
        }
    }




    public Parcours findByReferenceEntity(Parcours t){
        return  dao.findByCode(t.getCode());
    }
    public void findOrSaveAssociatedObject(Parcours t){
        if( t != null) {
            t.setCentre(centreService.findOrSave(t.getCentre()));
        }
    }

    public List<Parcours> findByCentreId(Long id){
        return dao.findByCentreId(id);
    }
    public int deleteByCentreId(Long id){
        return dao.deleteByCentreId(id);
    }
    public long countByCentreRef(String ref){
        return dao.countByCentreRef(ref);
    }

    public List<Parcours> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Parcours.class, ParcoursSpecification.class);
    }


    @Autowired
    private EtudiantAdminService etudiantService ;
    @Autowired
    private CentreAdminService centreService ;
    @Autowired
    private CoursAdminService coursService ;

    public ParcoursAdminServiceImpl(ParcoursDao dao) {
        super(dao);
    }

}
