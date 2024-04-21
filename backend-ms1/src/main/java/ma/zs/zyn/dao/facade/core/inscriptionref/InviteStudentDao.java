package ma.zs.zyn.dao.facade.core.inscriptionref;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.inscriptionref.InviteStudent;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.inscriptionref.InviteStudent;
import java.util.List;


@Repository
public interface InviteStudentDao extends AbstractRepository<InviteStudent,Long>  {
    InviteStudent findByCode(String code);
    int deleteByCode(String code);

    List<InviteStudent> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantRef(String ref);

    @Query("SELECT NEW InviteStudent(item.id,item.code) FROM InviteStudent item")
    List<InviteStudent> findAllOptimized();

}
