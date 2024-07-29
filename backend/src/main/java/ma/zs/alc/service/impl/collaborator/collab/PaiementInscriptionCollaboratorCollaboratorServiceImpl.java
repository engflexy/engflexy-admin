package ma.zs.alc.service.impl.collaborator.collab;


import ma.zs.alc.bean.core.collab.PaiementInscriptionCollaborator;
import ma.zs.alc.dao.criteria.core.collab.PaiementInscriptionCollaboratorCriteria;
import ma.zs.alc.dao.facade.core.collab.PaiementInscriptionCollaboratorDao;
import ma.zs.alc.dao.specification.core.collab.PaiementInscriptionCollaboratorSpecification;
import ma.zs.alc.service.facade.collaborator.collab.PaiementInscriptionCollaboratorCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import static ma.zs.alc.zynerator.util.ListUtil.*;

import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;



import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.collab.PaiementInscriptionCollaboratorStateCollaboratorService ;
import ma.zs.alc.bean.core.collab.PaiementInscriptionCollaboratorState ;
import ma.zs.alc.service.facade.collaborator.collab.InscriptionCollaboratorCollaboratorService ;
import ma.zs.alc.bean.core.collab.InscriptionCollaborator ;


import java.util.List;
@Service
public class PaiementInscriptionCollaboratorCollaboratorServiceImpl extends AbstractServiceImpl<PaiementInscriptionCollaborator, PaiementInscriptionCollaboratorCriteria, PaiementInscriptionCollaboratorDao> implements PaiementInscriptionCollaboratorCollaboratorService {







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
    private PaiementInscriptionCollaboratorStateCollaboratorService paiementInscriptionCollaboratorStateService ;
    @Autowired
    private InscriptionCollaboratorCollaboratorService inscriptionCollaboratorService ;

    public PaiementInscriptionCollaboratorCollaboratorServiceImpl(PaiementInscriptionCollaboratorDao dao) {
        super(dao);
    }

}
