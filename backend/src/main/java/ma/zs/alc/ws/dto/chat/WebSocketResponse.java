package ma.zs.alc.ws.dto.chat;


public class WebSocketResponse {
    private String type;
    private Object data;

    // No-argument constructor
    public WebSocketResponse() {}

    // All-argument constructor
    public WebSocketResponse(String type, Object data) {
        this.type = type;
        this.data = data;
    }

    // Getters and Setters
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    // Builder class for WebSocketResponse
    public static class Builder {
        private String type;
        private Object data;

        public Builder() {}

        public Builder type(String type) {
            this.type = type;
            return this;
        }

        public Builder data(Object data) {
            this.data = data;
            return this;
        }

        public WebSocketResponse build() {
            return new WebSocketResponse(type, data);
        }
    }

    @Override
    public String toString() {
        return "WebSocketResponse{" +
                "type='" + type + '\'' +
                ", data=" + data +
                '}';
    }
}


