package ma.zs.alc.unit.ws.facade.collaborator.recomrecla;

import ma.zs.alc.bean.core.recomrecla.ReclamationProf;
import ma.zs.alc.service.impl.collaborator.recomrecla.ReclamationProfCollaboratorServiceImpl;
import ma.zs.alc.ws.facade.collaborator.recomrecla.ReclamationProfRestCollaborator;
import ma.zs.alc.ws.converter.recomrecla.ReclamationProfConverter;
import ma.zs.alc.ws.dto.recomrecla.ReclamationProfDto;
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
public class ReclamationProfRestCollaboratorTest {

    private MockMvc mockMvc;

    @Mock
    private ReclamationProfCollaboratorServiceImpl service;
    @Mock
    private ReclamationProfConverter converter;

    @InjectMocks
    private ReclamationProfRestCollaborator controller;

    @Before("")
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        this.mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }


    @Test
    public void itShouldFindAllReclamationProfTest() throws Exception {
        // Mock the service to return an empty list
        when(service.findAll()).thenReturn(Collections.emptyList());
        when(converter.toDto(Collections.emptyList())).thenReturn(Collections.emptyList());

        // Call the controller method
        ResponseEntity<List<ReclamationProfDto>> result = controller.findAll();

        // Verify the result
        assertEquals(HttpStatus.NO_CONTENT, result.getStatusCode());

        // Response body should be empty list
        List<ReclamationProfDto> responseBody = result.getBody();
        assertNotNull(responseBody);
        assertEquals(0, responseBody.size());
    }

    @Test
    public void itShouldSaveReclamationProfTest() throws Exception {
        // Mock data
        ReclamationProfDto requestDto = new ReclamationProfDto();
        ReclamationProf entity = new ReclamationProf();
        ReclamationProf saved = new ReclamationProf();
        ReclamationProfDto savedDto = new ReclamationProfDto();

        // Mock the converter to return the reclamationProf object when converting from DTO
        when(converter.toItem(requestDto)).thenReturn(entity);

        // Mock the service to return the saved client
        when(service.create(entity)).thenReturn(saved);

        // Mock the converter to return the saved reclamationProf DTO
        when(converter.toDto(saved)).thenReturn(savedDto);

        // Call the controller method
        ResponseEntity<ReclamationProfDto> result = controller.save(requestDto);

        // Verify the result
        assertEquals(HttpStatus.CREATED, result.getStatusCode());

        // Verify the response body
        ReclamationProfDto responseBody = result.getBody();
        assertNotNull(responseBody);

        // Add assertions to compare the response body with the saved reclamationProf DTO
        assertEquals(savedDto.getReference(), responseBody.getReference());
        assertEquals(savedDto.getDateReclamation(), responseBody.getDateReclamation());
        assertEquals(savedDto.getMessage(), responseBody.getMessage());
        assertEquals(savedDto.getTraite(), responseBody.getTraite());
        assertEquals(savedDto.getDateTraitement(), responseBody.getDateTraitement());
        assertEquals(savedDto.getDateReponse(), responseBody.getDateReponse());
        assertEquals(savedDto.getPostView(), responseBody.getPostView());
        assertEquals(savedDto.getCommentaireTraiteur(), responseBody.getCommentaireTraiteur());
        assertEquals(savedDto.getObjetReclamationProf(), responseBody.getObjetReclamationProf());
    }

}
