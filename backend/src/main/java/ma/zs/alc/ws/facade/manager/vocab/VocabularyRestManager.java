package ma.zs.alc.ws.facade.manager.vocab;

import io.swagger.v3.oas.annotations.Operation;
import ma.zs.alc.bean.core.vocab.Vocabulary;
import ma.zs.alc.dao.criteria.core.vocab.VocabularyCriteria;
import ma.zs.alc.service.facade.manager.vocab.VocabularyManagerService;
import ma.zs.alc.ws.converter.vocab.VocabularyConverter;
import ma.zs.alc.ws.dto.vocab.VocabularyDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.dto.FileTempDto;
import ma.zs.alc.zynerator.util.PaginatedList;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/api/manager/vocabulary/")
public class VocabularyRestManager extends AbstractController<Vocabulary, VocabularyDto, VocabularyCriteria, VocabularyManagerService, VocabularyConverter> {


    @Operation(summary = "upload one vocabulary")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }

    @Operation(summary = "upload multiple vocabularys")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all vocabularys")
    @GetMapping("")
    public ResponseEntity<List<VocabularyDto>> findAll() throws Exception {
        return super.findAll();
    }


    @Operation(summary = "Saves the specified  vocabulary")
    @PostMapping("")
    public ResponseEntity<VocabularyDto> save(@RequestBody VocabularyDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  vocabulary")
    @PutMapping("")
    public ResponseEntity<VocabularyDto> update(@RequestBody VocabularyDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of vocabulary")
    @PostMapping("multiple")
    public ResponseEntity<List<VocabularyDto>> delete(@RequestBody List<VocabularyDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }

    @Operation(summary = "Delete the specified vocabulary")
    @DeleteMapping("")
    public ResponseEntity<VocabularyDto> delete(@RequestBody VocabularyDto dto) throws Exception {
        return super.delete(dto);
    }

    @Operation(summary = "Delete the specified vocabulary")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }

    @Operation(summary = "find by section id")
    @GetMapping("section/id/{id}")
    public List<VocabularyDto> findBySectionId(@PathVariable Long id) {
        return findDtos(service.findBySectionId(id));
    }

    @Operation(summary = "delete by section id")
    @DeleteMapping("section/id/{id}")
    public int deleteBySectionId(@PathVariable Long id) {
        return service.deleteBySectionId(id);
    }
    
    @Operation(summary = "Finds a vocabulary and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<VocabularyDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds vocabularys by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<VocabularyDto>> findByCriteria(@RequestBody VocabularyCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated vocabularys by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody VocabularyCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports vocabularys by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody VocabularyCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets vocabulary data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody VocabularyCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }


    public VocabularyRestManager(VocabularyManagerService service, VocabularyConverter converter) {
        super(service, converter);
    }


}
