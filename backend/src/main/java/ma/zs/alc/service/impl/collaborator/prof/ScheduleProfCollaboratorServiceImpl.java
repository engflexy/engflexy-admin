package ma.zs.alc.service.impl.collaborator.prof;


import ma.zs.alc.bean.core.prof.ScheduleProf;
import ma.zs.alc.dao.criteria.core.prof.ScheduleProfCriteria;
import ma.zs.alc.dao.facade.core.prof.ScheduleProfDao;
import ma.zs.alc.dao.specification.core.prof.ScheduleProfSpecification;
import ma.zs.alc.service.facade.collaborator.prof.ScheduleProfCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;



import ma.zs.alc.zynerator.dto.ScheduleDto;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.grpe.GroupeEtudiantCollaboratorService ;
import ma.zs.alc.bean.core.grpe.GroupeEtudiant ;
import ma.zs.alc.service.facade.collaborator.course.CoursCollaboratorService ;
import ma.zs.alc.bean.core.course.Cours ;
import ma.zs.alc.service.facade.collaborator.prof.ProfCollaboratorService ;
import ma.zs.alc.bean.core.prof.Prof ;

    import java.time.LocalDateTime;
import java.util.List;
@Service
public class ScheduleProfCollaboratorServiceImpl extends AbstractServiceImpl<ScheduleProf, ScheduleProfCriteria, ScheduleProfDao> implements ScheduleProfCollaboratorService {






    public void findOrSaveAssociatedObject(ScheduleProf t){
        if( t != null) {
            t.setGroupeEtudiant(groupeEtudiantService.findOrSave(t.getGroupeEtudiant()));
            t.setProf(profService.findOrSave(t.getProf()));
            t.setCours(coursService.findOrSave(t.getCours()));
        }
    }

    public List<ScheduleProf> findByGroupeEtudiantId(Long id){
        return dao.findByGroupeEtudiantId(id);
    }
    public int deleteByGroupeEtudiantId(Long id){
        return dao.deleteByGroupeEtudiantId(id);
    }
    public long countByGroupeEtudiantId(Long id){
        return dao.countByGroupeEtudiantId(id);
    }
    public List<ScheduleProf> findByProfId(Long id){
        return dao.findByProfId(id);
    }
    public int deleteByProfId(Long id){
        return dao.deleteByProfId(id);
    }
    public long countByProfRef(String ref){
        return dao.countByProfRef(ref);
    }
    public List<ScheduleProf> findByCoursId(Long id){
        return dao.findByCoursId(id);
    }
    public int deleteByCoursId(Long id){
        return dao.deleteByCoursId(id);
    }
    public long countByCoursCode(String code){
        return dao.countByCoursCode(code);
    }

    public List<ScheduleProf> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public List<ScheduleDto> findSchedule(LocalDateTime start, LocalDateTime end) {
        List<ScheduleDto> results = dao.findSchedule(start, end);
            return results;
    }
    public void configure() {
        super.configure(ScheduleProf.class, ScheduleProfSpecification.class);
    }


    @Autowired
    private GroupeEtudiantCollaboratorService groupeEtudiantService ;
    @Autowired
    private CoursCollaboratorService coursService ;
    @Autowired
    private ProfCollaboratorService profService ;

    public ScheduleProfCollaboratorServiceImpl(ScheduleProfDao dao) {
        super(dao);
    }

}
