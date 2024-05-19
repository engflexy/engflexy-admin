package ma.zs.alc.unit.ws.facade.admin.courseref;

import ma.zs.alc.bean.core.courseref.ContentType;
import ma.zs.alc.service.impl.admin.courseref.ContentTypeAdminServiceImpl;
import ma.zs.alc.ws.facade.admin.courseref.ContentTypeRestAdmin;
import ma.zs.alc.ws.converter.courseref.ContentTypeConverter;
import ma.zs.alc.ws.dto.courseref.ContentTypeDto;
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
public class ContentTypeRestAdminTest {

    private MockMvc mockMvc;

    @Mock
    private ContentTypeAdminServiceImpl service;
    @Mock
    private ContentTypeConverter converter;

    @InjectMocks
    private ContentTypeRestAdmin controller;

    @Before("")
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        this.mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }


    @Test
    public void itShouldFindAllContentTypeTest() throws Exception {
        // Mock the service to return an empty list
        when(service.findAll()).thenReturn(Collections.emptyList());
        when(converter.toDto(Collections.emptyList())).thenReturn(Collections.emptyList());

        // Call the controller method
        ResponseEntity<List<ContentTypeDto>> result = controller.findAll();

        // Verify the result
        assertEquals(HttpStatus.NO_CONTENT, result.getStatusCode());

        // Response body should be empty list
        List<ContentTypeDto> responseBody = result.getBody();
        assertNotNull(responseBody);
        assertEquals(0, responseBody.size());
    }

    @Test
    public void itShouldSaveContentTypeTest() throws Exception {
        // Mock data
        ContentTypeDto requestDto = new ContentTypeDto();
        ContentType entity = new ContentType();
        ContentType saved = new ContentType();
        ContentTypeDto savedDto = new ContentTypeDto();

        // Mock the converter to return the contentType object when converting from DTO
        when(converter.toItem(requestDto)).thenReturn(entity);

        // Mock the service to return the saved client
        when(service.create(entity)).thenReturn(saved);

        // Mock the converter to return the saved contentType DTO
        when(converter.toDto(saved)).thenReturn(savedDto);

        // Call the controller method
        ResponseEntity<ContentTypeDto> result = controller.save(requestDto);

        // Verify the result
        assertEquals(HttpStatus.CREATED, result.getStatusCode());

        // Verify the response body
        ContentTypeDto responseBody = result.getBody();
        assertNotNull(responseBody);

        // Add assertions to compare the response body with the saved contentType DTO
        assertEquals(savedDto.getCode(), responseBody.getCode());
        assertEquals(savedDto.getLibelle(), responseBody.getLibelle());
    }

}
