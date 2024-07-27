package ma.zs.alc.service.facade.manager.prof;

import java.util.List;
import ma.zs.alc.bean.core.prof.TrancheHoraireProf;
import ma.zs.alc.dao.criteria.core.prof.TrancheHoraireProfCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface TrancheHoraireProfManagerService extends  IService<TrancheHoraireProf,TrancheHoraireProfCriteria>  {

    List<TrancheHoraireProf> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);




}
