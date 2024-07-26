package ma.zs.alc.service.impl.manager.common;


import ma.zs.alc.bean.core.common.Contact;
import ma.zs.alc.dao.criteria.core.common.ContactCriteria;
import ma.zs.alc.dao.facade.core.common.ContactDao;
import ma.zs.alc.dao.specification.core.common.ContactSpecification;
import ma.zs.alc.service.facade.manager.common.ContactManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.manager.collab.CollaboratorManagerService ;
import ma.zs.alc.bean.core.collab.Collaborator ;

@Service
public class ContactManagerServiceImpl extends AbstractServiceImpl<Contact, ContactCriteria, ContactDao> implements ContactManagerService {







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
    private CollaboratorManagerService collaboratorService ;

    public ContactManagerServiceImpl(ContactDao dao) {
        super(dao);
    }

}