package ma.zs.alc.dao.facade.core.notif;

import ma.zs.alc.bean.core.notif.NotificationActeur;
import ma.zs.alc.zynerator.repository.AbstractRepository;
import org.springframework.data.jpa.repository.Query;


import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface NotificationActeurDao extends AbstractRepository<NotificationActeur,Long> {
    NotificationActeur findByIcon(String icon);
    int deleteByIcon(String icon);


    @Query("SELECT NEW NotificationActeur(item.id,item.title) FROM NotificationActeur item")
    List<NotificationActeur> findAllOptimized();

}
