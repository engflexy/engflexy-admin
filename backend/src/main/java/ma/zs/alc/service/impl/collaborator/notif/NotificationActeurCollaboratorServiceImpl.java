package ma.zs.alc.service.impl.collaborator.notif;




import ma.zs.alc.bean.core.notif.NotificationActeur;
import ma.zs.alc.dao.criteria.core.notif.NotificationActeurCriteria;
import ma.zs.alc.dao.facade.core.notif.NotificationActeurDao;
import ma.zs.alc.dao.specification.core.notif.NotificationActeurSpecification;
import ma.zs.alc.service.facade.collaborator.notif.NotificationActeurCollaboratorService;
import ma.zs.alc.zynerator.exception.EntityNotFoundException;
import ma.zs.alc.zynerator.util.RefelexivityUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;


import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import static ma.zs.alc.zynerator.util.ListUtil.isEmpty;
import static ma.zs.alc.zynerator.util.ListUtil.isNotEmpty;

@Service
public class NotificationActeurCollaboratorServiceImpl implements NotificationActeurCollaboratorService {

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public NotificationActeur update(NotificationActeur t) {
        NotificationActeur loadedItem = dao.findById(t.getId()).orElse(null);
        if (loadedItem == null) {
            throw new EntityNotFoundException("errors.notFound", new String[]{NotificationActeur.class.getSimpleName(), t.getId().toString()});
        } else {
            dao.save(t);
            return loadedItem;
        }
    }

    public NotificationActeur findById(Long id) {
        return dao.findById(id).orElse(null);
    }


    public NotificationActeur findOrSave(NotificationActeur t) {
        if (t != null) {
            NotificationActeur result = findByReferenceEntity(t);
            if (result == null) {
                return dao.save(t);
            } else {
                return result;
            }
        }
        return null;
    }

    public List<NotificationActeur> findAll() {
        return dao.findAll();
    }
   /* @Override
    public List<NotificationActeur> findByConnectedUser() {
        // Get the currently authenticated user
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !(authentication.getPrincipal() instanceof User)) {
            throw new RuntimeException("No authenticated user found.");
        }

        // Get the connected user
        User connectedUser = (User) authentication.getPrincipal();

        // Fetch notifications for the connected user
        return dao.findByUser(connectedUser); // Adjust this line if you store username directly
    }*/
    public List<NotificationActeur> findByUserUsername(String username) {

        /*String username="samantha@gmail.com";*/
        return dao.findByUserUsername(username);
    }
    public List<NotificationActeur> findByCriteria(NotificationActeurCriteria criteria) {
        List<NotificationActeur> content = null;
        if (criteria != null) {
            NotificationActeurSpecification mySpecification = constructSpecification(criteria);
            if (criteria.isPeagable()) {
                Pageable pageable = PageRequest.of(0, criteria.getMaxResults());
                content = dao.findAll(mySpecification, pageable).getContent();
            } else {
                content = dao.findAll(mySpecification);
            }
        } else {
            content = dao.findAll();
        }
        return content;

    }


    private NotificationActeurSpecification constructSpecification(NotificationActeurCriteria criteria) {
        NotificationActeurSpecification mySpecification =  (NotificationActeurSpecification) RefelexivityUtil.constructObjectUsingOneParam(NotificationActeurSpecification.class, criteria);
        return mySpecification;
    }

    public List<NotificationActeur> findPaginatedByCriteria(NotificationActeurCriteria criteria, int page, int pageSize, String order, String sortField) {
        NotificationActeurSpecification mySpecification = constructSpecification(criteria);
        order = (order != null && !order.isEmpty()) ? order : "desc";
        sortField = (sortField != null && !sortField.isEmpty()) ? sortField : "id";
        Pageable pageable = PageRequest.of(page, pageSize, Sort.Direction.fromString(order), sortField);
        return dao.findAll(mySpecification, pageable).getContent();
    }

