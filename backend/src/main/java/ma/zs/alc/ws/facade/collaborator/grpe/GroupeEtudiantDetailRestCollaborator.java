package  ma.zs.alc.ws.facade.collaborator.grpe;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

import ma.zs.alc.bean.core.grpe.GroupeEtudiantDetail;
import ma.zs.alc.dao.criteria.core.grpe.GroupeEtudiantDetailCriteria;
import ma.zs.alc.service.facade.collaborator.grpe.GroupeEtudiantDetailCollaboratorService;
import ma.zs.alc.ws.converter.grpe.GroupeEtudiantConverter;
import ma.zs.alc.ws.converter.grpe.GroupeEtudiantDetailConverter;
import ma.zs.alc.ws.converter.inscription.EtudiantConverter;
import ma.zs.alc.ws.dto.grpe.GroupeEtudiantDetailDto;
import ma.zs.alc.ws.dto.inscription.EtudiantDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.dto.AuditEntityDto;
import ma.zs.alc.zynerator.util.PaginatedList;


import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import ma.zs.alc.zynerator.process.Result;


import org.springframework.web.multipart.MultipartFile;
import ma.zs.alc.zynerator.dto.FileTempDto;

@RestController
@RequestMapping("/api/collaborator/groupeEtudiantDetail/")
public class GroupeEtudiantDetailRestCollaborator  extends AbstractController<GroupeEtudiantDetail, GroupeEtudiantDetailDto, GroupeEtudiantDetailCriteria, GroupeEtudiantDetailCollaboratorService, GroupeEtudiantDetailConverter> {


    private final EtudiantConverter etudiantConverter;

    @Operation(summary = "upload one groupeEtudiantDetail")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple groupeEtudiantDetails")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all groupeEtudiantDetails")
    @GetMapping("")
    public ResponseEntity<List<GroupeEtudiantDetailDto>> findAll() throws Exception {
        return super.findAll();
    }



    @Operation(summary = "Saves the specified  groupeEtudiantDetail")
    @PostMapping("")
    public ResponseEntity<GroupeEtudiantDetailDto> save(@RequestBody GroupeEtudiantDetailDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  groupeEtudiantDetail")
    @PutMapping("")
    public ResponseEntity<GroupeEtudiantDetailDto> update(@RequestBody GroupeEtudiantDetailDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of groupeEtudiantDetail")
    @PostMapping("multiple")
    public ResponseEntity<List<GroupeEtudiantDetailDto>> delete(@RequestBody List<GroupeEtudiantDetailDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified groupeEtudiantDetail")
    @DeleteMapping("")
    public ResponseEntity<GroupeEtudiantDetailDto> delete(@RequestBody GroupeEtudiantDetailDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified groupeEtudiantDetail")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }
    @Operation(summary = "Delete multiple groupeEtudiantDetails by ids")
    @DeleteMapping("multiple/id")
    public ResponseEntity<List<Long>> deleteByIdIn(@RequestBody List<Long> ids) throws Exception {
            return super.deleteByIdIn(ids);
     }


    @Operation(summary = "find by groupeEtudiant id")
    @GetMapping("groupeEtudiant/id/{id}")
    public List<GroupeEtudiantDetailDto> findByGroupeEtudiantId(@PathVariable Long id){
        GroupeEtudiantDetailConverter myConverter = (GroupeEtudiantDetailConverter) this.converter;
        etudiantConverter.init(false);
        myConverter.setEtudiant(true);
        myConverter.setGroupeEtudiant(false);
        return findDtos(service.findByGroupeEtudiantId(id));
    }
    @Operation(summary = "find by groupeEtudiant prof username")
    @GetMapping("username/{email}")
    public List<EtudiantDto> findByGroupeEtudiantProfUsername(@PathVariable String email) {
        System.out.println("Received email: " + email);

        GroupeEtudiantDetailConverter myConverter = (GroupeEtudiantDetailConverter) this.converter;
        etudiantConverter.init(false);
        myConverter.setEtudiant(true);  // Focus on converting etudiant
        myConverter.setGroupeEtudiant(false);  // Ignore groupeEtudiant conversion

        List<GroupeEtudiantDetailDto> groupeEtudiantDetails = findDtos(service.findByGroupeEtudiantProfUsername(email));

        // Extract the etudiant part from each GroupeEtudiantDetailDto
        return groupeEtudiantDetails.stream()
                .map(GroupeEtudiantDetailDto::getEtudiant)
                .collect(Collectors.toList());
    }
    @Operation(summary = "delete by groupeEtudiant id")
    @DeleteMapping("groupeEtudiant/id/{id}")
    public int deleteByGroupeEtudiantId(@PathVariable Long id){
        return service.deleteByGroupeEtudiantId(id);
    }
    @Operation(summary = "find by etudiant id")
    @GetMapping("etudiant/id/{id}")
    public List<GroupeEtudiantDetailDto> findByEtudiantId(@PathVariable Long id){
        List<GroupeEtudiantDetail> byEtudiantId = service.findByEtudiantId(id);
        GroupeEtudiantDetailConverter groupeEtudiantDetailConverter = (GroupeEtudiantDetailConverter) converter;
        groupeEtudiantDetailConverter.setEtudiant(true);
        groupeEtudiantDetailConverter.setGroupeEtudiant(true);
        groupeEtudiantConverter.init(false);
        return findDtos(byEtudiantId);
    }


    @Operation(summary = "delete by etudiant id")
    @DeleteMapping("etudiant/id/{id}")
    public int deleteByEtudiantId(@PathVariable Long id){
        return service.deleteByEtudiantId(id);
    }

    @Operation(summary = "Finds a groupeEtudiantDetail and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<GroupeEtudiantDetailDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds groupeEtudiantDetails by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<GroupeEtudiantDetailDto>> findByCriteria(@RequestBody GroupeEtudiantDetailCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated groupeEtudiantDetails by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody GroupeEtudiantDetailCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports groupeEtudiantDetails by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody GroupeEtudiantDetailCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets groupeEtudiantDetail data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody GroupeEtudiantDetailCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public GroupeEtudiantDetailRestCollaborator (GroupeEtudiantDetailCollaboratorService service, GroupeEtudiantDetailConverter converter, EtudiantConverter etudiantConverter) {
        super(service, converter);
        this.etudiantConverter = etudiantConverter;
    }

 @Autowired
    private GroupeEtudiantConverter groupeEtudiantConverter ;


}
