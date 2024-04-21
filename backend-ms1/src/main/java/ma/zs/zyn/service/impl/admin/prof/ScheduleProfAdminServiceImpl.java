package ma.zs.zyn.service.impl.admin.prof;


import ma.zs.zyn.bean.core.prof.ScheduleProf;
import ma.zs.zyn.dao.criteria.core.prof.ScheduleProfCriteria;
import ma.zs.zyn.dao.facade.core.prof.ScheduleProfDao;
import ma.zs.zyn.dao.specification.core.prof.ScheduleProfSpecification;
import ma.zs.zyn.service.facade.admin.prof.ScheduleProfAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;



import ma.zs.zyn.zynerator.dto.ScheduleDto;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.zyn.service.facade.admin.grpe.GroupeEtudiantAdminService ;
import ma.zs.zyn.bean.core.grpe.GroupeEtudiant ;
import ma.zs.zyn.service.facade.admin.course.CoursAdminService ;
import ma.zs.zyn.bean.core.course.Cours ;
import ma.zs.zyn.service.facade.admin.prof.ProfAdminService ;
import ma.zs.zyn.bean.core.prof.Prof ;

    import java.time.LocalDateTime;
import java.util.List;
@Service
public class ScheduleProfAdminServiceImpl extends AbstractServiceImpl<ScheduleProf, ScheduleProfCriteria, ScheduleProfDao> implements ScheduleProfAdminService {






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
    private GroupeEtudiantAdminService groupeEtudiantService ;
    @Autowired
    private CoursAdminService coursService ;
    @Autowired
    private ProfAdminService profService ;

    public ScheduleProfAdminServiceImpl(ScheduleProfDao dao) {
        super(dao);
    }

}
