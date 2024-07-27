package ma.zs.alc.ws.facade.manager.freetrial;

import io.swagger.v3.oas.annotations.Operation;
import ma.zs.alc.bean.core.freetrial.FreeTrialConfiguration;
import ma.zs.alc.dao.criteria.core.freetrial.FreeTrialConfigurationCriteria;
import ma.zs.alc.service.facade.manager.freetrial.FreeTrialConfigurationManagerService;
import ma.zs.alc.ws.converter.freetrial.FreeTrialConfigurationConverter;
import ma.zs.alc.ws.dto.freetrial.FreeTrialConfigurationDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.dto.FileTempDto;
import ma.zs.alc.zynerator.util.PaginatedList;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/api/manager/freeTrialConfiguration/")
public class FreeTrialConfigurationRestManager  extends AbstractController<FreeTrialConfiguration, FreeTrialConfigurationDto, FreeTrialConfigurationCriteria, FreeTrialConfigurationManagerService, FreeTrialConfigurationConverter> {



    @Operation(summary = "upload one freeTrialConfiguration")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple freeTrialConfigurations")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all freeTrialConfigurations")
    @GetMapping("")
    public ResponseEntity<List<FreeTrialConfigurationDto>> findAll() throws Exception {
        return super.findAll();
    }



    @Operation(summary = "Saves the specified  freeTrialConfiguration")
    @PostMapping("")
    public ResponseEntity<FreeTrialConfigurationDto> save(@RequestBody FreeTrialConfigurationDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  freeTrialConfiguration")
    @PutMapping("")
    public ResponseEntity<FreeTrialConfigurationDto> update(@RequestBody FreeTrialConfigurationDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of freeTrialConfiguration")
    @PostMapping("multiple")
    public ResponseEntity<List<FreeTrialConfigurationDto>> delete(@RequestBody List<FreeTrialConfigurationDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified freeTrialConfiguration")
    @DeleteMapping("")
    public ResponseEntity<FreeTrialConfigurationDto> delete(@RequestBody FreeTrialConfigurationDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified freeTrialConfiguration")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }


    @Operation(summary = "Finds a freeTrialConfiguration and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<FreeTrialConfigurationDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds freeTrialConfigurations by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<FreeTrialConfigurationDto>> findByCriteria(@RequestBody FreeTrialConfigurationCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated freeTrialConfigurations by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody FreeTrialConfigurationCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports freeTrialConfigurations by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody FreeTrialConfigurationCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets freeTrialConfiguration data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody FreeTrialConfigurationCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public FreeTrialConfigurationRestManager (FreeTrialConfigurationManagerService service, FreeTrialConfigurationConverter converter) {
        super(service, converter);
    }




}
