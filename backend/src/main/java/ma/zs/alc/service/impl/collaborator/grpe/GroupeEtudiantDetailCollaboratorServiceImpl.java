package ma.zs.alc.service.impl.collaborator.grpe;


import ma.zs.alc.bean.core.grpe.GroupeEtudiantDetail;
import ma.zs.alc.dao.criteria.core.grpe.GroupeEtudiantDetailCriteria;
import ma.zs.alc.dao.facade.core.grpe.GroupeEtudiantDetailDao;
import ma.zs.alc.dao.specification.core.grpe.GroupeEtudiantDetailSpecification;
import ma.zs.alc.service.facade.collaborator.grpe.GroupeEtudiantCollaboratorService;
import ma.zs.alc.service.facade.collaborator.grpe.GroupeEtudiantDetailCollaboratorService;
import ma.zs.alc.service.facade.collaborator.inscription.EtudiantCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GroupeEtudiantDetailCollaboratorServiceImpl extends AbstractServiceImpl<GroupeEtudiantDetail, GroupeEtudiantDetailCriteria, GroupeEtudiantDetailDao> implements GroupeEtudiantDetailCollaboratorService {


    public void findOrSaveAssociatedObject(GroupeEtudiantDetail t) {
        if (t != null) {
            t.setGroupeEtudiant(groupeEtudiantService.findOrSave(t.getGroupeEtudiant()));
            t.setEtudiant(etudiantService.findOrSave(t.getEtudiant()));
        }
    }

    public List<GroupeEtudiantDetail> findByGroupeEtudiantId(Long id) {
        return dao.findByGroupeEtudiantId(id);
    }

    public int deleteByGroupeEtudiantId(Long id) {
        return dao.deleteByGroupeEtudiantId(id);
    }

    public long countByGroupeEtudiantId(Long id) {
        return dao.countByGroupeEtudiantId(id);
    }

    public List<GroupeEtudiantDetail> findByEtudiantId(Long id) {
        return dao.findByEtudiantId(id);
    }

    public int deleteByEtudiantId(Long id) {
        return dao.deleteByEtudiantId(id);
    }

    public long countByEtudiantId(Long id) {
        return dao.countByEtudiantId(id);
    }


    public void configure() {
        super.configure(GroupeEtudiantDetail.class, GroupeEtudiantDetailSpecification.class);
    }


    @Autowired
    private EtudiantCollaboratorService etudiantService;
    @Autowired
    private GroupeEtudiantCollaboratorService groupeEtudiantService;

    public GroupeEtudiantDetailCollaboratorServiceImpl(GroupeEtudiantDetailDao dao) {
        super(dao);
    }

}
