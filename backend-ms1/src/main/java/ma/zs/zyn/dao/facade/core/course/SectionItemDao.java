package ma.zs.zyn.dao.facade.core.course;

import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.course.SectionItem;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface SectionItemDao extends AbstractRepository<SectionItem,Long>  {

    List<SectionItem> findBySectionId(Long id);
    int deleteBySectionId(Long id);
    long countBySectionCode(String code);


}
