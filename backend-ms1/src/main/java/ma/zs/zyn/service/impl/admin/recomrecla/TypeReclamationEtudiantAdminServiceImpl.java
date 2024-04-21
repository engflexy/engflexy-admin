package ma.zs.zyn.service.impl.admin.recomrecla;


import ma.zs.zyn.bean.core.recomrecla.TypeReclamationEtudiant;
import ma.zs.zyn.dao.criteria.core.recomrecla.TypeReclamationEtudiantCriteria;
import ma.zs.zyn.dao.facade.core.recomrecla.TypeReclamationEtudiantDao;
import ma.zs.zyn.dao.specification.core.recomrecla.TypeReclamationEtudiantSpecification;
import ma.zs.zyn.service.facade.admin.recomrecla.TypeReclamationEtudiantAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class TypeReclamationEtudiantAdminServiceImpl extends AbstractServiceImpl<TypeReclamationEtudiant, TypeReclamationEtudiantCriteria, TypeReclamationEtudiantDao> implements TypeReclamationEtudiantAdminService {






    public TypeReclamationEtudiant findByReferenceEntity(TypeReclamationEtudiant t){
        return  dao.findByCode(t.getCode());
    }


    public List<TypeReclamationEtudiant> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(TypeReclamationEtudiant.class, TypeReclamationEtudiantSpecification.class);
    }



    public TypeReclamationEtudiantAdminServiceImpl(TypeReclamationEtudiantDao dao) {
        super(dao);
    }

}
