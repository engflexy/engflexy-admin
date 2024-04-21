package ma.zs.zyn.dao.facade.core.inscriptionref;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.inscriptionref.ClassRoom;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.inscriptionref.ClassRoom;
import java.util.List;


@Repository
public interface ClassRoomDao extends AbstractRepository<ClassRoom,Long>  {
    ClassRoom findByLibelle(String libelle);
    int deleteByLibelle(String libelle);


    @Query("SELECT NEW ClassRoom(item.id,item.code) FROM ClassRoom item")
    List<ClassRoom> findAllOptimized();

}
