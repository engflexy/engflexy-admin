package ma.zs.zyn.service.impl.admin.recomrecla;


import ma.zs.zyn.bean.core.recomrecla.TypeReclamationProf;
import ma.zs.zyn.dao.criteria.core.recomrecla.TypeReclamationProfCriteria;
import ma.zs.zyn.dao.facade.core.recomrecla.TypeReclamationProfDao;
import ma.zs.zyn.dao.specification.core.recomrecla.TypeReclamationProfSpecification;
import ma.zs.zyn.service.facade.admin.recomrecla.TypeReclamationProfAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class TypeReclamationProfAdminServiceImpl extends AbstractServiceImpl<TypeReclamationProf, TypeReclamationProfCriteria, TypeReclamationProfDao> implements TypeReclamationProfAdminService {






    public TypeReclamationProf findByReferenceEntity(TypeReclamationProf t){
        return  dao.findByCode(t.getCode());
    }


    public List<TypeReclamationProf> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(TypeReclamationProf.class, TypeReclamationProfSpecification.class);
    }



    public TypeReclamationProfAdminServiceImpl(TypeReclamationProfDao dao) {
        super(dao);
    }

}
