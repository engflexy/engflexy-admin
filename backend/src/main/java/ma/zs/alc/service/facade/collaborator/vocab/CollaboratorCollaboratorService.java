package ma.zs.alc.service.facade.collaborator.vocab;

import java.util.List;
import ma.zs.alc.bean.core.common.Collaborator;
import ma.zs.alc.dao.criteria.core.vocab.CollaboratorCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface CollaboratorCollaboratorService extends  IService<Collaborator,CollaboratorCriteria>  {
    Collaborator findByUsername(String username);
    boolean changePassword(String username, String newPassword);

    List<Collaborator> findByTypeCollaboratorId(Long id);
    int deleteByTypeCollaboratorId(Long id);
    long countByTypeCollaboratorCode(String code);




}
