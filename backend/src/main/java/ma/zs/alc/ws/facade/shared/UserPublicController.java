package ma.zs.alc.ws.facade.shared;

import io.swagger.v3.oas.annotations.Operation;
import ma.zs.alc.bean.core.collab.Collaborator;
import ma.zs.alc.service.facade.collaborator.collab.CollaboratorCollaboratorService;
import ma.zs.alc.zynerator.security.service.facade.UserService;
import ma.zs.alc.zynerator.security.ws.converter.UserConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/public/users/")
public class UserPublicController {
    @Autowired
    private CollaboratorCollaboratorService service;

    @Operation(summary = "Saves the specified  collaborator")
    @PostMapping("")
    public Collaborator save(@RequestBody Collaborator dto) throws Exception {
        return service.create(dto);
    }
    @GetMapping("/validate")
    public ResponseEntity<Boolean> validateUser(
            @RequestParam String username,
            @RequestParam String validationCode) {
        boolean isValid = service.findByUsernameAndValidationCode(username, validationCode);
        return new ResponseEntity<>(isValid, HttpStatus.OK);
    }

}
