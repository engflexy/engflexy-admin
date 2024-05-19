package ma.zs.alc.unit.ws.facade.collaborator.inscriptionref;

import ma.zs.alc.bean.core.inscriptionref.InteretEtudiant;
import ma.zs.alc.service.impl.collaborator.inscriptionref.InteretEtudiantCollaboratorServiceImpl;
import ma.zs.alc.ws.facade.collaborator.inscriptionref.InteretEtudiantRestCollaborator;
import ma.zs.alc.ws.converter.inscriptionref.InteretEtudiantConverter;
import ma.zs.alc.ws.dto.inscriptionref.InteretEtudiantDto;
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
public class InteretEtudiantRestCollaboratorTest {

    private MockMvc mockMvc;

    @Mock
    private InteretEtudiantCollaboratorServiceImpl service;
    @Mock
    private InteretEtudiantConverter converter;

    @InjectMocks
    private InteretEtudiantRestCollaborator controller;

    @Before("")
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        this.mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }


    @Test
    public void itShouldFindAllInteretEtudiantTest() throws Exception {
        // Mock the service to return an empty list
        when(service.findAll()).thenReturn(Collections.emptyList());
        when(converter.toDto(Collections.emptyList())).thenReturn(Collections.emptyList());

        // Call the controller method
        ResponseEntity<List<InteretEtudiantDto>> result = controller.findAll();

        // Verify the result
        assertEquals(HttpStatus.NO_CONTENT, result.getStatusCode());

        // Response body should be empty list
        List<InteretEtudiantDto> responseBody = result.getBody();
        assertNotNull(responseBody);
        assertEquals(0, responseBody.size());
    }

    @Test
    public void itShouldSaveInteretEtudiantTest() throws Exception {
        // Mock data
        InteretEtudiantDto requestDto = new InteretEtudiantDto();
        InteretEtudiant entity = new InteretEtudiant();
        InteretEtudiant saved = new InteretEtudiant();
        InteretEtudiantDto savedDto = new InteretEtudiantDto();

        // Mock the converter to return the interetEtudiant object when converting from DTO
        when(converter.toItem(requestDto)).thenReturn(entity);

        // Mock the service to return the saved client
        when(service.create(entity)).thenReturn(saved);

        // Mock the converter to return the saved interetEtudiant DTO
        when(converter.toDto(saved)).thenReturn(savedDto);

        // Call the controller method
        ResponseEntity<InteretEtudiantDto> result = controller.save(requestDto);

        // Verify the result
        assertEquals(HttpStatus.CREATED, result.getStatusCode());

        // Verify the response body
        InteretEtudiantDto responseBody = result.getBody();
        assertNotNull(responseBody);

        // Add assertions to compare the response body with the saved interetEtudiant DTO
        assertEquals(savedDto.getCode(), responseBody.getCode());
        assertEquals(savedDto.getLibelle(), responseBody.getLibelle());
    }

}
