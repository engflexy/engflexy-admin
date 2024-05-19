package ma.zs.alc.service.impl.collaborator.inscriptionref;


import ma.zs.alc.bean.core.inscriptionref.ConfirmationToken;
import ma.zs.alc.dao.criteria.core.inscriptionref.ConfirmationTokenCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.ConfirmationTokenDao;
import ma.zs.alc.dao.specification.core.inscriptionref.ConfirmationTokenSpecification;
import ma.zs.alc.service.facade.collaborator.inscriptionref.ConfirmationTokenCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.inscription.EtudiantCollaboratorService ;
import ma.zs.alc.bean.core.inscription.Etudiant ;

import java.util.List;
@Service
public class ConfirmationTokenCollaboratorServiceImpl extends AbstractServiceImpl<ConfirmationToken, ConfirmationTokenCriteria, ConfirmationTokenDao> implements ConfirmationTokenCollaboratorService {






    public void findOrSaveAssociatedObject(ConfirmationToken t){
        if( t != null) {
            t.setEtudiant(etudiantService.findOrSave(t.getEtudiant()));
        }
    }

    public List<ConfirmationToken> findByEtudiantId(Long id){
        return dao.findByEtudiantId(id);
    }
    public int deleteByEtudiantId(Long id){
        return dao.deleteByEtudiantId(id);
    }
    public long countByEtudiantId(Long id){
        return dao.countByEtudiantId(id);
    }






    public void configure() {
        super.configure(ConfirmationToken.class, ConfirmationTokenSpecification.class);
    }


    @Autowired
    private EtudiantCollaboratorService etudiantService ;

    public ConfirmationTokenCollaboratorServiceImpl(ConfirmationTokenDao dao) {
        super(dao);
    }

}
