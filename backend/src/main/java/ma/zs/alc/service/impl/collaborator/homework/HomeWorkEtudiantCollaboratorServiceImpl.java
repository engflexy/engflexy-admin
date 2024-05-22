package ma.zs.alc.service.impl.collaborator.homework;


import ma.zs.alc.bean.core.homework.HomeWorkEtudiant;
import ma.zs.alc.dao.criteria.core.homework.HomeWorkEtudiantCriteria;
import ma.zs.alc.dao.facade.core.homework.HomeWorkEtudiantDao;
import ma.zs.alc.dao.specification.core.homework.HomeWorkEtudiantSpecification;
import ma.zs.alc.service.facade.collaborator.homework.HomeWorkEtudiantCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import ma.zs.alc.service.facade.collaborator.inscription.EtudiantCollaboratorService ;
import ma.zs.alc.bean.core.inscription.Etudiant ;
import ma.zs.alc.service.facade.collaborator.homework.ReponseEtudiantHomeWorkCollaboratorService ;
import ma.zs.alc.bean.core.homework.ReponseEtudiantHomeWork ;
import ma.zs.alc.service.facade.collaborator.homework.HomeWorkCollaboratorService ;
import ma.zs.alc.bean.core.homework.HomeWork ;

import java.util.List;
@Service
public class HomeWorkEtudiantCollaboratorServiceImpl extends AbstractServiceImpl<HomeWorkEtudiant, HomeWorkEtudiantCriteria, HomeWorkEtudiantDao> implements HomeWorkEtudiantCollaboratorService {


    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public HomeWorkEtudiant create(HomeWorkEtudiant t) {
        HomeWorkEtudiant saved= super.create(t);
        if (saved != null && t.getReponseEtudiantHomeWorks() != null) {
                t.getReponseEtudiantHomeWorks().forEach(element-> {
                    element.setHomeWorkEtudiant(saved);
                    reponseEtudiantHomeWorkService.create(element);
            });
        }
        return saved;

    }

    public HomeWorkEtudiant findWithAssociatedLists(Long id){
        HomeWorkEtudiant result = dao.findById(id).orElse(null);
        if(result!=null && result.getId() != null) {
            result.setReponseEtudiantHomeWorks(reponseEtudiantHomeWorkService.findByHomeWorkEtudiantId(id));
        }
        return result;
    }
    @Transactional
    public void deleteAssociatedLists(Long id) {
        reponseEtudiantHomeWorkService.deleteByHomeWorkEtudiantId(id);
    }


    public void updateWithAssociatedLists(HomeWorkEtudiant homeWorkEtudiant){
    if(homeWorkEtudiant !=null && homeWorkEtudiant.getId() != null){
            List<List<ReponseEtudiantHomeWork>> resultReponseEtudiantHomeWorks= reponseEtudiantHomeWorkService.getToBeSavedAndToBeDeleted(reponseEtudiantHomeWorkService.findByHomeWorkEtudiantId(homeWorkEtudiant.getId()),homeWorkEtudiant.getReponseEtudiantHomeWorks());
            reponseEtudiantHomeWorkService.delete(resultReponseEtudiantHomeWorks.get(1));
            ListUtil.emptyIfNull(resultReponseEtudiantHomeWorks.get(0)).forEach(e -> e.setHomeWorkEtudiant(homeWorkEtudiant));
            reponseEtudiantHomeWorkService.update(resultReponseEtudiantHomeWorks.get(0),true);
        }
    }




    public void findOrSaveAssociatedObject(HomeWorkEtudiant t){
        if( t != null) {
            t.setEtudiant(etudiantService.findOrSave(t.getEtudiant()));
            t.setHomeWork(homeWorkService.findOrSave(t.getHomeWork()));
        }
    }

    public List<HomeWorkEtudiant> findByEtudiantId(Long id){
        return dao.findByEtudiantId(id);
    }
    public int deleteByEtudiantId(Long id){
        return dao.deleteByEtudiantId(id);
    }
    public long countByEtudiantId(Long id){
        return dao.countByEtudiantId(id);
    }
    public List<HomeWorkEtudiant> findByHomeWorkId(Long id){
        return dao.findByHomeWorkId(id);
    }
    public int deleteByHomeWorkId(Long id){
        return dao.deleteByHomeWorkId(id);
    }
    public long countByHomeWorkId(Long id){
        return dao.countByHomeWorkId(id);
    }






    public void configure() {
        super.configure(HomeWorkEtudiant.class, HomeWorkEtudiantSpecification.class);
    }


    @Autowired
    private EtudiantCollaboratorService etudiantService ;
    @Autowired
    private ReponseEtudiantHomeWorkCollaboratorService reponseEtudiantHomeWorkService ;
    @Autowired
    private HomeWorkCollaboratorService homeWorkService ;

    public HomeWorkEtudiantCollaboratorServiceImpl(HomeWorkEtudiantDao dao) {
        super(dao);
    }

}