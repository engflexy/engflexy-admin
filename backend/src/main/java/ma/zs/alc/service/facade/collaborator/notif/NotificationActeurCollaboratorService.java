package ma.zs.alc.service.facade.collaborator.notif;

import ma.zs.alc.bean.core.notif.NotificationActeur;
import ma.zs.alc.dao.criteria.core.notif.NotificationActeurCriteria;
import ma.zs.alc.zynerator.security.bean.User;

import java.util.List;




public interface NotificationActeurCollaboratorService {







	NotificationActeur create(NotificationActeur t);

    NotificationActeur update(NotificationActeur t);

    List<NotificationActeur> update(List<NotificationActeur> ts,boolean createIfNotExist);

    NotificationActeur findById(Long id);

    NotificationActeur findOrSave(NotificationActeur t);

    NotificationActeur findByReferenceEntity(NotificationActeur t);

    NotificationActeur findWithAssociatedLists(Long id);

    List<NotificationActeur> findAllOptimized();

    List<NotificationActeur> findAll();
/*
    List<NotificationActeur> findByConnectedUser();
*/


    List<NotificationActeur> findByUserUsername(String username);

    List<NotificationActeur> findByCriteria(NotificationActeurCriteria criteria);

    List<NotificationActeur> findPaginatedByCriteria(NotificationActeurCriteria criteria, int page, int pageSize, String order, String sortField);

    int getDataSize(NotificationActeurCriteria criteria);

    List<NotificationActeur> delete(List<NotificationActeur> ts);

    boolean deleteById(Long id);

    List<List<NotificationActeur>> getToBeSavedAndToBeDeleted(List<NotificationActeur> oldList, List<NotificationActeur> newList);

    public String uploadFile(String checksumOld, String tempUpladedFile,String destinationFilePath) throws Exception ;

}
