package ma.zs.alc.service.impl.manager.recomrecla;


import ma.zs.alc.bean.core.recomrecla.TypeReclamationProf;
import ma.zs.alc.dao.criteria.core.recomrecla.TypeReclamationProfCriteria;
import ma.zs.alc.dao.facade.core.recomrecla.TypeReclamationProfDao;
import ma.zs.alc.dao.specification.core.recomrecla.TypeReclamationProfSpecification;
import ma.zs.alc.service.facade.manager.recomrecla.TypeReclamationProfManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class TypeReclamationProfManagerServiceImpl extends AbstractServiceImpl<TypeReclamationProf, TypeReclamationProfCriteria, TypeReclamationProfDao> implements TypeReclamationProfManagerService {







    public TypeReclamationProf findByReferenceEntity(TypeReclamationProf t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<TypeReclamationProf> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(TypeReclamationProf.class, TypeReclamationProfSpecification.class);
    }



    public TypeReclamationProfManagerServiceImpl(TypeReclamationProfDao dao) {
        super(dao);
    }

}
