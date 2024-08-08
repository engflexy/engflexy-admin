package ma.zs.alc.zynerator.security.service.impl;


import ma.zs.alc.bean.core.chat.Conversation;
import ma.zs.alc.dao.facade.core.chat.ConversationRepository;
import ma.zs.alc.zynerator.security.bean.ModelPermissionUser;
import ma.zs.alc.zynerator.security.bean.RoleUser;
import ma.zs.alc.zynerator.security.bean.User;
import ma.zs.alc.zynerator.security.dao.criteria.core.UserCriteria;
import ma.zs.alc.zynerator.security.dao.facade.core.UserDao;
import ma.zs.alc.zynerator.security.dao.specification.core.UserSpecification;
import ma.zs.alc.zynerator.security.service.facade.*;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl extends AbstractServiceImpl<User, UserCriteria, UserDao> implements UserService {
	
    private final ConversationRepository conversationRepository;

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public User create(User t) {
        User foundedUserByUsername = findByUsername(t.getUsername());
        User foundedUserByEmail = dao.findByEmail(t.getEmail());

        if (foundedUserByUsername != null || foundedUserByEmail != null) {
            throw new RuntimeException("Email already exist.");
        } else {
            if (t.getPassword() == null || t.getPassword().isEmpty()) {
                t.setPassword(bCryptPasswordEncoder.encode(t.getUsername()));
            } else {
                t.setPassword(bCryptPasswordEncoder.encode(t.getPassword()));
            }
            t.setAccountNonExpired(true);
            t.setAccountNonLocked(true);
            t.setCredentialsNonExpired(true);
            t.setEnabled(true);
            t.setPasswordChanged(false);
            t.setCreatedAt(LocalDateTime.now());
            super.create(t);
            if (t.getModelPermissionUsers() != null) {
                t.getModelPermissionUsers().forEach(e -> {
                    e.setUser(t);
                });
                modelPermissionUserService.update(t.getModelPermissionUsers(), true);
            }
            if (t.getRoleUsers() != null) {
                t.getRoleUsers().forEach(element -> {
                    element.setUser(t);
                });
                roleUserService.update(t.getRoleUsers(), true);
            }
            return t;
        }

    }

    public User findWithAssociatedLists(Long id) {
        User result = dao.findUserById(id);
//        if (result != null && result.getId() != null) {
//            result.setRoleUsers(roleUserService.findByUserId(id));
//        }
        return result;
    }

    @Transactional
    public void deleteAssociatedLists(Long id) {
        modelPermissionUserService.deleteByUserId(id);
        roleUserService.deleteByUserId(id);
    }


    public void updateWithAssociatedLists(User user) {
        if (user != null && user.getId() != null) {
            List<List<ModelPermissionUser>> resultModelPermissionUsers = modelPermissionUserService.getToBeSavedAndToBeDeleted(modelPermissionUserService.findByUserId(user.getId()), user.getModelPermissionUsers());
            modelPermissionUserService.delete(resultModelPermissionUsers.get(1));
            ListUtil.emptyIfNull(resultModelPermissionUsers.get(0)).forEach(e -> e.setUser(user));
            modelPermissionUserService.update(resultModelPermissionUsers.get(0), true);
            List<List<RoleUser>> resultRoleUsers = roleUserService.getToBeSavedAndToBeDeleted(roleUserService.findByUserId(user.getId()), user.getRoleUsers());
            roleUserService.delete(resultRoleUsers.get(1));
            ListUtil.emptyIfNull(resultRoleUsers.get(0)).forEach(e -> e.setUser(user));
            roleUserService.update(resultRoleUsers.get(0), true);
        }
    }



    public User findByReferenceEntity(User t) {
        return dao.findByEmail(t.getEmail());
    }

    @Override
    public User findByUsername(String username) {
        if (username == null)
            return null;
        return dao.findByUsername(username);
    }
    @Override
    public boolean findByUsernameAndValidationCode(String username,String validationCode){
        if (username == null || validationCode == null) {
            return false;
        }
        User user = dao.findByUsername(username);
        return user != null && validationCode.equals(user.getValidationCode());
    }
    public List<User> findAllOptimized() {
        return dao.findAllOptimized();
    }


    @Override
    public String cryptPassword(String value) {
        return value;
//        return value == null ? null : bCryptPasswordEncoder.encode(value);
    }

    @Override
    public boolean changePassword(String username, String newPassword) {
        User user = dao.findByUsername(username);
        if (user != null) {
            user.setPassword(cryptPassword(newPassword));
            user.setPasswordChanged(true);
            dao.save(user);
            return true;
        }
        return false;
    }

    @Override
    public User findByUsernameWithRoles(String username) {
        if (username == null)
            return null;
        return dao.findByUsername(username);
    }

    @Override
    @Transactional
    public int deleteByUsername(String username) {
        return dao.deleteByUsername(username);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return findByUsernameWithRoles(username);
    }

    public void configure() {
        super.configure(User.class, UserSpecification.class);
    }


    @Autowired
    private RoleUserService roleUserService;
    @Autowired
    private ModelPermissionService modelPermissionService;
    @Autowired
    private ActionPermissionService actionPermissionService;
    @Autowired
    private ModelPermissionUserService modelPermissionUserService;
    @Autowired
    private RoleService roleService;

    @Lazy
    @Autowired
    PasswordEncoder bCryptPasswordEncoder;


    public UserServiceImpl(UserDao dao, ConversationRepository conversationRepository) {
        super(dao);
    	this.conversationRepository = conversationRepository;
    }

    ////////////////////////////////////////////////
    @Override
    public List<User> findAllUsersExceptThisUserId(Long userId) {
        List<User> list = dao.findAllUsersExceptThisUserId(userId);
        //ApiResponse response = new ApiResponse(200, "Success", "OK", list);
        return list;
    }

    @Override
    public Long findConversationIdByUser1IdAndUser2Id(Long user1Id, Long user2Id) {
        Long conversationId;
        Optional<User> user1 = dao.findById(user1Id);
        Optional<User> user2 = dao.findById(user2Id);
        if (user1.isEmpty() || user2.isEmpty()) {
            //ApiResponse response = new ApiResponse(200, "Failed", "User not found", null);
            //return new ResponseEntity<>(response, HttpStatus.OK);
        	return 0L;
        }

        Optional<Conversation> existingConversation = conversationRepository.findConversationByUsers(user1.get(), user2.get());
        if (existingConversation.isPresent()) {
            conversationId = existingConversation.get().getId();
        } else {
            Conversation newConversation = new Conversation();
            newConversation.setUser1(user1.get());
            newConversation.setUser2(user2.get());
            Conversation savedConversation = conversationRepository.save(newConversation);
            conversationId = savedConversation.getId();
        }
        //ApiResponse response = new ApiResponse(200, "Success", "OK", conversationId);
        //return new ResponseEntity<>(response, HttpStatus.OK);
        return conversationId;

    }

    ///////////////////////////////////////
}
