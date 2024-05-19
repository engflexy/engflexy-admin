package ma.zs.alc.unit.ws.facade.admin.courseref;

import ma.zs.alc.bean.core.courseref.LevelTestConfiguration;
import ma.zs.alc.service.impl.admin.courseref.LevelTestConfigurationAdminServiceImpl;
import ma.zs.alc.ws.facade.admin.courseref.LevelTestConfigurationRestAdmin;
import ma.zs.alc.ws.converter.courseref.LevelTestConfigurationConverter;
import ma.zs.alc.ws.dto.courseref.LevelTestConfigurationDto;
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
public class LevelTestConfigurationRestAdminTest {

    private MockMvc mockMvc;

    @Mock
    private LevelTestConfigurationAdminServiceImpl service;
    @Mock
    private LevelTestConfigurationConverter converter;

    @InjectMocks
    private LevelTestConfigurationRestAdmin controller;

    @Before("")
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        this.mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }


    @Test
    public void itShouldFindAllLevelTestConfigurationTest() throws Exception {
        // Mock the service to return an empty list
        when(service.findAll()).thenReturn(Collections.emptyList());
        when(converter.toDto(Collections.emptyList())).thenReturn(Collections.emptyList());

        // Call the controller method
        ResponseEntity<List<LevelTestConfigurationDto>> result = controller.findAll();

        // Verify the result
        assertEquals(HttpStatus.NO_CONTENT, result.getStatusCode());

        // Response body should be empty list
        List<LevelTestConfigurationDto> responseBody = result.getBody();
        assertNotNull(responseBody);
        assertEquals(0, responseBody.size());
    }

    @Test
    public void itShouldSaveLevelTestConfigurationTest() throws Exception {
        // Mock data
        LevelTestConfigurationDto requestDto = new LevelTestConfigurationDto();
        LevelTestConfiguration entity = new LevelTestConfiguration();
        LevelTestConfiguration saved = new LevelTestConfiguration();
        LevelTestConfigurationDto savedDto = new LevelTestConfigurationDto();

        // Mock the converter to return the levelTestConfiguration object when converting from DTO
        when(converter.toItem(requestDto)).thenReturn(entity);

        // Mock the service to return the saved client
        when(service.create(entity)).thenReturn(saved);

        // Mock the converter to return the saved levelTestConfiguration DTO
        when(converter.toDto(saved)).thenReturn(savedDto);

        // Call the controller method
        ResponseEntity<LevelTestConfigurationDto> result = controller.save(requestDto);

        // Verify the result
        assertEquals(HttpStatus.CREATED, result.getStatusCode());

        // Verify the response body
        LevelTestConfigurationDto responseBody = result.getBody();
        assertNotNull(responseBody);

        // Add assertions to compare the response body with the saved levelTestConfiguration DTO
        assertEquals(savedDto.getNoteMin(), responseBody.getNoteMin());
        assertEquals(savedDto.getNoteMax(), responseBody.getNoteMax());
    }

}
