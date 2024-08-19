package ma.zs.alc.zynerator.security.dao.facade.core;

import ma.zs.alc.zynerator.repository.AbstractRepository;
import ma.zs.alc.zynerator.security.bean.User;
import ma.zs.alc.zynerator.security.ws.dto.UserDto;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UserDao extends AbstractRepository<User,Long>  {
    User findByEmail(String email);
    int deleteByEmail(String email);
    User findByUsername(String username);
    int deleteByUsername(String username);


    @Query("SELECT NEW User(item.id,item.email) FROM User item")
    List<User> findAllOptimized();

    User findUserById(Long id);
    
    
    //////////////
    @Query("SELECT u FROM User u WHERE u.id <> ?1")
	List<User> findAllUsersExceptThisUserId(Long id);
}
