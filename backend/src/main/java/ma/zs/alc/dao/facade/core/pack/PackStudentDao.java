package ma.zs.alc.dao.facade.core.pack;

import ma.zs.alc.bean.core.pack.PackStudent;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface PackStudentDao extends AbstractRepository<PackStudent, Long> {
    PackStudent findByCode(String code);

    int deleteByCode(String code);

    List<PackStudent> findByLevelId(Long id);

    int deleteByLevelId(Long id);

    long countByLevelCode(String code);

    List<PackStudent> findByPriceId(Long id);

    int deleteByPriceId(Long id);

    long countByPriceId(Long id);

    @Query("SELECT NEW PackStudent(item.id,item.libelle) FROM PackStudent item")
    List<PackStudent> findAllOptimized();

}
