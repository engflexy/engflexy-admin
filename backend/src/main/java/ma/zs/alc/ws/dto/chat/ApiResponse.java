package ma.zs.alc.ws.dto.chat;

public class ApiResponse {
    private Integer statusCode;
    private String status;
    private String reason;
    private Object data;

    // No-argument constructor
    public ApiResponse() {}

    // All-argument constructor
    public ApiResponse(Integer statusCode, String status, String reason, Object data) {
        this.statusCode = statusCode;
        this.status = status;
        this.reason = reason;
        this.data = data;
    }

    // Getters and Setters
    public Integer getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(Integer statusCode) {
        this.statusCode = statusCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    // Builder class for ApiResponse
    public static class Builder {
        private Integer statusCode;
        private String status;
        private String reason;
        private Object data;

        public Builder() {}

        public Builder statusCode(Integer statusCode) {
            this.statusCode = statusCode;
            return this;
        }

        public Builder status(String status) {
            this.status = status;
            return this;
        }

        public Builder reason(String reason) {
            this.reason = reason;
            return this;
        }

        public Builder data(Object data) {
            this.data = data;
            return this;
        }

        public ApiResponse build() {
            return new ApiResponse(statusCode, status, reason, data);
        }
    }

    @Override
    public String toString() {
        return "ApiResponse{" +
                "statusCode=" + statusCode +
                ", status='" + status + '\'' +
                ", reason='" + reason + '\'' +
                ", data=" + data +
                '}';
    }
}
