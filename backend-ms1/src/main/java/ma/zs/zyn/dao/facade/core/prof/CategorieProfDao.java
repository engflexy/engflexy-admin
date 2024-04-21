package ma.zs.zyn.dao.facade.core.prof;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.prof.CategorieProf;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.prof.CategorieProf;
import java.util.List;


@Repository
public interface CategorieProfDao extends AbstractRepository<CategorieProf,Long>  {
    CategorieProf findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW CategorieProf(item.id,item.code) FROM CategorieProf item")
    List<CategorieProf> findAllOptimized();

}
