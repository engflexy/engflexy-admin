package ma.zs.alc.service.impl.collaborator.prof;


import ma.zs.alc.bean.core.prof.ClassAverageBonusProf;
import ma.zs.alc.dao.criteria.core.prof.ClassAverageBonusProfCriteria;
import ma.zs.alc.dao.facade.core.prof.ClassAverageBonusProfDao;
import ma.zs.alc.dao.specification.core.prof.ClassAverageBonusProfSpecification;
import ma.zs.alc.service.facade.collaborator.prof.ClassAverageBonusProfCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.salary.SalaryCollaboratorService ;
import ma.zs.alc.bean.core.salary.Salary ;
import ma.zs.alc.service.facade.collaborator.prof.ProfCollaboratorService ;
import ma.zs.alc.bean.core.prof.Prof ;

import java.util.List;
@Service
public class ClassAverageBonusProfCollaboratorServiceImpl extends AbstractServiceImpl<ClassAverageBonusProf, ClassAverageBonusProfCriteria, ClassAverageBonusProfDao> implements ClassAverageBonusProfCollaboratorService {






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
    private SalaryCollaboratorService salaryService ;
    @Autowired
    private ProfCollaboratorService profService ;

    public ClassAverageBonusProfCollaboratorServiceImpl(ClassAverageBonusProfDao dao) {
        super(dao);
    }

}