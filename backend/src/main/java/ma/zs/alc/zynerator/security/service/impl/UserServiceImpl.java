package ma.zs.alc.zynerator.security.service.impl;


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

@Service
public class UserServiceImpl extends AbstractServiceImpl<User, UserCriteria, UserDao> implements UserService {


    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public User create(User t) {
        User foundedUserByUsername = findByUsername(t.getUsername());
        User foundedUserByEmail = dao.findByEmail(t.getEmail());

        if (foundedUserByUsername != null || foundedUserByEmail != null) {
            throw new RuntimeException("Email already exist.");
        } else {
            if (t.getPassword() == null || t.getPassword().isEmpty()) {
                t.setPassword(t.getUsername());
            } else {
                t.setPassword(t.getPassword());
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
                roleUserService.update(t.getRoleUsers(),true);
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


    public UserServiceImpl(UserDao dao) {
        super(dao);
    }

}
