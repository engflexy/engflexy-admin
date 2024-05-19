package ma.zs.alc.service.impl.admin.common;


import ma.zs.alc.bean.core.common.Contact;
import ma.zs.alc.dao.criteria.core.common.ContactCriteria;
import ma.zs.alc.dao.facade.core.common.ContactDao;
import ma.zs.alc.dao.specification.core.common.ContactSpecification;
import ma.zs.alc.service.facade.admin.common.ContactAdminService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.admin.vocab.CollaboratorAdminService ;
import ma.zs.alc.bean.core.vocab.Collaborator ;

import java.util.List;
@Service
public class ContactAdminServiceImpl extends AbstractServiceImpl<Contact, ContactCriteria, ContactDao> implements ContactAdminService {






    public void findOrSaveAssociatedObject(Contact t){
        if( t != null) {
            t.setCollaborator(collaboratorService.findOrSave(t.getCollaborator()));
        }
    }

    public List<Contact> findByCollaboratorId(Long id){
        return dao.findByCollaboratorId(id);
    }
    public int deleteByCollaboratorId(Long id){
        return dao.deleteByCollaboratorId(id);
    }
    public long countByCollaboratorId(Long id){
        return dao.countByCollaboratorId(id);
    }






    public void configure() {
        super.configure(Contact.class, ContactSpecification.class);
    }


    @Autowired
    private CollaboratorAdminService collaboratorService ;

    public ContactAdminServiceImpl(ContactDao dao) {
        super(dao);
    }

}
