package ma.zs.zyn.dao.facade.core.inscriptionref;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.inscriptionref.InteretEtudiant;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.inscriptionref.InteretEtudiant;
import java.util.List;


@Repository
public interface InteretEtudiantDao extends AbstractRepository<InteretEtudiant,Long>  {
    InteretEtudiant findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW InteretEtudiant(item.id,item.libelle) FROM InteretEtudiant item")
    List<InteretEtudiant> findAllOptimized();

}
