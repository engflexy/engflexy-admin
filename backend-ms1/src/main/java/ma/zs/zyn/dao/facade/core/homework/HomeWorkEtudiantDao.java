package ma.zs.zyn.dao.facade.core.homework;

import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.homework.HomeWorkEtudiant;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface HomeWorkEtudiantDao extends AbstractRepository<HomeWorkEtudiant,Long>  {

    List<HomeWorkEtudiant> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantRef(String ref);
    List<HomeWorkEtudiant> findByHomeWorkId(Long id);
    int deleteByHomeWorkId(Long id);
    long countByHomeWorkId(Long id);


}
