package ma.zs.zyn.service.impl.admin.prof;


import ma.zs.zyn.bean.core.prof.TrancheHoraireProf;
import ma.zs.zyn.dao.criteria.core.prof.TrancheHoraireProfCriteria;
import ma.zs.zyn.dao.facade.core.prof.TrancheHoraireProfDao;
import ma.zs.zyn.dao.specification.core.prof.TrancheHoraireProfSpecification;
import ma.zs.zyn.service.facade.admin.prof.TrancheHoraireProfAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.zyn.service.facade.admin.prof.ProfAdminService ;
import ma.zs.zyn.bean.core.prof.Prof ;

import java.util.List;
@Service
public class TrancheHoraireProfAdminServiceImpl extends AbstractServiceImpl<TrancheHoraireProf, TrancheHoraireProfCriteria, TrancheHoraireProfDao> implements TrancheHoraireProfAdminService {






    public void findOrSaveAssociatedObject(TrancheHoraireProf t){
        if( t != null) {
            t.setProf(profService.findOrSave(t.getProf()));
        }
    }

    public List<TrancheHoraireProf> findByProfId(Long id){
        return dao.findByProfId(id);
    }
    public int deleteByProfId(Long id){
        return dao.deleteByProfId(id);
    }
    public long countByProfRef(String ref){
        return dao.countByProfRef(ref);
    }






    public void configure() {
        super.configure(TrancheHoraireProf.class, TrancheHoraireProfSpecification.class);
    }


    @Autowired
    private ProfAdminService profService ;

    public TrancheHoraireProfAdminServiceImpl(TrancheHoraireProfDao dao) {
        super(dao);
    }

}
