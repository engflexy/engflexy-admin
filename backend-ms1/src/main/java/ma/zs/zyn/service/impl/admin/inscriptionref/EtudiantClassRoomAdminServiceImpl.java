package ma.zs.zyn.service.impl.admin.inscriptionref;


import ma.zs.zyn.bean.core.inscriptionref.EtudiantClassRoom;
import ma.zs.zyn.dao.criteria.core.inscriptionref.EtudiantClassRoomCriteria;
import ma.zs.zyn.dao.facade.core.inscriptionref.EtudiantClassRoomDao;
import ma.zs.zyn.dao.specification.core.inscriptionref.EtudiantClassRoomSpecification;
import ma.zs.zyn.service.facade.admin.inscriptionref.EtudiantClassRoomAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.zyn.service.facade.admin.inscription.EtudiantAdminService ;
import ma.zs.zyn.bean.core.inscription.Etudiant ;
import ma.zs.zyn.service.facade.admin.inscriptionref.ClassRoomAdminService ;
import ma.zs.zyn.bean.core.inscriptionref.ClassRoom ;

import java.util.List;
@Service
public class EtudiantClassRoomAdminServiceImpl extends AbstractServiceImpl<EtudiantClassRoom, EtudiantClassRoomCriteria, EtudiantClassRoomDao> implements EtudiantClassRoomAdminService {






    public void findOrSaveAssociatedObject(EtudiantClassRoom t){
        if( t != null) {
            t.setClassRoom(classRoomService.findOrSave(t.getClassRoom()));
            t.setEtudiant(etudiantService.findOrSave(t.getEtudiant()));
        }
    }

    public List<EtudiantClassRoom> findByClassRoomId(Long id){
        return dao.findByClassRoomId(id);
    }
    public int deleteByClassRoomId(Long id){
        return dao.deleteByClassRoomId(id);
    }
    public long countByClassRoomLibelle(String libelle){
        return dao.countByClassRoomLibelle(libelle);
    }
    public List<EtudiantClassRoom> findByEtudiantId(Long id){
        return dao.findByEtudiantId(id);
    }
    public int deleteByEtudiantId(Long id){
        return dao.deleteByEtudiantId(id);
    }
    public long countByEtudiantRef(String ref){
        return dao.countByEtudiantRef(ref);
    }






    public void configure() {
        super.configure(EtudiantClassRoom.class, EtudiantClassRoomSpecification.class);
    }


    @Autowired
    private EtudiantAdminService etudiantService ;
    @Autowired
    private ClassRoomAdminService classRoomService ;

    public EtudiantClassRoomAdminServiceImpl(EtudiantClassRoomDao dao) {
        super(dao);
    }

}
