package ma.zs.zyn.dao.facade.core.courseref;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.courseref.Centre;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.courseref.Centre;
import java.util.List;


@Repository
public interface CentreDao extends AbstractRepository<Centre,Long>  {
    Centre findByRef(String ref);
    int deleteByRef(String ref);


    @Query("SELECT NEW Centre(item.id,item.ref) FROM Centre item")
    List<Centre> findAllOptimized();

}
