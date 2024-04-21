package ma.zs.zyn.dao.facade.core.inscription;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.inscription.Dictionary;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface DictionaryDao extends AbstractRepository<Dictionary,Long>  {

    List<Dictionary> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantRef(String ref);

    @Query("SELECT NEW Dictionary(item.id,item.word) FROM Dictionary item")
    List<Dictionary> findAllOptimized();

}
