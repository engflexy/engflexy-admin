package ma.zs.alc.service.impl.collaborator.prof;


import ma.zs.alc.bean.core.prof.TrancheHoraireProf;
import ma.zs.alc.dao.criteria.core.prof.TrancheHoraireProfCriteria;
import ma.zs.alc.dao.facade.core.prof.TrancheHoraireProfDao;
import ma.zs.alc.dao.specification.core.prof.TrancheHoraireProfSpecification;
import ma.zs.alc.service.facade.collaborator.prof.TrancheHoraireProfCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.prof.ProfCollaboratorService ;
import ma.zs.alc.bean.core.prof.Prof ;

import java.util.List;
@Service
public class TrancheHoraireProfCollaboratorServiceImpl extends AbstractServiceImpl<TrancheHoraireProf, TrancheHoraireProfCriteria, TrancheHoraireProfDao> implements TrancheHoraireProfCollaboratorService {






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
    private ProfCollaboratorService profService ;

    public TrancheHoraireProfCollaboratorServiceImpl(TrancheHoraireProfDao dao) {
        super(dao);
    }

}
