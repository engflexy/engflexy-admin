package ma.zs.alc.zynerator.security.service.facade;

import ma.zs.alc.zynerator.security.dao.criteria.core.UserCriteria;
import ma.zs.alc.ws.dto.chat.ApiResponse;
import ma.zs.alc.zynerator.security.bean.User;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import ma.zs.alc.zynerator.service.IService;

public interface UserService extends IService<User, UserCriteria>, UserDetailsService {

    User findByUsername(String username);

    User findByUsernameWithRoles(String username);

    String cryptPassword(String value);

    boolean changePassword(String username, String newPassword);

    int deleteByUsername(String username);

    UserDetails loadUserByUsername(String username);

    ///////////////////////
    
    ResponseEntity<ApiResponse> findAllUsersExceptThisUserId(Long id);

	ResponseEntity<ApiResponse> findConversationIdByUser1IdAndUser2Id(Long user1Iidd, Long user2Id);

}
