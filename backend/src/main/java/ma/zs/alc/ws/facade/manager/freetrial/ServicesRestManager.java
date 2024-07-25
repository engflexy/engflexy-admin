package ma.zs.alc.ws.facade.manager.freetrial;

import io.swagger.v3.oas.annotations.Operation;
import ma.zs.alc.bean.core.freetrial.Services;
import ma.zs.alc.dao.criteria.core.freetrial.ServicesCriteria;
import ma.zs.alc.service.facade.manager.freetrial.ServicesManagerService;
import ma.zs.alc.ws.converter.freetrial.ServicesConverter;
import ma.zs.alc.ws.dto.freetrial.ServicesDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.dto.FileTempDto;
import ma.zs.alc.zynerator.util.PaginatedList;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/api/manager/services/")
public class ServicesRestManager  extends AbstractController<Services, ServicesDto, ServicesCriteria, ServicesManagerService, ServicesConverter> {



    @Operation(summary = "upload one services")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple servicess")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all servicess")
    @GetMapping("")
    public ResponseEntity<List<ServicesDto>> findAll() throws Exception {
        return super.findAll();
    }

    @Operation(summary = "Finds an optimized list of all servicess")
    @GetMapping("optimized")
    public ResponseEntity<List<ServicesDto>> findAllOptimized() throws Exception {
        return super.findAllOptimized();
    }

    @Operation(summary = "Finds a services by libelle")
    @GetMapping("libelle/{libelle}")
    public ResponseEntity<ServicesDto> findByLibelle(@PathVariable String libelle) {
        return super.findByReferenceEntity(new Services(libelle));
    }

    @Operation(summary = "Saves the specified  services")
    @PostMapping("")
    public ResponseEntity<ServicesDto> save(@RequestBody ServicesDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  services")
    @PutMapping("")
    public ResponseEntity<ServicesDto> update(@RequestBody ServicesDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of services")
    @PostMapping("multiple")
    public ResponseEntity<List<ServicesDto>> delete(@RequestBody List<ServicesDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified services")
    @DeleteMapping("")
    public ResponseEntity<ServicesDto> delete(@RequestBody ServicesDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified services")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }


    @Operation(summary = "Finds a services and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<ServicesDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds servicess by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<ServicesDto>> findByCriteria(@RequestBody ServicesCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated servicess by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody ServicesCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports servicess by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody ServicesCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets services data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody ServicesCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public ServicesRestManager (ServicesManagerService service, ServicesConverter converter) {
        super(service, converter);
    }




}