    public int getDataSize(NotificationActeurCriteria criteria) {
        NotificationActeurSpecification mySpecification = constructSpecification(criteria);
        mySpecification.setDistinct(true);
        return ((Long) dao.count(mySpecification)).intValue();
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
	public boolean deleteById(Long id) {
        boolean condition = (id != null);
        if (condition) {
            dao.deleteById(id);
        }
        return condition;
    }




    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public List<NotificationActeur> delete(List<NotificationActeur> list) {
		List<NotificationActeur> result = new ArrayList();
        if (list != null) {
            for (NotificationActeur t : list) {
                if(dao.findById(t.getId()).isEmpty()){
					result.add(t);
				}
            }
        }
		return result;
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public NotificationActeur create(NotificationActeur t) {
        NotificationActeur loaded = findByReferenceEntity(t);
        NotificationActeur saved;
        if (loaded == null) {
            saved = dao.save(t);
        }else {
            saved = null;
        }
        return saved;
    }

    public NotificationActeur findWithAssociatedLists(Long id){
        NotificationActeur result = dao.findById(id).orElse(null);
        return result;
    }

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public List<NotificationActeur> update(List<NotificationActeur> ts, boolean createIfNotExist) {
        List<NotificationActeur> result = new ArrayList<>();
        if (ts != null) {
            for (NotificationActeur t : ts) {
                if (t.getId() == null) {
                    dao.save(t);
                } else {
                    NotificationActeur loadedItem = dao.findById(t.getId()).orElse(null);
                    if (isEligibleForCreateOrUpdate(createIfNotExist, t, loadedItem)) {
                        dao.save(t);
                    } else {
                        result.add(t);
                    }
                }
            }
        }
        return result;
    }


    private boolean isEligibleForCreateOrUpdate(boolean createIfNotExist, NotificationActeur t, NotificationActeur loadedItem) {
        boolean eligibleForCreateCrud = t.getId() == null;
        boolean eligibleForCreate = (createIfNotExist && (t.getId() == null || loadedItem == null));
        boolean eligibleForUpdate = (t.getId() != null && loadedItem != null);
        return (eligibleForCreateCrud || eligibleForCreate || eligibleForUpdate);
    }









    public NotificationActeur findByReferenceEntity(NotificationActeur t){
        return t==null? null : dao.findByIcon(t.getIcon());
    }



    public List<NotificationActeur> findAllOptimized() {
        return dao.findAllOptimized();
    }

    @Override
    public List<List<NotificationActeur>> getToBeSavedAndToBeDeleted(List<NotificationActeur> oldList, List<NotificationActeur> newList) {
        List<List<NotificationActeur>> result = new ArrayList<>();
        List<NotificationActeur> resultDelete = new ArrayList<>();
        List<NotificationActeur> resultUpdateOrSave = new ArrayList<>();
        if (isEmpty(oldList) && isNotEmpty(newList)) {
            resultUpdateOrSave.addAll(newList);
        } else if (isEmpty(newList) && isNotEmpty(oldList)) {
            resultDelete.addAll(oldList);
        } else if (isNotEmpty(newList) && isNotEmpty(oldList)) {
			extractToBeSaveOrDelete(oldList, newList, resultUpdateOrSave, resultDelete);
        }
        result.add(resultUpdateOrSave);
        result.add(resultDelete);
        return result;
    }

    private void extractToBeSaveOrDelete(List<NotificationActeur> oldList, List<NotificationActeur> newList, List<NotificationActeur> resultUpdateOrSave, List<NotificationActeur> resultDelete) {
		for (int i = 0; i < oldList.size(); i++) {
                NotificationActeur myOld = oldList.get(i);
                NotificationActeur t = newList.stream().filter(e -> myOld.equals(e)).findFirst().orElse(null);
                if (t != null) {
                    resultUpdateOrSave.add(t); // update
                } else {
                    resultDelete.add(myOld);
                }
            }
            for (int i = 0; i < newList.size(); i++) {
                NotificationActeur myNew = newList.get(i);
                NotificationActeur t = oldList.stream().filter(e -> myNew.equals(e)).findFirst().orElse(null);
                if (t == null) {
                    resultUpdateOrSave.add(myNew); // create
                }
            }
	}

    @Override
    public String uploadFile(String checksumOld, String tempUpladedFile, String destinationFilePath) throws Exception {
        return null;
    }








    public NotificationActeurCollaboratorServiceImpl(NotificationActeurDao dao) {
        this.dao = dao;
    }

    private NotificationActeurDao dao;
}
