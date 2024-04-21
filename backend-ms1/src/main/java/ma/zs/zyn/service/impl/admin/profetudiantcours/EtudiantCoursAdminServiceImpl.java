package ma.zs.zyn.service.impl.admin.profetudiantcours;


import ma.zs.zyn.bean.core.profetudiantcours.EtudiantCours;
import ma.zs.zyn.dao.criteria.core.profetudiantcours.EtudiantCoursCriteria;
import ma.zs.zyn.dao.facade.core.profetudiantcours.EtudiantCoursDao;
import ma.zs.zyn.dao.specification.core.profetudiantcours.EtudiantCoursSpecification;
import ma.zs.zyn.service.facade.admin.profetudiantcours.EtudiantCoursAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.zyn.service.facade.admin.inscription.EtudiantAdminService ;
import ma.zs.zyn.bean.core.inscription.Etudiant ;
import ma.zs.zyn.service.facade.admin.course.CoursAdminService ;
import ma.zs.zyn.bean.core.course.Cours ;
import ma.zs.zyn.service.facade.admin.prof.ProfAdminService ;
import ma.zs.zyn.bean.core.prof.Prof ;

import java.util.List;
@Service
public class EtudiantCoursAdminServiceImpl extends AbstractServiceImpl<EtudiantCours, EtudiantCoursCriteria, EtudiantCoursDao> implements EtudiantCoursAdminService {






    public void findOrSaveAssociatedObject(EtudiantCours t){
        if( t != null) {
            t.setEtudiant(etudiantService.findOrSave(t.getEtudiant()));
            t.setProf(profService.findOrSave(t.getProf()));
            t.setCours(coursService.findOrSave(t.getCours()));
        }
    }

    public List<EtudiantCours> findByEtudiantId(Long id){
        return dao.findByEtudiantId(id);
    }
    public int deleteByEtudiantId(Long id){
        return dao.deleteByEtudiantId(id);
    }
    public long countByEtudiantRef(String ref){
        return dao.countByEtudiantRef(ref);
    }
    public List<EtudiantCours> findByProfId(Long id){
        return dao.findByProfId(id);
    }
    public int deleteByProfId(Long id){
        return dao.deleteByProfId(id);
    }
    public long countByProfRef(String ref){
        return dao.countByProfRef(ref);
    }
    public List<EtudiantCours> findByCoursId(Long id){
        return dao.findByCoursId(id);
    }
    public int deleteByCoursId(Long id){
        return dao.deleteByCoursId(id);
    }
    public long countByCoursCode(String code){
        return dao.countByCoursCode(code);
    }






    public void configure() {
        super.configure(EtudiantCours.class, EtudiantCoursSpecification.class);
    }


    @Autowired
    private EtudiantAdminService etudiantService ;
    @Autowired
    private CoursAdminService coursService ;
    @Autowired
    private ProfAdminService profService ;

    public EtudiantCoursAdminServiceImpl(EtudiantCoursDao dao) {
        super(dao);
    }

}
