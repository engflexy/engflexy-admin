package ma.zs.alc.unit.ws.facade.admin.course;

import ma.zs.alc.bean.core.course.Exercice;
import ma.zs.alc.service.impl.admin.course.ExerciceAdminServiceImpl;
import ma.zs.alc.ws.facade.admin.course.ExerciceRestAdmin;
import ma.zs.alc.ws.converter.course.ExerciceConverter;
import ma.zs.alc.ws.dto.course.ExerciceDto;
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
public class ExerciceRestAdminTest {

    private MockMvc mockMvc;

    @Mock
    private ExerciceAdminServiceImpl service;
    @Mock
    private ExerciceConverter converter;

    @InjectMocks
    private ExerciceRestAdmin controller;

    @Before("")
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        this.mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }


    @Test
    public void itShouldFindAllExerciceTest() throws Exception {
        // Mock the service to return an empty list
        when(service.findAll()).thenReturn(Collections.emptyList());
        when(converter.toDto(Collections.emptyList())).thenReturn(Collections.emptyList());

        // Call the controller method
        ResponseEntity<List<ExerciceDto>> result = controller.findAll();

        // Verify the result
        assertEquals(HttpStatus.NO_CONTENT, result.getStatusCode());

        // Response body should be empty list
        List<ExerciceDto> responseBody = result.getBody();
        assertNotNull(responseBody);
        assertEquals(0, responseBody.size());
    }

    @Test
    public void itShouldSaveExerciceTest() throws Exception {
        // Mock data
        ExerciceDto requestDto = new ExerciceDto();
        Exercice entity = new Exercice();
        Exercice saved = new Exercice();
        ExerciceDto savedDto = new ExerciceDto();

        // Mock the converter to return the exercice object when converting from DTO
        when(converter.toItem(requestDto)).thenReturn(entity);

        // Mock the service to return the saved client
        when(service.create(entity)).thenReturn(saved);

        // Mock the converter to return the saved exercice DTO
        when(converter.toDto(saved)).thenReturn(savedDto);

        // Call the controller method
        ResponseEntity<ExerciceDto> result = controller.save(requestDto);

        // Verify the result
        assertEquals(HttpStatus.CREATED, result.getStatusCode());

        // Verify the response body
        ExerciceDto responseBody = result.getBody();
        assertNotNull(responseBody);

        // Add assertions to compare the response body with the saved exercice DTO
        assertEquals(savedDto.getContent(), responseBody.getContent());
        assertEquals(savedDto.getDescription(), responseBody.getDescription());
        assertEquals(savedDto.getLibelle(), responseBody.getLibelle());
        assertEquals(savedDto.getNumero(), responseBody.getNumero());
    }

}
