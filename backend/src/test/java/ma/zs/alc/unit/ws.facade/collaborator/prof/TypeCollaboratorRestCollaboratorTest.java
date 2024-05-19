package ma.zs.alc.unit.ws.facade.collaborator.prof;

import ma.zs.alc.bean.core.prof.TypeCollaborator;
import ma.zs.alc.service.impl.collaborator.prof.TypeCollaboratorCollaboratorServiceImpl;
import ma.zs.alc.ws.facade.collaborator.prof.TypeCollaboratorRestCollaborator;
import ma.zs.alc.ws.converter.prof.TypeCollaboratorConverter;
import ma.zs.alc.ws.dto.prof.TypeCollaboratorDto;
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
public class TypeCollaboratorRestCollaboratorTest {

    private MockMvc mockMvc;

    @Mock
    private TypeCollaboratorCollaboratorServiceImpl service;
    @Mock
    private TypeCollaboratorConverter converter;

    @InjectMocks
    private TypeCollaboratorRestCollaborator controller;

    @Before("")
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        this.mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }


    @Test
    public void itShouldFindAllTypeCollaboratorTest() throws Exception {
        // Mock the service to return an empty list
        when(service.findAll()).thenReturn(Collections.emptyList());
        when(converter.toDto(Collections.emptyList())).thenReturn(Collections.emptyList());

        // Call the controller method
        ResponseEntity<List<TypeCollaboratorDto>> result = controller.findAll();

        // Verify the result
        assertEquals(HttpStatus.NO_CONTENT, result.getStatusCode());

        // Response body should be empty list
        List<TypeCollaboratorDto> responseBody = result.getBody();
        assertNotNull(responseBody);
        assertEquals(0, responseBody.size());
    }

    @Test
    public void itShouldSaveTypeCollaboratorTest() throws Exception {
        // Mock data
        TypeCollaboratorDto requestDto = new TypeCollaboratorDto();
        TypeCollaborator entity = new TypeCollaborator();
        TypeCollaborator saved = new TypeCollaborator();
        TypeCollaboratorDto savedDto = new TypeCollaboratorDto();

        // Mock the converter to return the typeCollaborator object when converting from DTO
        when(converter.toItem(requestDto)).thenReturn(entity);

        // Mock the service to return the saved client
        when(service.create(entity)).thenReturn(saved);

        // Mock the converter to return the saved typeCollaborator DTO
        when(converter.toDto(saved)).thenReturn(savedDto);

        // Call the controller method
        ResponseEntity<TypeCollaboratorDto> result = controller.save(requestDto);

        // Verify the result
        assertEquals(HttpStatus.CREATED, result.getStatusCode());

        // Verify the response body
        TypeCollaboratorDto responseBody = result.getBody();
        assertNotNull(responseBody);

        // Add assertions to compare the response body with the saved typeCollaborator DTO
        assertEquals(savedDto.getLibelle(), responseBody.getLibelle());
        assertEquals(savedDto.getCode(), responseBody.getCode());
    }

}
