package ma.zs.alc.service.impl.manager.collab;


import ma.zs.alc.bean.core.collab.PaiementInscriptionCollaborator;
import ma.zs.alc.dao.criteria.core.collab.PaiementInscriptionCollaboratorCriteria;
import ma.zs.alc.dao.facade.core.collab.PaiementInscriptionCollaboratorDao;
import ma.zs.alc.dao.specification.core.collab.PaiementInscriptionCollaboratorSpecification;
import ma.zs.alc.service.facade.manager.collab.InscriptionCollaboratorManagerService;
import ma.zs.alc.service.facade.manager.collab.PaiementInscriptionCollaboratorManagerService;
import ma.zs.alc.service.facade.manager.collab.PaiementInscriptionCollaboratorStateManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaiementInscriptionCollaboratorManagerServiceImpl extends AbstractServiceImpl<PaiementInscriptionCollaborator, PaiementInscriptionCollaboratorCriteria, PaiementInscriptionCollaboratorDao> implements PaiementInscriptionCollaboratorManagerService {







    public void findOrSaveAssociatedObject(PaiementInscriptionCollaborator t){
        if( t != null) {
            t.setInscriptionCollaborator(inscriptionCollaboratorService.findOrSave(t.getInscriptionCollaborator()));
            t.setPaiementInscriptionCollaboratorState(paiementInscriptionCollaboratorStateService.findOrSave(t.getPaiementInscriptionCollaboratorState()));
        }
    }

    public List<PaiementInscriptionCollaborator> findByInscriptionCollaboratorId(Long id){
        return dao.findByInscriptionCollaboratorId(id);
    }
    public int deleteByInscriptionCollaboratorId(Long id){
        return dao.deleteByInscriptionCollaboratorId(id);
    }
    public long countByInscriptionCollaboratorId(Long id){
        return dao.countByInscriptionCollaboratorId(id);
    }
    public List<PaiementInscriptionCollaborator> findByPaiementInscriptionCollaboratorStateCode(String code){
        return dao.findByPaiementInscriptionCollaboratorStateCode(code);
    }
    public int deleteByPaiementInscriptionCollaboratorStateCode(String code){
        return dao.deleteByPaiementInscriptionCollaboratorStateCode(code);
    }
    public long countByPaiementInscriptionCollaboratorStateCode(String code){
        return dao.countByPaiementInscriptionCollaboratorStateCode(code);
    }






    public void configure() {
        super.configure(PaiementInscriptionCollaborator.class, PaiementInscriptionCollaboratorSpecification.class);
    }


    @Autowired
    private PaiementInscriptionCollaboratorStateManagerService paiementInscriptionCollaboratorStateService ;
    @Autowired
    private InscriptionCollaboratorManagerService inscriptionCollaboratorService ;

    public PaiementInscriptionCollaboratorManagerServiceImpl(PaiementInscriptionCollaboratorDao dao) {
        super(dao);
    }

}
