package ma.zs.zyn.service.impl.admin.common;


import ma.zs.zyn.bean.core.common.Contact;
import ma.zs.zyn.dao.criteria.core.common.ContactCriteria;
import ma.zs.zyn.dao.facade.core.common.ContactDao;
import ma.zs.zyn.dao.specification.core.common.ContactSpecification;
import ma.zs.zyn.service.facade.admin.common.ContactAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class ContactAdminServiceImpl extends AbstractServiceImpl<Contact, ContactCriteria, ContactDao> implements ContactAdminService {













    public void configure() {
        super.configure(Contact.class, ContactSpecification.class);
    }



    public ContactAdminServiceImpl(ContactDao dao) {
        super(dao);
    }

}
