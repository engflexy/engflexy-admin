package ma.zs.zyn.service.facade.admin.profetudiantcours;

import java.util.List;
import ma.zs.zyn.bean.core.profetudiantcours.EtudiantCours;
import ma.zs.zyn.dao.criteria.core.profetudiantcours.EtudiantCoursCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface EtudiantCoursAdminService extends  IService<EtudiantCours,EtudiantCoursCriteria>  {

    List<EtudiantCours> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantRef(String ref);
    List<EtudiantCours> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);
    List<EtudiantCours> findByCoursId(Long id);
    int deleteByCoursId(Long id);
    long countByCoursCode(String code);




}
