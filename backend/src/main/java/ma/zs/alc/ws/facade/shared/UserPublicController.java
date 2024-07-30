package ma.zs.alc.ws.facade.shared;

import io.swagger.v3.oas.annotations.Operation;
import ma.zs.alc.bean.core.collab.Collaborator;
import ma.zs.alc.service.facade.collaborator.collab.CollaboratorCollaboratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

}
