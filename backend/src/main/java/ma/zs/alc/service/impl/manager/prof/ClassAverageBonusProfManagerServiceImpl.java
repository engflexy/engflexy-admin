package ma.zs.alc.service.impl.manager.prof;


import ma.zs.alc.bean.core.prof.ClassAverageBonusProf;
import ma.zs.alc.dao.criteria.core.prof.ClassAverageBonusProfCriteria;
import ma.zs.alc.dao.facade.core.prof.ClassAverageBonusProfDao;
import ma.zs.alc.dao.specification.core.prof.ClassAverageBonusProfSpecification;
import ma.zs.alc.service.facade.manager.prof.ClassAverageBonusProfManagerService;
import ma.zs.alc.service.facade.manager.prof.ProfManagerService;
import ma.zs.alc.service.facade.manager.salary.SalaryManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassAverageBonusProfManagerServiceImpl extends AbstractServiceImpl<ClassAverageBonusProf, ClassAverageBonusProfCriteria, ClassAverageBonusProfDao> implements ClassAverageBonusProfManagerService {







    public void findOrSaveAssociatedObject(ClassAverageBonusProf t){
        if( t != null) {
            t.setProf(profService.findOrSave(t.getProf()));
            t.setSalary(salaryService.findOrSave(t.getSalary()));
        }
    }

    public List<ClassAverageBonusProf> findByProfId(Long id){
        return dao.findByProfId(id);
    }
    public int deleteByProfId(Long id){
        return dao.deleteByProfId(id);
    }
    public long countByProfRef(String ref){
        return dao.countByProfRef(ref);
    }
    public List<ClassAverageBonusProf> findBySalaryId(Long id){
        return dao.findBySalaryId(id);
    }
    public int deleteBySalaryId(Long id){
        return dao.deleteBySalaryId(id);
    }
    public long countBySalaryCode(String code){
        return dao.countBySalaryCode(code);
    }






    public void configure() {
        super.configure(ClassAverageBonusProf.class, ClassAverageBonusProfSpecification.class);
    }


    @Autowired
    private SalaryManagerService salaryService ;
    @Autowired
    private ProfManagerService profService ;

    public ClassAverageBonusProfManagerServiceImpl(ClassAverageBonusProfDao dao) {
        super(dao);
    }

}
