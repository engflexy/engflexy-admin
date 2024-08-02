package ma.zs.alc.zynerator.security.dao.facade.core;

import ma.zs.alc.zynerator.repository.AbstractRepository;
import ma.zs.alc.zynerator.security.bean.RoleUser;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface RoleUserDao extends AbstractRepository<RoleUser,Long>  {

    List<RoleUser> findByRoleId(Long id);
    int deleteByRoleId(Long id);
    long countByRoleAuthority(String authority);
    List<RoleUser> findByUserId(Long id);
    int deleteByUserId(Long id);
    long countByUserEmail(String email);
    @Modifying
    @Query("delete from RoleUser ru WHERE ru.user.id = :id")
    int deleteByUserIdForCollaborator(@Param("id") Long id);
}
