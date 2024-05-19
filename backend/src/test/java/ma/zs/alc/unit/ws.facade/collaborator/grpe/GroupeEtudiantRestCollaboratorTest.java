package ma.zs.alc.unit.ws.facade.collaborator.grpe;

import ma.zs.alc.bean.core.grpe.GroupeEtudiant;
import ma.zs.alc.service.impl.collaborator.grpe.GroupeEtudiantCollaboratorServiceImpl;
import ma.zs.alc.ws.facade.collaborator.grpe.GroupeEtudiantRestCollaborator;
import ma.zs.alc.ws.converter.grpe.GroupeEtudiantConverter;
import ma.zs.alc.ws.dto.grpe.GroupeEtudiantDto;
import org.aspectj.lang.annotation.Before;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class GroupeEtudiantRestCollaboratorTest {

    private MockMvc mockMvc;

    @Mock
    private GroupeEtudiantCollaboratorServiceImpl service;
    @Mock
    private GroupeEtudiantConverter converter;

    @InjectMocks
    private GroupeEtudiantRestCollaborator controller;

    @Before("")
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        this.mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }


    @Test
    public void itShouldFindAllGroupeEtudiantTest() throws Exception {
        // Mock the service to return an empty list
        when(service.findAll()).thenReturn(Collections.emptyList());
        when(converter.toDto(Collections.emptyList())).thenReturn(Collections.emptyList());

        // Call the controller method
        ResponseEntity<List<GroupeEtudiantDto>> result = controller.findAll();

        // Verify the result
        assertEquals(HttpStatus.NO_CONTENT, result.getStatusCode());

        // Response body should be empty list
        List<GroupeEtudiantDto> responseBody = result.getBody();
        assertNotNull(responseBody);
        assertEquals(0, responseBody.size());
    }

    @Test
    public void itShouldSaveGroupeEtudiantTest() throws Exception {
        // Mock data
        GroupeEtudiantDto requestDto = new GroupeEtudiantDto();
        GroupeEtudiant entity = new GroupeEtudiant();
        GroupeEtudiant saved = new GroupeEtudiant();
        GroupeEtudiantDto savedDto = new GroupeEtudiantDto();

        // Mock the converter to return the groupeEtudiant object when converting from DTO
        when(converter.toItem(requestDto)).thenReturn(entity);

        // Mock the service to return the saved client
        when(service.create(entity)).thenReturn(saved);

        // Mock the converter to return the saved groupeEtudiant DTO
        when(converter.toDto(saved)).thenReturn(savedDto);

        // Call the controller method
        ResponseEntity<GroupeEtudiantDto> result = controller.save(requestDto);

        // Verify the result
        assertEquals(HttpStatus.CREATED, result.getStatusCode());

        // Verify the response body
        GroupeEtudiantDto responseBody = result.getBody();
        assertNotNull(responseBody);

        // Add assertions to compare the response body with the saved groupeEtudiant DTO
        assertEquals(savedDto.getLibelle(), responseBody.getLibelle());
        assertEquals(savedDto.getType(), responseBody.getType());
        assertEquals(savedDto.getDateDebut(), responseBody.getDateDebut());
        assertEquals(savedDto.getDateFin(), responseBody.getDateFin());
        assertEquals(savedDto.getNombrePlace(), responseBody.getNombrePlace());
        assertEquals(savedDto.getNombrePlacevide(), responseBody.getNombrePlacevide());
        assertEquals(savedDto.getNombrePlaceNonVide(), responseBody.getNombrePlaceNonVide());
        assertEquals(savedDto.getNreCoursesComing(), responseBody.getNreCoursesComing());
        assertEquals(savedDto.getNreCoursesCompleted(), responseBody.getNreCoursesCompleted());
        assertEquals(savedDto.getNreCourses(), responseBody.getNreCourses());
    }

}
