package ma.zs.zyn.dao.facade.core.inscriptionref;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.inscriptionref.Skill;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.inscriptionref.Skill;
import java.util.List;


@Repository
public interface SkillDao extends AbstractRepository<Skill,Long>  {
    Skill findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW Skill(item.id,item.libelle) FROM Skill item")
    List<Skill> findAllOptimized();

}
