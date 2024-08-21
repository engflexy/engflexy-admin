package ma.zs.alc.service.impl.collaborator.collab;


import ma.zs.alc.bean.core.collab.Collaborator;
import ma.zs.alc.bean.core.collab.TypeCollaborator;
import ma.zs.alc.dao.criteria.core.collab.CollaboratorCriteria;
import ma.zs.alc.dao.facade.core.collab.CollaboratorDao;
import ma.zs.alc.dao.specification.core.collab.CollaboratorSpecification;
import ma.zs.alc.service.facade.collaborator.collab.CollaboratorCollaboratorService;
import ma.zs.alc.service.facade.collaborator.collab.InscriptionCollaboratorCollaboratorService;
import ma.zs.alc.service.facade.collaborator.collab.ManagerCollaboratorService;
import ma.zs.alc.service.facade.collaborator.collab.TypeCollaboratorCollaboratorService;
import ma.zs.alc.service.facade.collaborator.course.ParcoursCollaboratorService;
import ma.zs.alc.service.facade.collaborator.grpe.InscriptionCollaboratorService;
import ma.zs.alc.service.impl.collaborator.grpe.InscriptionCollaboratorServiceImpl;
import ma.zs.alc.zynerator.dto.AccountValidationDto;
import ma.zs.alc.zynerator.security.bean.Role;
import ma.zs.alc.zynerator.security.bean.RoleUser;
import ma.zs.alc.zynerator.security.bean.User;
import ma.zs.alc.zynerator.security.common.AuthoritiesConstants;
import ma.zs.alc.zynerator.security.common.SecurityParams;
import ma.zs.alc.zynerator.security.dao.facade.core.UserDao;
import ma.zs.alc.zynerator.security.jwt.JwtUtils;
import ma.zs.alc.zynerator.security.payload.response.JwtResponse;
import ma.zs.alc.zynerator.security.service.facade.ModelPermissionUserService;
import ma.zs.alc.zynerator.security.service.facade.RoleService;
import ma.zs.alc.zynerator.security.service.facade.RoleUserService;
import ma.zs.alc.zynerator.security.service.facade.UserService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.transverse.emailling.EmailRequest;
import ma.zs.alc.zynerator.transverse.emailling.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CollaboratorCollaboratorServiceImpl extends AbstractServiceImpl<Collaborator, CollaboratorCriteria, CollaboratorDao> implements CollaboratorCollaboratorService {


    @Autowired
    private InscriptionCollaboratorServiceImpl inscriptionCollaboratorServiceImpl;

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public boolean deleteById(Long id) {
        modelPermissionUserService.deleteByUserId(id);
        roleUserService.deleteByUserIdForCollaborator(id);
        dao.deleteById(id);
        return true;
    }

    public void findOrSaveAssociatedObject(Collaborator t) {
        if (t != null) {
            t.setTypeCollaborator(typeCollaboratorService.findOrSave(t.getTypeCollaborator()));
        }
    }

    @Override
    public boolean changePassword(String username, String newPassword) {
        Collaborator collaborator = findByUsername(username);
        if (collaborator != null) {
            collaborator.setPassword(newPassword);
            dao.save(collaborator);
            return true;
        }
        return false;
    }

    @Override
    public boolean updatePasswordChangedStatus(Long id, boolean passwordChanged) {
        Collaborator collaborator = findById(id);
        if (collaborator != null) {
            collaborator.setPasswordChanged(passwordChanged);
            dao.save(collaborator);
            return true;
        }
        return false;
    }

    @Override
    public boolean updateCredentialsNonExpiredStatus(Long id, boolean credentialsNonExpired) {
        Collaborator collaborator = findById(id);
        if (collaborator != null) {
            collaborator.setCredentialsNonExpired(credentialsNonExpired);
            dao.save(collaborator);
            return true;
        }
        return false;
    }

    @Override
    public boolean updateAccountStatus(Long id, boolean enabled) {
        Collaborator collaborator = findById(id);
        if (collaborator != null) {
            collaborator.setEnabled(enabled);
            dao.save(collaborator);
            return true;
        }
        return false;
    }

    @Override
    public boolean updateAccountNonExpiredStatus(Long id, boolean accountNonExpired) {
        Collaborator collaborator = findById(id);
        if (collaborator != null) {
            collaborator.setAccountNonExpired(accountNonExpired);
            dao.save(collaborator);
            return true;
        }
        return false;
    }

    @Override
    public boolean updateAccountLockStatus(Long id, boolean accountNonLocked) {
        Collaborator collaborator = findById(id);
        if (collaborator != null) {
            collaborator.setAccountNonLocked(accountNonLocked);
            dao.save(collaborator);
            return true;
        }
        return false;
    }

    public List<Collaborator> findByTypeCollaboratorId(Long id) {
        return dao.findByTypeCollaboratorId(id);
    }

    public int deleteByTypeCollaboratorId(Long id) {
        return dao.deleteByTypeCollaboratorId(id);
    }

    public long countByTypeCollaboratorCode(String code) {
        return dao.countByTypeCollaboratorCode(code);
    }

    @Override
    public boolean findByUsernameAndValidationCode(String username, String validationCode) {
        if (username == null || validationCode == null) {
            return false;
        }
        User user = dao.findByUsername(username);
        return user != null && validationCode.equals(user.getValidationCode());
    }

    public void deleteAssociatedLists(Long id) {
        parcoursService.deleteByCollaboratorId(id);
        managerCollaboratorService.deleteByCollaboratorId(id);
        modelPermissionUserService.deleteByUserId(id);
        roleUserService.deleteByUserId(id);
    }

    @Override
    public ResponseEntity<JwtResponse> validateUser(AccountValidationDto accountValidationDto) {
        String username = accountValidationDto.getUsername();
        String password = accountValidationDto.getPassword();
        String validationCode = accountValidationDto.getValidationCode();
        if (username == null || validationCode == null) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
        Collaborator user = dao.findByUsername(username);
        if (user != null && validationCode.equals(user.getValidationCode())) {
            user.setEnabled(true);
            dao.save(user);
            Authentication authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(username, password));

            SecurityContextHolder.getContext().setAuthentication(authentication);
            String jwt = jwtUtils.generateJwtToken(authentication);
            User userDetails = (User) authentication.getPrincipal();
            List<String> roles = userDetails.getRoleUsers().stream()
                    .map(item -> item.getRole().getAuthority())
                    .collect(Collectors.toList());

            HttpHeaders headers = new HttpHeaders();
            headers.add(SecurityParams.JWT_HEADER_NAME, SecurityParams.HEADER_PREFIX + jwt);
            return ResponseEntity.ok()
                    .headers(headers)
                    .body(new JwtResponse(jwt,
                            userDetails.getId(),
                            userDetails.getUsername(),
                            userDetails.getEmail(),
                            roles));
        }
        return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
    }


    @Override
    public Collaborator create(Collaborator t) {
        return create(t, true);
    }

    @Override
    public Collaborator register(Collaborator t) {
        return create(t, false);
    }


    private Collaborator create(Collaborator t, boolean enable) {
        t.setValidationCode(System.currentTimeMillis() + "");
        System.out.println("hanaaaaa");
        if (findByUsername(t.getUsername()) != null || t.getPassword() == null)
            return null;
        t.setPassword(userService.cryptPassword(t.getPassword()));
        t.setEnabled(enable);
        t.setAccountNonExpired(true);
        t.setAccountNonLocked(true);
        t.setCredentialsNonExpired(true);
        t.setPasswordChanged(false);

        Role role = new Role();
        role.setAuthority(AuthoritiesConstants.COLLABORATOR);
        role.setCreatedAt(LocalDateTime.now());
        /* Role savedRole = roleService.findOrSave(role);*/
        Role savedRole = roleService.findByAuthority(role.getAuthority());

        RoleUser roleUser = new RoleUser();
        roleUser.setRole(savedRole);



        if (t.getRoleUsers() == null) t.setRoleUsers(new ArrayList<>());

        t.getRoleUsers().add(roleUser);

        if (t.getModelPermissionUsers() == null) t.setModelPermissionUsers(new ArrayList<>());

        if (t.getTypeCollaborator() != null) {
            TypeCollaborator type = typeCollaboratorService.findOrSave(t.getTypeCollaborator());
            t.setTypeCollaborator(type);
        }

        //       t.setModelPermissionUsers(modelPermissionUserService.initModelPermissionUser());

        Collaborator mySaved = (Collaborator) dao.save(t);
        roleUser.setUser(mySaved);
        roleUserService.create(roleUser);

        if (t.getParcourss() != null) {
            t.getParcourss().forEach(element -> {
                element.setCollaborator(mySaved);
                parcoursService.create(element);
            });
        }

        System.out.println("t.getValidationCode() = " + t.getValidationCode());
        inscriptionCollaboratorService.createFreeTrial(t);
        emailService.sendSimpleMessage(new EmailRequest("Engflexy Verficiation Code", "Your username is " + t.getUsername() + " your verification code is " + t.getValidationCode(), t.getEmail()));
        return mySaved;
    }

    public Collaborator findByUsername(String username) {
        return dao.findByUsername(username);
    }


    public List<Collaborator> findAllOptimized() {
        return dao.findAllOptimized();
    }


    public void configure() {
        super.configure(Collaborator.class, CollaboratorSpecification.class);
    }

    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    JwtUtils jwtUtils;
    private @Autowired UserService userService;
    private @Autowired UserDao userDao;
    private @Autowired RoleService roleService;
    private @Autowired RoleUserService roleUserService;

    private @Autowired ModelPermissionUserService modelPermissionUserService;

    @Autowired
    private ParcoursCollaboratorService parcoursService;
    @Autowired
    private EmailService emailService;
    @Autowired
    private ManagerCollaboratorService managerCollaboratorService;
    @Autowired
    private TypeCollaboratorCollaboratorService typeCollaboratorService;
    @Autowired
    private InscriptionCollaboratorCollaboratorService inscriptionCollaboratorService;

    public CollaboratorCollaboratorServiceImpl(CollaboratorDao dao) {
        super(dao);
    }

}
