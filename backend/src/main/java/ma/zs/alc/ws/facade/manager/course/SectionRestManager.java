package ma.zs.alc.ws.facade.manager.course;

import io.swagger.v3.oas.annotations.Operation;
import ma.zs.alc.bean.core.course.Section;
import ma.zs.alc.dao.criteria.core.course.SectionCriteria;
import ma.zs.alc.service.facade.manager.course.SectionManagerService;
import ma.zs.alc.ws.converter.course.SectionConverter;
import ma.zs.alc.ws.dto.course.SectionDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.dto.FileTempDto;
import ma.zs.alc.zynerator.util.PaginatedList;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/api/manager/section/")
public class SectionRestManager  extends AbstractController<Section, SectionDto, SectionCriteria, SectionManagerService, SectionConverter> {



    @Operation(summary = "upload one section")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple sections")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all sections")
    @GetMapping("")
    public ResponseEntity<List<SectionDto>> findAll() throws Exception {
        return super.findAll();
    }

    @Operation(summary = "Finds an optimized list of all sections")
    @GetMapping("optimized")
    public ResponseEntity<List<SectionDto>> findAllOptimized() throws Exception {
        return super.findAllOptimized();
    }

    @Operation(summary = "Finds a section by libelle")
    @GetMapping("libelle/{libelle}")
    public ResponseEntity<SectionDto> findByLibelle(@PathVariable String libelle) {
        return super.findByReferenceEntity(new Section(libelle));
    }

    @Operation(summary = "Saves the specified  section")
    @PostMapping("")
    public ResponseEntity<SectionDto> save(@RequestBody SectionDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  section")
    @PutMapping("")
    public ResponseEntity<SectionDto> update(@RequestBody SectionDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of section")
    @PostMapping("multiple")
    public ResponseEntity<List<SectionDto>> delete(@RequestBody List<SectionDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified section")
    @DeleteMapping("")
    public ResponseEntity<SectionDto> delete(@RequestBody SectionDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified section")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }


    @Operation(summary = "Finds a section and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<SectionDto> findById(@PathVariable Long id) {
        return super.findWithAssociatedLists(id);
    }

    @Operation(summary = "Finds sections by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<SectionDto>> findByCriteria(@RequestBody SectionCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated sections by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody SectionCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports sections by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody SectionCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets section data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody SectionCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public SectionRestManager (SectionManagerService service, SectionConverter converter) {
        super(service, converter);
    }




}
