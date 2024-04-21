package ma.zs.zyn.service.facade.admin.grpe;

import java.util.List;
import ma.zs.zyn.bean.core.grpe.GroupeEtudiantDetail;
import ma.zs.zyn.dao.criteria.core.grpe.GroupeEtudiantDetailCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface GroupeEtudiantDetailAdminService extends  IService<GroupeEtudiantDetail,GroupeEtudiantDetailCriteria>  {

    List<GroupeEtudiantDetail> findByGroupeEtudiantId(Long id);
    int deleteByGroupeEtudiantId(Long id);
    long countByGroupeEtudiantId(Long id);
    List<GroupeEtudiantDetail> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantRef(String ref);




}
