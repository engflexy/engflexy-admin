package ma.zs.alc.ws.facade.admin.notif;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import ma.zs.alc.bean.core.notif.NotificationActeur;
import ma.zs.alc.dao.criteria.core.notif.NotificationActeurCriteria;
import ma.zs.alc.service.facade.admin.notif.NotificationActeurAdminService;
import ma.zs.alc.ws.converter.notif.NotificationActeurConverter;
import ma.zs.alc.ws.dto.notif.NotificationActeurDto;
import ma.zs.alc.zynerator.util.PaginatedList;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import java.util.Arrays;
import java.util.ArrayList;



import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;



import org.springframework.web.multipart.MultipartFile;


@RestController
@RequestMapping("/api/admin/notificationActeur/")
public class NotificationActeurRestAdmin {




    @Operation(summary = "Finds a list of all notificationActeurs")
    @GetMapping("")
    public ResponseEntity<List<NotificationActeurDto>> findAll() throws Exception {
        ResponseEntity<List<NotificationActeurDto>> res = null;
        List<NotificationActeur> list = service.findAll();
        HttpStatus status = HttpStatus.NO_CONTENT;
        List<NotificationActeurDto> dtos  = converter.toDto(list);
        if (dtos != null && !dtos.isEmpty())
            status = HttpStatus.OK;
        res = new ResponseEntity<>(dtos, status);
        return res;
    }

    @Operation(summary = "Finds an optimized list of all notificationActeurs")
    @GetMapping("optimized")
    public ResponseEntity<List<NotificationActeurDto>> findAllOptimized() throws Exception {
        ResponseEntity<List<NotificationActeurDto>> res = null;
        List<NotificationActeur> list = service.findAllOptimized();
        HttpStatus status = HttpStatus.NO_CONTENT;
        List<NotificationActeurDto> dtos  = converter.toDto(list);
        if (dtos != null && !dtos.isEmpty())
            status = HttpStatus.OK;
        res = new ResponseEntity<>(dtos, status);
        return res;
    }

    @Operation(summary = "Finds a notificationActeur by id")
    @GetMapping("id/{id}")
    public ResponseEntity<NotificationActeurDto> findById(@PathVariable Long id) {
        NotificationActeur t = service.findById(id);
        if (t != null) {
            NotificationActeurDto dto = converter.toDto(t);
            return getDtoResponseEntity(dto);
        }
        return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
    }

    @Operation(summary = "Finds a notificationActeur by title")
    @GetMapping("title/{title}")
    public ResponseEntity<NotificationActeurDto> findByTitle(@PathVariable String title) {
	    NotificationActeur t = service.findByReferenceEntity(new NotificationActeur(title));
        if (t != null) {
            NotificationActeurDto dto = converter.toDto(t);
            return getDtoResponseEntity(dto);
        }
        return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
    }

    @Operation(summary = "Saves the specified  notificationActeur")
    @PostMapping("")
    public ResponseEntity<NotificationActeurDto> save(@RequestBody NotificationActeurDto dto) throws Exception {
        if(dto!=null){
            NotificationActeur myT = converter.toItem(dto);
            NotificationActeur t = service.create(myT);
            if (t == null) {
                return new ResponseEntity<>(null, HttpStatus.IM_USED);
            }else{
                NotificationActeurDto myDto = converter.toDto(t);
                return new ResponseEntity<>(myDto, HttpStatus.CREATED);
            }
        }else {
            return new ResponseEntity<>(dto, HttpStatus.NO_CONTENT);
        }
    }

    @Operation(summary = "Updates the specified  notificationActeur")
    @PutMapping("")
    public ResponseEntity<NotificationActeurDto> update(@RequestBody NotificationActeurDto dto) throws Exception {
        ResponseEntity<NotificationActeurDto> res ;
        if (dto.getId() == null || service.findById(dto.getId()) == null)
            res = new ResponseEntity<>(HttpStatus.CONFLICT);
        else {
            NotificationActeur t = service.findById(dto.getId());
            converter.copy(dto,t);
            NotificationActeur updated = service.update(t);
            NotificationActeurDto myDto = converter.toDto(updated);
            res = new ResponseEntity<>(myDto, HttpStatus.OK);
        }
        return res;
    }

