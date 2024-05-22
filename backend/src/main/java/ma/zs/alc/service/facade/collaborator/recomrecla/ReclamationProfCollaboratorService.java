package ma.zs.alc.service.facade.collaborator.recomrecla;

import java.util.List;
import ma.zs.alc.bean.core.recomrecla.ReclamationProf;
import ma.zs.alc.dao.criteria.core.recomrecla.ReclamationProfCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface ReclamationProfCollaboratorService extends  IService<ReclamationProf,ReclamationProfCriteria>  {

    List<ReclamationProf> findByProfId(Long id);
    int deleteByProfId(Long id);
    long countByProfRef(String ref);
    List<ReclamationProf> findByTypeReclamationProfId(Long id);
    int deleteByTypeReclamationProfId(Long id);
    long countByTypeReclamationProfCode(String code);




}