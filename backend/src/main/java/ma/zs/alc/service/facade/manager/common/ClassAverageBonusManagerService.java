package ma.zs.alc.service.facade.manager.common;

import java.util.List;
import ma.zs.alc.bean.core.common.ClassAverageBonus;
import ma.zs.alc.dao.criteria.core.common.ClassAverageBonusCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface ClassAverageBonusManagerService extends  IService<ClassAverageBonus,ClassAverageBonusCriteria>  {

    List<ClassAverageBonus> findByCollaboratorId(Long id);
    int deleteByCollaboratorId(Long id);
    long countByCollaboratorId(Long id);




}
