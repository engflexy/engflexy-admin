package ma.zs.zyn.dao.facade.core.courseref;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.courseref.SuperCategorieSection;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.courseref.SuperCategorieSection;
import java.util.List;


@Repository
public interface SuperCategorieSectionDao extends AbstractRepository<SuperCategorieSection,Long>  {
    SuperCategorieSection findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW SuperCategorieSection(item.id,item.libelle) FROM SuperCategorieSection item")
    List<SuperCategorieSection> findAllOptimized();

}
