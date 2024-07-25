package ma.zs.alc.service.impl.manager.prof;


import ma.zs.alc.bean.core.prof.TrancheHoraireProf;
import ma.zs.alc.dao.criteria.core.prof.TrancheHoraireProfCriteria;
import ma.zs.alc.dao.facade.core.prof.TrancheHoraireProfDao;
import ma.zs.alc.dao.specification.core.prof.TrancheHoraireProfSpecification;
import ma.zs.alc.service.facade.manager.prof.TrancheHoraireProfManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.manager.prof.ProfManagerService ;

@Service
public class TrancheHoraireProfManagerServiceImpl extends AbstractServiceImpl<TrancheHoraireProf, TrancheHoraireProfCriteria, TrancheHoraireProfDao> implements TrancheHoraireProfManagerService {







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
    private ProfManagerService profService ;

    public TrancheHoraireProfManagerServiceImpl(TrancheHoraireProfDao dao) {
        super(dao);
    }

}
