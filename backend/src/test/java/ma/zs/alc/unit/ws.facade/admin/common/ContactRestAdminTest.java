package ma.zs.alc.unit.ws.facade.admin.common;

import ma.zs.alc.bean.core.common.Contact;
import ma.zs.alc.service.impl.admin.common.ContactAdminServiceImpl;
import ma.zs.alc.ws.facade.admin.common.ContactRestAdmin;
import ma.zs.alc.ws.converter.common.ContactConverter;
import ma.zs.alc.ws.dto.common.ContactDto;
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
public class ContactRestAdminTest {

    private MockMvc mockMvc;

    @Mock
    private ContactAdminServiceImpl service;
    @Mock
    private ContactConverter converter;

    @InjectMocks
    private ContactRestAdmin controller;

    @Before("")
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        this.mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }


    @Test
    public void itShouldFindAllContactTest() throws Exception {
        // Mock the service to return an empty list
        when(service.findAll()).thenReturn(Collections.emptyList());
        when(converter.toDto(Collections.emptyList())).thenReturn(Collections.emptyList());

        // Call the controller method
        ResponseEntity<List<ContactDto>> result = controller.findAll();

        // Verify the result
        assertEquals(HttpStatus.NO_CONTENT, result.getStatusCode());

        // Response body should be empty list
        List<ContactDto> responseBody = result.getBody();
        assertNotNull(responseBody);
        assertEquals(0, responseBody.size());
    }

    @Test
    public void itShouldSaveContactTest() throws Exception {
        // Mock data
        ContactDto requestDto = new ContactDto();
        Contact entity = new Contact();
        Contact saved = new Contact();
        ContactDto savedDto = new ContactDto();

        // Mock the converter to return the contact object when converting from DTO
        when(converter.toItem(requestDto)).thenReturn(entity);

        // Mock the service to return the saved client
        when(service.create(entity)).thenReturn(saved);

        // Mock the converter to return the saved contact DTO
        when(converter.toDto(saved)).thenReturn(savedDto);

        // Call the controller method
        ResponseEntity<ContactDto> result = controller.save(requestDto);

        // Verify the result
        assertEquals(HttpStatus.CREATED, result.getStatusCode());

        // Verify the response body
        ContactDto responseBody = result.getBody();
        assertNotNull(responseBody);

        // Add assertions to compare the response body with the saved contact DTO
        assertEquals(savedDto.getName(), responseBody.getName());
        assertEquals(savedDto.getEmail(), responseBody.getEmail());
        assertEquals(savedDto.getPhone(), responseBody.getPhone());
        assertEquals(savedDto.getSetFrom(), responseBody.getSetFrom());
        assertEquals(savedDto.getDateContact(), responseBody.getDateContact());
        assertEquals(savedDto.getReplied(), responseBody.getReplied());
        assertEquals(savedDto.getMessage(), responseBody.getMessage());
    }

}
