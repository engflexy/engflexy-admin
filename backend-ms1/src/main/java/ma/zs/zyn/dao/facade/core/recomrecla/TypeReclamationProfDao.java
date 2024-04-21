package ma.zs.zyn.dao.facade.core.recomrecla;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.recomrecla.TypeReclamationProf;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.recomrecla.TypeReclamationProf;
import java.util.List;


@Repository
public interface TypeReclamationProfDao extends AbstractRepository<TypeReclamationProf,Long>  {
    TypeReclamationProf findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW TypeReclamationProf(item.id,item.libelle) FROM TypeReclamationProf item")
    List<TypeReclamationProf> findAllOptimized();

}
