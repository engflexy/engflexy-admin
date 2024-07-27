package ma.zs.alc.service.impl.manager.grpe;


import ma.zs.alc.bean.core.grpe.GroupeEtudiantDetail;
import ma.zs.alc.dao.criteria.core.grpe.GroupeEtudiantDetailCriteria;
import ma.zs.alc.dao.facade.core.grpe.GroupeEtudiantDetailDao;
import ma.zs.alc.dao.specification.core.grpe.GroupeEtudiantDetailSpecification;
import ma.zs.alc.service.facade.manager.grpe.GroupeEtudiantDetailManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.manager.inscription.EtudiantManagerService ;
import ma.zs.alc.service.facade.manager.grpe.GroupeEtudiantManagerService ;

@Service
public class GroupeEtudiantDetailManagerServiceImpl extends AbstractServiceImpl<GroupeEtudiantDetail, GroupeEtudiantDetailCriteria, GroupeEtudiantDetailDao> implements GroupeEtudiantDetailManagerService {







    public void findOrSaveAssociatedObject(GroupeEtudiantDetail t){
        if( t != null) {
            t.setGroupeEtudiant(groupeEtudiantService.findOrSave(t.getGroupeEtudiant()));
            t.setEtudiant(etudiantService.findOrSave(t.getEtudiant()));
        }
    }

    public List<GroupeEtudiantDetail> findByGroupeEtudiantId(Long id){
        return dao.findByGroupeEtudiantId(id);
    }
    public int deleteByGroupeEtudiantId(Long id){
        return dao.deleteByGroupeEtudiantId(id);
    }
    public long countByGroupeEtudiantId(Long id){
        return dao.countByGroupeEtudiantId(id);
    }
    public List<GroupeEtudiantDetail> findByEtudiantId(Long id){
        return dao.findByEtudiantId(id);
    }
    public int deleteByEtudiantId(Long id){
        return dao.deleteByEtudiantId(id);
    }
    public long countByEtudiantId(Long id){
        return dao.countByEtudiantId(id);
    }






    public void configure() {
        super.configure(GroupeEtudiantDetail.class, GroupeEtudiantDetailSpecification.class);
    }


    @Autowired
    private EtudiantManagerService etudiantService ;
    @Autowired
    private GroupeEtudiantManagerService groupeEtudiantService ;

    public GroupeEtudiantDetailManagerServiceImpl(GroupeEtudiantDetailDao dao) {
        super(dao);
    }

}
