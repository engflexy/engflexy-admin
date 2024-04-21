package ma.zs.zyn.dao.facade.core.alc;

import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.alc.Admin;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface AdminDao extends AbstractRepository<Admin,Long>  {

    Admin findByUsername(String username);


}
