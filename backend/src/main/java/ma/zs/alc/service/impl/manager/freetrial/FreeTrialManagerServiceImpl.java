package ma.zs.alc.service.impl.manager.freetrial;


import ma.zs.alc.bean.core.freetrial.FreeTrial;
import ma.zs.alc.dao.criteria.core.freetrial.FreeTrialCriteria;
import ma.zs.alc.dao.facade.core.freetrial.FreeTrialDao;
import ma.zs.alc.dao.specification.core.freetrial.FreeTrialSpecification;
import ma.zs.alc.service.facade.manager.freetrial.FreeTrialManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import static ma.zs.alc.zynerator.util.ListUtil.*;

import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import ma.zs.alc.service.facade.manager.freetrial.FreeTrialTeacherEmailTemplateManagerService ;
import ma.zs.alc.service.facade.manager.freetrial.FreeTrialTeacherWhatsTemplateManagerService ;
import ma.zs.alc.service.facade.manager.freetrial.StatutFreeTrialManagerService ;
import ma.zs.alc.service.facade.manager.freetrial.FreeTrialConfigurationManagerService ;
import ma.zs.alc.service.facade.manager.freetrial.FreeTrialStudentEmailTemplateManagerService ;
import ma.zs.alc.service.facade.manager.freetrial.FreeTrialDetailManagerService ;
import ma.zs.alc.bean.core.freetrial.FreeTrialDetail ;
import ma.zs.alc.service.facade.manager.prof.ProfManagerService ;
import ma.zs.alc.service.facade.manager.inscriptionref.NiveauEtudeManagerService ;
import ma.zs.alc.service.facade.manager.freetrial.FreeTrialStudentWhatsTemplateManagerService ;

@Service
public class FreeTrialManagerServiceImpl extends AbstractServiceImpl<FreeTrial, FreeTrialCriteria, FreeTrialDao> implements FreeTrialManagerService {



    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public FreeTrial create(FreeTrial t) {
        FreeTrial saved= super.create(t);
        if (saved != null && t.getFreeTrialDetails() != null) {
                t.getFreeTrialDetails().forEach(element-> {
                    element.setFreeTrial(saved);
                    freeTrialDetailService.create(element);
            });
        }
        return saved;

    }

    public FreeTrial findWithAssociatedLists(Long id){
        FreeTrial result = dao.findById(id).orElse(null);
        if(result!=null && result.getId() != null) {
            result.setFreeTrialDetails(freeTrialDetailService.findByFreeTrialId(id));
        }
        return result;
    }
    @Transactional
    public void deleteAssociatedLists(Long id) {
        freeTrialDetailService.deleteByFreeTrialId(id);
    }


    public void updateWithAssociatedLists(FreeTrial freeTrial){
    if(freeTrial !=null && freeTrial.getId() != null){
            List<List<FreeTrialDetail>> resultFreeTrialDetails= freeTrialDetailService.getToBeSavedAndToBeDeleted(freeTrialDetailService.findByFreeTrialId(freeTrial.getId()),freeTrial.getFreeTrialDetails());
            freeTrialDetailService.delete(resultFreeTrialDetails.get(1));
            emptyIfNull(resultFreeTrialDetails.get(0)).forEach(e -> e.setFreeTrial(freeTrial));
            freeTrialDetailService.update(resultFreeTrialDetails.get(0),true);
        }
    }




    public FreeTrial findByReferenceEntity(FreeTrial t){
        return t==null? null : dao.findByReference(t.getReference());
    }
    public void findOrSaveAssociatedObject(FreeTrial t){
        if( t != null) {
            t.setProf(profService.findOrSave(t.getProf()));
            t.setNiveauEtude(niveauEtudeService.findOrSave(t.getNiveauEtude()));
            t.setFreeTrialStudentWhatsTemplate(freeTrialStudentWhatsTemplateService.findOrSave(t.getFreeTrialStudentWhatsTemplate()));
            t.setFreeTrialStudentEmailTemplate(freeTrialStudentEmailTemplateService.findOrSave(t.getFreeTrialStudentEmailTemplate()));
            t.setFreeTrialTeacherEmailTemplate(freeTrialTeacherEmailTemplateService.findOrSave(t.getFreeTrialTeacherEmailTemplate()));
            t.setFreeTrialTeacherWhatsTemplate(freeTrialTeacherWhatsTemplateService.findOrSave(t.getFreeTrialTeacherWhatsTemplate()));
            t.setFreeTrialConfiguration(freeTrialConfigurationService.findOrSave(t.getFreeTrialConfiguration()));
            t.setStatutFreeTrial(statutFreeTrialService.findOrSave(t.getStatutFreeTrial()));
        }
    }