    @Operation(summary = "Delete list of notificationActeur")
    @PostMapping("multiple")
    public ResponseEntity<List<NotificationActeurDto>> delete(@RequestBody List<NotificationActeurDto> dtos) throws Exception {
        ResponseEntity<List<NotificationActeurDto>> res ;
        HttpStatus status = HttpStatus.CONFLICT;
        if (dtos != null && !dtos.isEmpty()) {
            List<NotificationActeur> ts = converter.toItem(dtos);
            service.delete(ts);
            status = HttpStatus.OK;
        }
        res = new ResponseEntity<>(dtos, status);
        return res;
    }

    @Operation(summary = "Delete the specified notificationActeur")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        ResponseEntity<Long> res;
        HttpStatus status = HttpStatus.PRECONDITION_FAILED;
        if (id != null) {
            boolean resultDelete = service.deleteById(id);
            if (resultDelete) {
                status = HttpStatus.OK;
            }
        }
        res = new ResponseEntity<>(id, status);
        return res;
    }


    @Operation(summary = "Finds a notificationActeur and associated list by id")
    @GetMapping("detail/id/{id}")
    public ResponseEntity<NotificationActeurDto> findWithAssociatedLists(@PathVariable Long id) {
        NotificationActeur loaded =  service.findWithAssociatedLists(id);
        NotificationActeurDto dto = converter.toDto(loaded);
        return new ResponseEntity<>(dto, HttpStatus.OK);
    }

    @Operation(summary = "Finds notificationActeurs by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<NotificationActeurDto>> findByCriteria(@RequestBody NotificationActeurCriteria criteria) throws Exception {
        ResponseEntity<List<NotificationActeurDto>> res = null;
        List<NotificationActeur> list = service.findByCriteria(criteria);
        HttpStatus status = HttpStatus.NO_CONTENT;
        List<NotificationActeurDto> dtos  = converter.toDto(list);
        if (dtos != null && !dtos.isEmpty())
            status = HttpStatus.OK;

        res = new ResponseEntity<>(dtos, status);
        return res;
    }

    @Operation(summary = "Finds paginated notificationActeurs by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody NotificationActeurCriteria criteria) throws Exception {
        List<NotificationActeur> list = service.findPaginatedByCriteria(criteria, criteria.getPage(), criteria.getMaxResults(), criteria.getSortOrder(), criteria.getSortField());
        List<NotificationActeurDto> dtos = converter.toDto(list);
        PaginatedList paginatedList = new PaginatedList();
        paginatedList.setList(dtos);
        if (dtos != null && !dtos.isEmpty()) {
            int dateSize = service.getDataSize(criteria);
            paginatedList.setDataSize(dateSize);
        }
        return new ResponseEntity<>(paginatedList, HttpStatus.OK);
    }

    @Operation(summary = "Gets notificationActeur data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody NotificationActeurCriteria criteria) throws Exception {
        int count = service.getDataSize(criteria);
        return new ResponseEntity<Integer>(count, HttpStatus.OK);
    }
	
	public List<NotificationActeurDto> findDtos(List<NotificationActeur> list){
        List<NotificationActeurDto> dtos = converter.toDto(list);
        return dtos;
    }

    private ResponseEntity<NotificationActeurDto> getDtoResponseEntity(NotificationActeurDto dto) {
        return new ResponseEntity<>(dto, HttpStatus.OK);
    }




   public NotificationActeurRestAdmin(NotificationActeurAdminService service, NotificationActeurConverter converter){
        this.service = service;
        this.converter = converter;
    }

    private final NotificationActeurAdminService service;
    private final NotificationActeurConverter converter;





}
