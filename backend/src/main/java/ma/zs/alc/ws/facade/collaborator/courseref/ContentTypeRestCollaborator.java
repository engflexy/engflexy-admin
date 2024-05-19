package  ma.zs.alc.ws.facade.collaborator.courseref;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

import ma.zs.alc.bean.core.courseref.ContentType;
import ma.zs.alc.dao.criteria.core.courseref.ContentTypeCriteria;
import ma.zs.alc.service.facade.collaborator.courseref.ContentTypeCollaboratorService;
import ma.zs.alc.ws.converter.courseref.ContentTypeConverter;
import ma.zs.alc.ws.dto.courseref.ContentTypeDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.dto.AuditEntityDto;
import ma.zs.alc.zynerator.util.PaginatedList;


import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import ma.zs.alc.zynerator.process.Result;


import org.springframework.web.multipart.MultipartFile;
import ma.zs.alc.zynerator.dto.FileTempDto;

@RestController
@RequestMapping("/api/collaborator/contentType/")
public class ContentTypeRestCollaborator  extends AbstractController<ContentType, ContentTypeDto, ContentTypeCriteria, ContentTypeCollaboratorService, ContentTypeConverter> {



    @Operation(summary = "upload one contentType")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple contentTypes")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all contentTypes")
    @GetMapping("")
    public ResponseEntity<List<ContentTypeDto>> findAll() throws Exception {
        return super.findAll();
    }

    @Operation(summary = "Finds an optimized list of all contentTypes")
    @GetMapping("optimized")
    public ResponseEntity<List<ContentTypeDto>> findAllOptimized() throws Exception {
        return super.findAllOptimized();
    }

    @Operation(summary = "Finds a contentType by libelle")
    @GetMapping("libelle/{libelle}")
    public ResponseEntity<ContentTypeDto> findByLibelle(@PathVariable String libelle) {
        return super.findByReferenceEntity(new ContentType(libelle));
    }

    @Operation(summary = "Saves the specified  contentType")
    @PostMapping("")
    public ResponseEntity<ContentTypeDto> save(@RequestBody ContentTypeDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  contentType")
    @PutMapping("")
    public ResponseEntity<ContentTypeDto> update(@RequestBody ContentTypeDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of contentType")
    @PostMapping("multiple")
    public ResponseEntity<List<ContentTypeDto>> delete(@RequestBody List<ContentTypeDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified contentType")
    @DeleteMapping("")
    public ResponseEntity<ContentTypeDto> delete(@RequestBody ContentTypeDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified contentType")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }
    @Operation(summary = "Delete multiple contentTypes by ids")
    @DeleteMapping("multiple/id")
    public ResponseEntity<List<Long>> deleteByIdIn(@RequestBody List<Long> ids) throws Exception {
            return super.deleteByIdIn(ids);
     }



    @Operation(summary = "Finds a contentType and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<ContentTypeDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds contentTypes by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<ContentTypeDto>> findByCriteria(@RequestBody ContentTypeCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated contentTypes by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody ContentTypeCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports contentTypes by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody ContentTypeCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets contentType data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody ContentTypeCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public ContentTypeRestCollaborator (ContentTypeCollaboratorService service, ContentTypeConverter converter) {
        super(service, converter);
    }




}
