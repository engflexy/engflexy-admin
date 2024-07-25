package ma.zs.alc.service.facade.manager.collab;

import ma.zs.alc.bean.core.collab.Collaborator;
import ma.zs.alc.dao.criteria.core.collab.CollaboratorCriteria;
import ma.zs.alc.zynerator.service.IService;


public interface CollaboratorManagerService extends IService<Collaborator, CollaboratorCriteria> {
    Collaborator findByUsername(String username);

    boolean changePassword(String username, String newPassword);
}
