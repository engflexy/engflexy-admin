package ma.zs.alc.dao.facade.core.prof;

import ma.zs.alc.bean.core.prof.Prof;
import ma.zs.alc.dao.facade.core.inscription.UserPageable;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ProfDao extends AbstractRepository<Prof, Long> {
    Prof findByRef(String ref);

    int deleteByRef(String ref);

    List<Prof> findByParcoursId(Long id);

    int deleteByParcoursId(Long id);

    long countByParcoursCode(String code);

    List<Prof> findByCategorieProfId(Long id);

    int deleteByCategorieProfId(Long id);

    long countByCategorieProfCode(String code);

    List<Prof> findByTypeTeacherId(Long id);

    int deleteByTypeTeacherId(Long id);

    long countByTypeTeacherCode(String code);

    List<Prof> findByCollaboratorId(Long id);

    @Query("select new ma.zs.alc.dao.facade.core.inscription.UserPageable(prof) " +
            "from Prof prof where prof.collaborator.id=:id")
    Page<UserPageable> findByCollaboratorId(@Param("id") Long id, Pageable pageable);

    int deleteByCollaboratorId(Long id);

    long countByCollaboratorId(Long id);

    Prof findByUsername(String username);

    @Query("SELECT NEW Prof(item.id,item.ref) FROM Prof item")
    List<Prof> findAllOptimized();

}
