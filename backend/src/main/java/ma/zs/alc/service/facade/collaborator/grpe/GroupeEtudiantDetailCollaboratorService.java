package ma.zs.alc.service.facade.collaborator.grpe;

import java.util.List;
import ma.zs.alc.bean.core.grpe.GroupeEtudiantDetail;
import ma.zs.alc.dao.criteria.core.grpe.GroupeEtudiantDetailCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface GroupeEtudiantDetailCollaboratorService extends  IService<GroupeEtudiantDetail,GroupeEtudiantDetailCriteria>  {

    List<GroupeEtudiantDetail> findByGroupeEtudiantId(Long id);
    int deleteByGroupeEtudiantId(Long id);
    long countByGroupeEtudiantId(Long id);
    List<GroupeEtudiantDetail> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantId(Long id);




}
