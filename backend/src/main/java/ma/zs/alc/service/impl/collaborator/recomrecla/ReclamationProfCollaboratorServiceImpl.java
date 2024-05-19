package ma.zs.alc.service.impl.collaborator.recomrecla;


import ma.zs.alc.bean.core.recomrecla.ReclamationProf;
import ma.zs.alc.dao.criteria.core.recomrecla.ReclamationProfCriteria;
import ma.zs.alc.dao.facade.core.recomrecla.ReclamationProfDao;
import ma.zs.alc.dao.specification.core.recomrecla.ReclamationProfSpecification;
import ma.zs.alc.service.facade.collaborator.recomrecla.ReclamationProfCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.recomrecla.TypeReclamationProfCollaboratorService ;
import ma.zs.alc.bean.core.recomrecla.TypeReclamationProf ;
import ma.zs.alc.service.facade.collaborator.prof.ProfCollaboratorService ;
import ma.zs.alc.bean.core.prof.Prof ;

import java.util.List;
@Service
public class ReclamationProfCollaboratorServiceImpl extends AbstractServiceImpl<ReclamationProf, ReclamationProfCriteria, ReclamationProfDao> implements ReclamationProfCollaboratorService {






    public ReclamationProf findByReferenceEntity(ReclamationProf t){
        return t==null? null : dao.findByReference(t.getReference());
    }
    public void findOrSaveAssociatedObject(ReclamationProf t){
        if( t != null) {
            t.setProf(profService.findOrSave(t.getProf()));
            t.setTypeReclamationProf(typeReclamationProfService.findOrSave(t.getTypeReclamationProf()));
        }
    }

    public List<ReclamationProf> findByProfId(Long id){
        return dao.findByProfId(id);
    }
    public int deleteByProfId(Long id){
        return dao.deleteByProfId(id);
    }
    public long countByProfRef(String ref){
        return dao.countByProfRef(ref);
    }
    public List<ReclamationProf> findByTypeReclamationProfId(Long id){
        return dao.findByTypeReclamationProfId(id);
    }
    public int deleteByTypeReclamationProfId(Long id){
        return dao.deleteByTypeReclamationProfId(id);
    }
    public long countByTypeReclamationProfCode(String code){
        return dao.countByTypeReclamationProfCode(code);
    }

    public List<ReclamationProf> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(ReclamationProf.class, ReclamationProfSpecification.class);
    }


    @Autowired
    private TypeReclamationProfCollaboratorService typeReclamationProfService ;
    @Autowired
    private ProfCollaboratorService profService ;

    public ReclamationProfCollaboratorServiceImpl(ReclamationProfDao dao) {
        super(dao);
    }

}
