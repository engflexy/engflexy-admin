package ma.zs.alc.ws.facade.manager.common;

import io.swagger.v3.oas.annotations.Operation;
import ma.zs.alc.bean.core.common.News;
import ma.zs.alc.dao.criteria.core.common.NewsCriteria;
import ma.zs.alc.service.facade.manager.common.NewsManagerService;
import ma.zs.alc.ws.converter.common.NewsConverter;
import ma.zs.alc.ws.dto.common.NewsDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.dto.FileTempDto;
import ma.zs.alc.zynerator.util.PaginatedList;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/api/manager/news/")
public class NewsRestManager  extends AbstractController<News, NewsDto, NewsCriteria, NewsManagerService, NewsConverter> {



    @Operation(summary = "upload one news")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple newss")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all newss")
    @GetMapping("")
    public ResponseEntity<List<NewsDto>> findAll() throws Exception {
        return super.findAll();
    }

    @Operation(summary = "Finds an optimized list of all newss")
    @GetMapping("optimized")
    public ResponseEntity<List<NewsDto>> findAllOptimized() throws Exception {
        return super.findAllOptimized();
    }

    @Operation(summary = "Finds a news by ref")
    @GetMapping("ref/{ref}")
    public ResponseEntity<NewsDto> findByRef(@PathVariable String ref) {
        return super.findByReferenceEntity(new News(ref));
    }

    @Operation(summary = "Saves the specified  news")
    @PostMapping("")
    public ResponseEntity<NewsDto> save(@RequestBody NewsDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  news")
    @PutMapping("")
    public ResponseEntity<NewsDto> update(@RequestBody NewsDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of news")
    @PostMapping("multiple")
    public ResponseEntity<List<NewsDto>> delete(@RequestBody List<NewsDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified news")
    @DeleteMapping("")
    public ResponseEntity<NewsDto> delete(@RequestBody NewsDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified news")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }

    @Operation(summary = "find by collaborator id")
    @GetMapping("collaborator/id/{id}")
    public List<NewsDto> findByCollaboratorId(@PathVariable Long id){
        return findDtos(service.findByCollaboratorId(id));
    }
    @Operation(summary = "delete by collaborator id")
    @DeleteMapping("collaborator/id/{id}")
    public int deleteByCollaboratorId(@PathVariable Long id){
        return service.deleteByCollaboratorId(id);
    }

    @Operation(summary = "Finds a news and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<NewsDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds newss by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<NewsDto>> findByCriteria(@RequestBody NewsCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated newss by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody NewsCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports newss by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody NewsCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets news data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody NewsCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public NewsRestManager (NewsManagerService service, NewsConverter converter) {
        super(service, converter);
    }




}
