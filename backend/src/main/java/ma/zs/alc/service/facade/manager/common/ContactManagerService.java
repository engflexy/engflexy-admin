package ma.zs.alc.service.facade.manager.common;

import ma.zs.alc.bean.core.common.Contact;
import ma.zs.alc.dao.criteria.core.common.ContactCriteria;
import ma.zs.alc.zynerator.service.IService;

import java.util.List;



public interface ContactManagerService extends  IService<Contact,ContactCriteria>  {

    List<Contact> findByCollaboratorId(Long id);
    int deleteByCollaboratorId(Long id);
    long countByCollaboratorId(Long id);




}
