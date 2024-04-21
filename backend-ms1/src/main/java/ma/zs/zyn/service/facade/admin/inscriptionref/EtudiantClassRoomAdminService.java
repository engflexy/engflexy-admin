package ma.zs.zyn.service.facade.admin.inscriptionref;

import java.util.List;
import ma.zs.zyn.bean.core.inscriptionref.EtudiantClassRoom;
import ma.zs.zyn.dao.criteria.core.inscriptionref.EtudiantClassRoomCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface EtudiantClassRoomAdminService extends  IService<EtudiantClassRoom,EtudiantClassRoomCriteria>  {

    List<EtudiantClassRoom> findByClassRoomId(Long id);
    int deleteByClassRoomId(Long id);
    long countByClassRoomLibelle(String libelle);
    List<EtudiantClassRoom> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantRef(String ref);




}
