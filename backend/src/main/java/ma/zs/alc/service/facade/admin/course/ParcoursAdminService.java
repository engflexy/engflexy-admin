package ma.zs.alc.service.facade.admin.course;

import java.util.List;
import ma.zs.alc.bean.core.course.Parcours;
import ma.zs.alc.dao.criteria.core.course.ParcoursCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface ParcoursAdminService extends  IService<Parcours,ParcoursCriteria>  {

    List<Parcours> findByCollaboratorId(Long id);
    int deleteByCollaboratorId(Long id);
    long countByCollaboratorId(Long id);


    Parcours findByCode(String codeParcours);
}
