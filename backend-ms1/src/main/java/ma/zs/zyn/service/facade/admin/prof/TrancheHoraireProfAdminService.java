package ma.zs.zyn.service.facade.admin.prof;

import java.util.List;
import ma.zs.zyn.bean.core.prof.TrancheHoraireProf;
import ma.zs.zyn.dao.criteria.core.prof.TrancheHoraireProfCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface TrancheHoraireProfAdminService extends  IService<TrancheHoraireProf,TrancheHoraireProfCriteria>  {

    List<TrancheHoraireProf> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);




}
