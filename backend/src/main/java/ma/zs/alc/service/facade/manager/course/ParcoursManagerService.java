package ma.zs.alc.service.facade.manager.course;

import ma.zs.alc.bean.core.course.Parcours;
import ma.zs.alc.dao.criteria.core.course.ParcoursCriteria;
import ma.zs.alc.zynerator.service.IService;

import java.util.List;



public interface ParcoursManagerService extends  IService<Parcours,ParcoursCriteria>  {

    List<Parcours> findByCollaboratorId(Long id);
    int deleteByCollaboratorId(Long id);
    long countByCollaboratorId(Long id);




}
