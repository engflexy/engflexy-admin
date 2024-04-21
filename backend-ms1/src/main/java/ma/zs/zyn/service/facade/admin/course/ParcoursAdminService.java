package ma.zs.zyn.service.facade.admin.course;

import java.util.List;
import ma.zs.zyn.bean.core.course.Parcours;
import ma.zs.zyn.dao.criteria.core.course.ParcoursCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface ParcoursAdminService extends  IService<Parcours,ParcoursCriteria>  {

    List<Parcours> findByCentreId(Long id);
    int deleteByCentreId(Long id);
    long countByCentreRef(String ref);




}
