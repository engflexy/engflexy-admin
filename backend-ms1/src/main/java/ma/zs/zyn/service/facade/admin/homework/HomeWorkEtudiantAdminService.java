package ma.zs.zyn.service.facade.admin.homework;

import java.util.List;
import ma.zs.zyn.bean.core.homework.HomeWorkEtudiant;
import ma.zs.zyn.dao.criteria.core.homework.HomeWorkEtudiantCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface HomeWorkEtudiantAdminService extends  IService<HomeWorkEtudiant,HomeWorkEtudiantCriteria>  {

    List<HomeWorkEtudiant> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantRef(String ref);
    List<HomeWorkEtudiant> findByHomeWorkId(Long id);
    int deleteByHomeWorkId(Long id);
    long countByHomeWorkId(Long id);




}
