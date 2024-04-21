package ma.zs.zyn.service.facade.admin.alc;

import java.util.List;
import ma.zs.zyn.bean.core.alc.Admin;
import ma.zs.zyn.dao.criteria.core.alc.AdminCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface AdminAdminService extends  IService<Admin,AdminCriteria>  {
    Admin findByUsername(String username);
    boolean changePassword(String username, String newPassword);





}
