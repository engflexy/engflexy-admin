package ma.zs.alc.zynerator.exception.chat;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import ma.zs.alc.ws.dto.chat.ApiResponse;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(InternalServerErrorException.class)
    public ResponseEntity<ApiResponse> handleInternalServerErrorException(InternalServerErrorException e) {
        ApiResponse response = new ApiResponse(500, "Failed", "I - " + e.getMessage(), null);
        return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ApiResponse> handleGeneralException(Exception e) {
        ApiResponse response = new ApiResponse(500, "Failed", e.getMessage(), null);
        return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
    }
}
