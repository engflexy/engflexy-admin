package ma.zs.zyn.dao.facade.core.homework;

import org.springframework.data.jpa.repository.Query;
import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.homework.TypeHomeWork;
import org.springframework.stereotype.Repository;
import ma.zs.zyn.bean.core.homework.TypeHomeWork;
import java.util.List;


@Repository
public interface TypeHomeWorkDao extends AbstractRepository<TypeHomeWork,Long>  {
    TypeHomeWork findByCode(String code);
    int deleteByCode(String code);


    @Query("SELECT NEW TypeHomeWork(item.id,item.lib) FROM TypeHomeWork item")
    List<TypeHomeWork> findAllOptimized();

}
