package ma.zs.zyn.service.facade.admin.inscriptionref;

import java.util.List;
import ma.zs.zyn.bean.core.inscriptionref.InviteStudent;
import ma.zs.zyn.dao.criteria.core.inscriptionref.InviteStudentCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface InviteStudentAdminService extends  IService<InviteStudent,InviteStudentCriteria>  {

    List<InviteStudent> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantRef(String ref);




}
