package ma.zs.zyn.service.impl.admin.inscriptionref;


import ma.zs.zyn.bean.core.inscriptionref.EtatEtudiantSchedule;
import ma.zs.zyn.dao.criteria.core.inscriptionref.EtatEtudiantScheduleCriteria;
import ma.zs.zyn.dao.facade.core.inscriptionref.EtatEtudiantScheduleDao;
import ma.zs.zyn.dao.specification.core.inscriptionref.EtatEtudiantScheduleSpecification;
import ma.zs.zyn.service.facade.admin.inscriptionref.EtatEtudiantScheduleAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class EtatEtudiantScheduleAdminServiceImpl extends AbstractServiceImpl<EtatEtudiantSchedule, EtatEtudiantScheduleCriteria, EtatEtudiantScheduleDao> implements EtatEtudiantScheduleAdminService {






    public EtatEtudiantSchedule findByReferenceEntity(EtatEtudiantSchedule t){
        return  dao.findByCode(t.getCode());
    }


    public List<EtatEtudiantSchedule> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(EtatEtudiantSchedule.class, EtatEtudiantScheduleSpecification.class);
    }



    public EtatEtudiantScheduleAdminServiceImpl(EtatEtudiantScheduleDao dao) {
        super(dao);
    }

}
