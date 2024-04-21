package ma.zs.zyn.dao.facade.core.courseref;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.courseref.CategorieSection;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.courseref.CategorieSection;
import java.util.List;


@Repository
public interface CategorieSectionDao extends AbstractRepository<CategorieSection,Long>  {
    CategorieSection findByCode(String code);
    int deleteByCode(String code);

    List<CategorieSection> findBySuperCategorieSectionId(Long id);
    int deleteBySuperCategorieSectionId(Long id);
    long countBySuperCategorieSectionCode(String code);

    @Query("SELECT NEW CategorieSection(item.id,item.code) FROM CategorieSection item")
    List<CategorieSection> findAllOptimized();

}
