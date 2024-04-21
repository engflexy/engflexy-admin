package ma.zs.zyn.dao.facade.core.inscriptionref;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.inscriptionref.TeacherLocality;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.inscriptionref.TeacherLocality;
import java.util.List;


@Repository
public interface TeacherLocalityDao extends AbstractRepository<TeacherLocality,Long>  {
    TeacherLocality findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW TeacherLocality(item.id,item.libelle) FROM TeacherLocality item")
    List<TeacherLocality> findAllOptimized();

}
