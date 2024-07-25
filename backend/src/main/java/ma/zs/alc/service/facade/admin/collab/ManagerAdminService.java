package ma.zs.alc.service.facade.admin.collab;

import ma.zs.alc.bean.core.collab.Manager;
import ma.zs.alc.dao.criteria.core.collab.ManagerCriteria;
import ma.zs.alc.zynerator.service.IService;

import java.util.List;


public interface ManagerAdminService extends  IService<Manager,ManagerCriteria>  {
    Manager findByUsername(String username);
    boolean changePassword(String username, String newPassword);

    List<Manager> findByCollaboratorId(Long id);
    int deleteByCollaboratorId(Long id);
    long countByCollaboratorId(Long id);




}