    public List<FreeTrial> findByProfId(Long id){
        return dao.findByProfId(id);
    }
    public int deleteByProfId(Long id){
        return dao.deleteByProfId(id);
    }
    public long countByProfRef(String ref){
        return dao.countByProfRef(ref);
    }
    public List<FreeTrial> findByNiveauEtudeId(Long id){
        return dao.findByNiveauEtudeId(id);
    }
    public int deleteByNiveauEtudeId(Long id){
        return dao.deleteByNiveauEtudeId(id);
    }
    public long countByNiveauEtudeCode(String code){
        return dao.countByNiveauEtudeCode(code);
    }
    public List<FreeTrial> findByFreeTrialStudentWhatsTemplateId(Long id){
        return dao.findByFreeTrialStudentWhatsTemplateId(id);
    }
    public int deleteByFreeTrialStudentWhatsTemplateId(Long id){
        return dao.deleteByFreeTrialStudentWhatsTemplateId(id);
    }
    public long countByFreeTrialStudentWhatsTemplateId(Long id){
        return dao.countByFreeTrialStudentWhatsTemplateId(id);
    }
    public List<FreeTrial> findByFreeTrialStudentEmailTemplateId(Long id){
        return dao.findByFreeTrialStudentEmailTemplateId(id);
    }
    public int deleteByFreeTrialStudentEmailTemplateId(Long id){
        return dao.deleteByFreeTrialStudentEmailTemplateId(id);
    }
    public long countByFreeTrialStudentEmailTemplateId(Long id){
        return dao.countByFreeTrialStudentEmailTemplateId(id);
    }
    public List<FreeTrial> findByFreeTrialTeacherEmailTemplateId(Long id){
        return dao.findByFreeTrialTeacherEmailTemplateId(id);
    }
    public int deleteByFreeTrialTeacherEmailTemplateId(Long id){
        return dao.deleteByFreeTrialTeacherEmailTemplateId(id);
    }
    public long countByFreeTrialTeacherEmailTemplateId(Long id){
        return dao.countByFreeTrialTeacherEmailTemplateId(id);
    }
    public List<FreeTrial> findByFreeTrialTeacherWhatsTemplateId(Long id){
        return dao.findByFreeTrialTeacherWhatsTemplateId(id);
    }
    public int deleteByFreeTrialTeacherWhatsTemplateId(Long id){
        return dao.deleteByFreeTrialTeacherWhatsTemplateId(id);
    }
    public long countByFreeTrialTeacherWhatsTemplateId(Long id){
        return dao.countByFreeTrialTeacherWhatsTemplateId(id);
    }
    public List<FreeTrial> findByFreeTrialConfigurationId(Long id){
        return dao.findByFreeTrialConfigurationId(id);
    }
    public int deleteByFreeTrialConfigurationId(Long id){
        return dao.deleteByFreeTrialConfigurationId(id);
    }
    public long countByFreeTrialConfigurationId(Long id){
        return dao.countByFreeTrialConfigurationId(id);
    }
    public List<FreeTrial> findByStatutFreeTrialId(Long id){
        return dao.findByStatutFreeTrialId(id);
    }
    public int deleteByStatutFreeTrialId(Long id){
        return dao.deleteByStatutFreeTrialId(id);
    }
    public long countByStatutFreeTrialCode(String code){
        return dao.countByStatutFreeTrialCode(code);
    }

    public List<FreeTrial> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(FreeTrial.class, FreeTrialSpecification.class);
    }


    @Autowired
    private FreeTrialTeacherEmailTemplateManagerService freeTrialTeacherEmailTemplateService ;
    @Autowired
    private FreeTrialTeacherWhatsTemplateManagerService freeTrialTeacherWhatsTemplateService ;
    @Autowired
    private StatutFreeTrialManagerService statutFreeTrialService ;
    @Autowired
    private FreeTrialConfigurationManagerService freeTrialConfigurationService ;
    @Autowired
    private FreeTrialStudentEmailTemplateManagerService freeTrialStudentEmailTemplateService ;
    @Autowired
    private FreeTrialDetailManagerService freeTrialDetailService ;
    @Autowired
    private ProfManagerService profService ;
    @Autowired
    private NiveauEtudeManagerService niveauEtudeService ;
    @Autowired
    private FreeTrialStudentWhatsTemplateManagerService freeTrialStudentWhatsTemplateService ;

    public FreeTrialManagerServiceImpl(FreeTrialDao dao) {
        super(dao);
    }

}
