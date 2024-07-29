package ma.zs.alc.service.impl.manager.inscriptionref;


import ma.zs.alc.bean.core.inscriptionref.ConfirmationToken;
import ma.zs.alc.dao.criteria.core.inscriptionref.ConfirmationTokenCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.ConfirmationTokenDao;
import ma.zs.alc.dao.specification.core.inscriptionref.ConfirmationTokenSpecification;
import ma.zs.alc.service.facade.manager.inscription.EtudiantManagerService;
import ma.zs.alc.service.facade.manager.inscriptionref.ConfirmationTokenManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConfirmationTokenManagerServiceImpl extends AbstractServiceImpl<ConfirmationToken, ConfirmationTokenCriteria, ConfirmationTokenDao> implements ConfirmationTokenManagerService {







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
    private EtudiantManagerService etudiantService ;

    public ConfirmationTokenManagerServiceImpl(ConfirmationTokenDao dao) {
        super(dao);
    }

}
