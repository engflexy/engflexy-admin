package ma.zs.alc.service.impl.manager.recomrecla;


import ma.zs.alc.bean.core.recomrecla.ReclamationProf;
import ma.zs.alc.dao.criteria.core.recomrecla.ReclamationProfCriteria;
import ma.zs.alc.dao.facade.core.recomrecla.ReclamationProfDao;
import ma.zs.alc.dao.specification.core.recomrecla.ReclamationProfSpecification;
import ma.zs.alc.service.facade.manager.recomrecla.ReclamationProfManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.manager.recomrecla.TypeReclamationProfManagerService ;
import ma.zs.alc.service.facade.manager.prof.ProfManagerService ;

@Service
public class ReclamationProfManagerServiceImpl extends AbstractServiceImpl<ReclamationProf, ReclamationProfCriteria, ReclamationProfDao> implements ReclamationProfManagerService {







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
    private TypeReclamationProfManagerService typeReclamationProfService ;
    @Autowired
    private ProfManagerService profService ;

    public ReclamationProfManagerServiceImpl(ReclamationProfDao dao) {
        super(dao);
    }

}
