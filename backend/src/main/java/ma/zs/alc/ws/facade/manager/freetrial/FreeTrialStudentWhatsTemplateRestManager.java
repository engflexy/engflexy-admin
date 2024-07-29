package ma.zs.alc.ws.facade.manager.freetrial;

import io.swagger.v3.oas.annotations.Operation;
import ma.zs.alc.bean.core.freetrial.FreeTrialStudentWhatsTemplate;
import ma.zs.alc.dao.criteria.core.freetrial.FreeTrialStudentWhatsTemplateCriteria;
import ma.zs.alc.service.facade.manager.freetrial.FreeTrialStudentWhatsTemplateManagerService;
import ma.zs.alc.ws.converter.freetrial.FreeTrialStudentWhatsTemplateConverter;
import ma.zs.alc.ws.dto.freetrial.FreeTrialStudentWhatsTemplateDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.dto.FileTempDto;
import ma.zs.alc.zynerator.util.PaginatedList;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/api/manager/freeTrialStudentWhatsTemplate/")
public class FreeTrialStudentWhatsTemplateRestManager  extends AbstractController<FreeTrialStudentWhatsTemplate, FreeTrialStudentWhatsTemplateDto, FreeTrialStudentWhatsTemplateCriteria, FreeTrialStudentWhatsTemplateManagerService, FreeTrialStudentWhatsTemplateConverter> {



    @Operation(summary = "upload one freeTrialStudentWhatsTemplate")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple freeTrialStudentWhatsTemplates")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all freeTrialStudentWhatsTemplates")
    @GetMapping("")
    public ResponseEntity<List<FreeTrialStudentWhatsTemplateDto>> findAll() throws Exception {
        return super.findAll();
    }



    @Operation(summary = "Saves the specified  freeTrialStudentWhatsTemplate")
    @PostMapping("")
    public ResponseEntity<FreeTrialStudentWhatsTemplateDto> save(@RequestBody FreeTrialStudentWhatsTemplateDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  freeTrialStudentWhatsTemplate")
    @PutMapping("")
    public ResponseEntity<FreeTrialStudentWhatsTemplateDto> update(@RequestBody FreeTrialStudentWhatsTemplateDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of freeTrialStudentWhatsTemplate")
    @PostMapping("multiple")
    public ResponseEntity<List<FreeTrialStudentWhatsTemplateDto>> delete(@RequestBody List<FreeTrialStudentWhatsTemplateDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified freeTrialStudentWhatsTemplate")
    @DeleteMapping("")
    public ResponseEntity<FreeTrialStudentWhatsTemplateDto> delete(@RequestBody FreeTrialStudentWhatsTemplateDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified freeTrialStudentWhatsTemplate")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }


    @Operation(summary = "Finds a freeTrialStudentWhatsTemplate and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<FreeTrialStudentWhatsTemplateDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds freeTrialStudentWhatsTemplates by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<FreeTrialStudentWhatsTemplateDto>> findByCriteria(@RequestBody FreeTrialStudentWhatsTemplateCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated freeTrialStudentWhatsTemplates by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody FreeTrialStudentWhatsTemplateCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports freeTrialStudentWhatsTemplates by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody FreeTrialStudentWhatsTemplateCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets freeTrialStudentWhatsTemplate data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody FreeTrialStudentWhatsTemplateCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public FreeTrialStudentWhatsTemplateRestManager (FreeTrialStudentWhatsTemplateManagerService service, FreeTrialStudentWhatsTemplateConverter converter) {
        super(service, converter);
    }




}
