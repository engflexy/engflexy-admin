package ma.zs.alc.dao.facade.core.courseref;

import org.springframework.data.jpa.repository.Query;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import ma.zs.alc.bean.core.courseref.ContentType;
import org.springframework.stereotype.Repository;
import ma.zs.alc.bean.core.courseref.ContentType;
import java.util.List;


@Repository
public interface ContentTypeDao extends AbstractRepository<ContentType,Long>  {
    ContentType findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW ContentType(item.id,item.libelle) FROM ContentType item")
    List<ContentType> findAllOptimized();

}
