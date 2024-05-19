package ma.zs.alc.service.impl.collaborator.recomrecla;


import ma.zs.alc.bean.core.recomrecla.TypeReclamationProf;
import ma.zs.alc.dao.criteria.core.recomrecla.TypeReclamationProfCriteria;
import ma.zs.alc.dao.facade.core.recomrecla.TypeReclamationProfDao;
import ma.zs.alc.dao.specification.core.recomrecla.TypeReclamationProfSpecification;
import ma.zs.alc.service.facade.collaborator.recomrecla.TypeReclamationProfCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class TypeReclamationProfCollaboratorServiceImpl extends AbstractServiceImpl<TypeReclamationProf, TypeReclamationProfCriteria, TypeReclamationProfDao> implements TypeReclamationProfCollaboratorService {






    public TypeReclamationProf findByReferenceEntity(TypeReclamationProf t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<TypeReclamationProf> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(TypeReclamationProf.class, TypeReclamationProfSpecification.class);
    }



    public TypeReclamationProfCollaboratorServiceImpl(TypeReclamationProfDao dao) {
        super(dao);
    }

}
