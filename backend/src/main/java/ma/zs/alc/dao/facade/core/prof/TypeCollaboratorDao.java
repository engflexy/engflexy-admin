package ma.zs.alc.dao.facade.core.prof;

import org.springframework.data.jpa.repository.Query;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import ma.zs.alc.bean.core.common.TypeCollaborator;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface TypeCollaboratorDao extends AbstractRepository<TypeCollaborator,Long>  {
    TypeCollaborator findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW TypeCollaborator(item.id,item.libelle) FROM TypeCollaborator item")
    List<TypeCollaborator> findAllOptimized();

}
