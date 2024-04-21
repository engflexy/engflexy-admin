package ma.zs.zyn.dao.facade.core.inscriptionref;

import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.inscriptionref.EtudiantClassRoom;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface EtudiantClassRoomDao extends AbstractRepository<EtudiantClassRoom,Long>  {

    List<EtudiantClassRoom> findByClassRoomId(Long id);
    int deleteByClassRoomId(Long id);
    long countByClassRoomLibelle(String libelle);
    List<EtudiantClassRoom> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantRef(String ref);


}
