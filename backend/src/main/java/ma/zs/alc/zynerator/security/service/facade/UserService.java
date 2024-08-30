package ma.zs.alc.zynerator.security.service.facade;

import ma.zs.alc.zynerator.dto.AccountValidationDto;
import ma.zs.alc.zynerator.security.dao.criteria.core.UserCriteria;
import ma.zs.alc.zynerator.security.ws.dto.UserDto;
import ma.zs.alc.bean.core.chat.Conversation;
import ma.zs.alc.ws.dto.chat.ApiResponse;
import ma.zs.alc.ws.dto.chat.ConversationResponse;
import ma.zs.alc.zynerator.security.bean.User;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

import ma.zs.alc.zynerator.service.IService;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public interface UserService extends IService<User, UserCriteria>, UserDetailsService {

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    User register(User t);

    User findByUsername(String username);

    User findByUsernameWithRoles(String username);

    boolean findByUsernameAndValidationCode(String username, String validationCode);

    String cryptPassword(String value);

    User save(User user);

    boolean changePassword(String username, String newPassword);

    int deleteByUsername(String username);

    UserDetails loadUserByUsername(String username);

    ///////////////////////
    
    List<User> findAllUsersExceptThisUserId(Long id);

    Long findConversationIdByUser1IdAndUser2Id(Long user1Iidd, Long user2Id);
    
	List<ConversationResponse> findConversationsByUserId(Long userId);

    boolean validateUser(AccountValidationDto accountValidationDto);
}
