package ma.zs.alc.unit.ws.facade.collaborator.freetrial;

import ma.zs.alc.bean.core.freetrial.FreeTrialDetail;
import ma.zs.alc.service.impl.collaborator.freetrial.FreeTrialDetailCollaboratorServiceImpl;
import ma.zs.alc.ws.facade.collaborator.freetrial.FreeTrialDetailRestCollaborator;
import ma.zs.alc.ws.converter.freetrial.FreeTrialDetailConverter;
import ma.zs.alc.ws.dto.freetrial.FreeTrialDetailDto;
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
public class FreeTrialDetailRestCollaboratorTest {

    private MockMvc mockMvc;

    @Mock
    private FreeTrialDetailCollaboratorServiceImpl service;
    @Mock
    private FreeTrialDetailConverter converter;

    @InjectMocks
    private FreeTrialDetailRestCollaborator controller;

    @Before("")
    public void setUp() {
        MockitoAnnotations.initMocks(this);
        this.mockMvc = MockMvcBuilders.standaloneSetup(controller).build();
    }


    @Test
    public void itShouldFindAllFreeTrialDetailTest() throws Exception {
        // Mock the service to return an empty list
        when(service.findAll()).thenReturn(Collections.emptyList());
        when(converter.toDto(Collections.emptyList())).thenReturn(Collections.emptyList());

        // Call the controller method
        ResponseEntity<List<FreeTrialDetailDto>> result = controller.findAll();

        // Verify the result
        assertEquals(HttpStatus.NO_CONTENT, result.getStatusCode());

        // Response body should be empty list
        List<FreeTrialDetailDto> responseBody = result.getBody();
        assertNotNull(responseBody);
        assertEquals(0, responseBody.size());
    }

    @Test
    public void itShouldSaveFreeTrialDetailTest() throws Exception {
        // Mock data
        FreeTrialDetailDto requestDto = new FreeTrialDetailDto();
        FreeTrialDetail entity = new FreeTrialDetail();
        FreeTrialDetail saved = new FreeTrialDetail();
        FreeTrialDetailDto savedDto = new FreeTrialDetailDto();

        // Mock the converter to return the freeTrialDetail object when converting from DTO
        when(converter.toItem(requestDto)).thenReturn(entity);

        // Mock the service to return the saved client
        when(service.create(entity)).thenReturn(saved);

        // Mock the converter to return the saved freeTrialDetail DTO
        when(converter.toDto(saved)).thenReturn(savedDto);

        // Call the controller method
        ResponseEntity<FreeTrialDetailDto> result = controller.save(requestDto);

        // Verify the result
        assertEquals(HttpStatus.CREATED, result.getStatusCode());

        // Verify the response body
        FreeTrialDetailDto responseBody = result.getBody();
        assertNotNull(responseBody);

        // Add assertions to compare the response body with the saved freeTrialDetail DTO
        assertEquals(savedDto.getPresence(), responseBody.getPresence());
        assertEquals(savedDto.getWhatsUpMessageSent(), responseBody.getWhatsUpMessageSent());
        assertEquals(savedDto.getDateEnvoiwhatsUpMessage(), responseBody.getDateEnvoiwhatsUpMessage());
        assertEquals(savedDto.getEmailMessageSent(), responseBody.getEmailMessageSent());
        assertEquals(savedDto.getDateEnvoiEmailMessage(), responseBody.getDateEnvoiEmailMessage());
        assertEquals(savedDto.getAbonne(), responseBody.getAbonne());
    }

}
