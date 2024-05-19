package ma.zs.alc.service.facade.collaborator.prof;

import java.util.List;
import ma.zs.alc.bean.core.prof.TrancheHoraireProf;
import ma.zs.alc.dao.criteria.core.prof.TrancheHoraireProfCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface TrancheHoraireProfCollaboratorService extends  IService<TrancheHoraireProf,TrancheHoraireProfCriteria>  {

    List<TrancheHoraireProf> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);




}
