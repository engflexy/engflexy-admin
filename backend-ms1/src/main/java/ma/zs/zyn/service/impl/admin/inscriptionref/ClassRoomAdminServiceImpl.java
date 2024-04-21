package ma.zs.zyn.service.impl.admin.inscriptionref;


import ma.zs.zyn.bean.core.inscriptionref.ClassRoom;
import ma.zs.zyn.dao.criteria.core.inscriptionref.ClassRoomCriteria;
import ma.zs.zyn.dao.facade.core.inscriptionref.ClassRoomDao;
import ma.zs.zyn.dao.specification.core.inscriptionref.ClassRoomSpecification;
import ma.zs.zyn.service.facade.admin.inscriptionref.ClassRoomAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class ClassRoomAdminServiceImpl extends AbstractServiceImpl<ClassRoom, ClassRoomCriteria, ClassRoomDao> implements ClassRoomAdminService {






    public ClassRoom findByReferenceEntity(ClassRoom t){
        return  dao.findByLibelle(t.getLibelle());
    }


    public List<ClassRoom> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(ClassRoom.class, ClassRoomSpecification.class);
    }



    public ClassRoomAdminServiceImpl(ClassRoomDao dao) {
        super(dao);
    }

}
