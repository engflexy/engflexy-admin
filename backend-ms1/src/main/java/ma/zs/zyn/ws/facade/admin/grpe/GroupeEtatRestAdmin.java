package  ma.zs.zyn.ws.facade.admin.grpe;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

import ma.zs.zyn.bean.core.grpe.GroupeEtat;
import ma.zs.zyn.dao.criteria.core.grpe.GroupeEtatCriteria;
import ma.zs.zyn.service.facade.admin.grpe.GroupeEtatAdminService;
import ma.zs.zyn.ws.converter.grpe.GroupeEtatConverter;
import ma.zs.zyn.ws.dto.grpe.GroupeEtatDto;
import ma.zs.zyn.zynerator.controller.AbstractController;
import ma.zs.zyn.zynerator.dto.AuditEntityDto;
import ma.zs.zyn.zynerator.util.PaginatedList;


import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import ma.zs.zyn.zynerator.process.Result;


import org.springframework.web.multipart.MultipartFile;
import ma.zs.zyn.zynerator.dto.FileTempDto;

@RestController
@RequestMapping("/api/admin/groupeEtat/")
public class GroupeEtatRestAdmin  extends AbstractController<GroupeEtat, GroupeEtatDto, GroupeEtatCriteria, GroupeEtatAdminService, GroupeEtatConverter> {



    @Operation(summary = "upload one groupeEtat")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple groupeEtats")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all groupeEtats")
    @GetMapping("")
    public ResponseEntity<List<GroupeEtatDto>> findAll() throws Exception {
        return super.findAll();
    }

    @Operation(summary = "Finds an optimized list of all groupeEtats")
    @GetMapping("optimized")
    public ResponseEntity<List<GroupeEtatDto>> findAllOptimized() throws Exception {
        return super.findAllOptimized();
    }

    @Operation(summary = "Finds a groupeEtat by libelle")
    @GetMapping("libelle/{libelle}")
    public ResponseEntity<GroupeEtatDto> findByLibelle(@PathVariable String libelle) {
        return super.findByReferenceEntity(new GroupeEtat(libelle));
    }

    @Operation(summary = "Saves the specified  groupeEtat")
    @PostMapping("")
    public ResponseEntity<GroupeEtatDto> save(@RequestBody GroupeEtatDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  groupeEtat")
    @PutMapping("")
    public ResponseEntity<GroupeEtatDto> update(@RequestBody GroupeEtatDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of groupeEtat")
    @PostMapping("multiple")
    public ResponseEntity<List<GroupeEtatDto>> delete(@RequestBody List<GroupeEtatDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified groupeEtat")
    @DeleteMapping("")
    public ResponseEntity<GroupeEtatDto> delete(@RequestBody GroupeEtatDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified groupeEtat")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }
    @Operation(summary = "Delete multiple groupeEtats by ids")
    @DeleteMapping("multiple/id")
    public ResponseEntity<List<Long>> deleteByIdIn(@RequestBody List<Long> ids) throws Exception {
            return super.deleteByIdIn(ids);
     }



    @Operation(summary = "Finds a groupeEtat and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<GroupeEtatDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds groupeEtats by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<GroupeEtatDto>> findByCriteria(@RequestBody GroupeEtatCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated groupeEtats by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody GroupeEtatCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports groupeEtats by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody GroupeEtatCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets groupeEtat data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody GroupeEtatCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public GroupeEtatRestAdmin (GroupeEtatAdminService service, GroupeEtatConverter converter) {
        super(service, converter);
    }




}
