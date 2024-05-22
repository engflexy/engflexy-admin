package ma.zs.alc.dao.facade.core.course;

import org.springframework.data.jpa.repository.Query;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import ma.zs.alc.bean.core.course.Section;
import org.springframework.stereotype.Repository;
import ma.zs.alc.bean.core.course.Section;
import java.util.List;


@Repository
public interface SectionDao extends AbstractRepository<Section,Long>  {
    Section findByCode(String code);
    int deleteByCode(String code);

    List<Section> findByCoursId(Long id);
    int deleteByCoursId(Long id);
    long countByCoursCode(String code);

    @Query("SELECT NEW Section(item.id,item.libelle) FROM Section item")
    List<Section> findAllOptimized();

}