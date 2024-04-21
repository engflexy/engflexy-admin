package ma.zs.zyn.dao.facade.core.common;

import ma.zs.zyn.zynerator.repository.AbstractRepository;
import ma.zs.zyn.bean.core.common.Contact;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface ContactDao extends AbstractRepository<Contact,Long>  {



}
