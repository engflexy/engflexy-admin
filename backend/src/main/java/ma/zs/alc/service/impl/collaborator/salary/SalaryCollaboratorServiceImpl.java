package ma.zs.alc.service.impl.collaborator.salary;


import ma.zs.alc.bean.core.salary.Salary;
import ma.zs.alc.dao.criteria.core.salary.SalaryCriteria;
import ma.zs.alc.dao.facade.core.salary.SalaryDao;
import ma.zs.alc.dao.specification.core.salary.SalarySpecification;
import ma.zs.alc.service.facade.collaborator.salary.SalaryCollaboratorService;
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
public class SalaryCollaboratorServiceImpl extends AbstractServiceImpl<Salary, SalaryCriteria, SalaryDao> implements SalaryCollaboratorService {






    public Salary findByReferenceEntity(Salary t){
        return t.getId() == null ? null : dao.findById(t.getId()).orElse(null);
    }
    public void findOrSaveAssociatedObject(Salary t){
        if( t != null) {
            t.setProf(profService.findOrSave(t.getProf()));
        }
    }

    public List<Salary> findByProfId(Long id){
        return dao.findByProfId(id);
    }
    public int deleteByProfId(Long id){
        return dao.deleteByProfId(id);
    }
    public long countByProfRef(String ref){
        return dao.countByProfRef(ref);
    }

    public List<Salary> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Salary.class, SalarySpecification.class);
    }


    @Autowired
    private ProfCollaboratorService profService ;

    public SalaryCollaboratorServiceImpl(SalaryDao dao) {
        super(dao);
    }

}
