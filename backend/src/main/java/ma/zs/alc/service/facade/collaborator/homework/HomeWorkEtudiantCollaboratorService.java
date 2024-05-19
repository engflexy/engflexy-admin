package ma.zs.alc.service.facade.collaborator.homework;

import java.util.List;
import ma.zs.alc.bean.core.homework.HomeWorkEtudiant;
import ma.zs.alc.dao.criteria.core.homework.HomeWorkEtudiantCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface HomeWorkEtudiantCollaboratorService extends  IService<HomeWorkEtudiant,HomeWorkEtudiantCriteria>  {

    List<HomeWorkEtudiant> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantId(Long id);
    List<HomeWorkEtudiant> findByHomeWorkId(Long id);
    int deleteByHomeWorkId(Long id);
    long countByHomeWorkId(Long id);




}
