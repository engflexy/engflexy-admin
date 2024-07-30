package ma.zs.alc.ws.dto.chat;

import java.util.Date;

public class MessageResponse {
    private Long messageId;
    private Long senderId;
    private Long receiverId;
    private String message;
    private Date timestamp;

    // No-argument constructor
    public MessageResponse() {}

    // All-argument constructor
    public MessageResponse(Long messageId, Long senderId, Long receiverId, String message, Date timestamp) {
        this.messageId = messageId;
        this.senderId = senderId;
        this.receiverId = receiverId;
        this.message = message;
        this.timestamp = timestamp;
    }

    // Getters and Setters
    public Long getMessageId() {
        return messageId;
    }

    public void setMessageId(Long messageId) {
        this.messageId = messageId;
    }

    public Long getSenderId() {
        return senderId;
    }

    public void setSenderId(Long senderId) {
        this.senderId = senderId;
    }

    public Long getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(Long receiverId) {
        this.receiverId = receiverId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    // Builder class for MessageResponse
    public static class Builder {
        private Long messageId;
        private Long senderId;
        private Long receiverId;
        private String message;
        private Date timestamp;

        public Builder() {}

        public Builder messageId(Long messageId) {
            this.messageId = messageId;
            return this;
        }

        public Builder senderId(Long senderId) {
            this.senderId = senderId;
            return this;
        }

        public Builder receiverId(Long receiverId) {
            this.receiverId = receiverId;
            return this;
        }

        public Builder message(String message) {
            this.message = message;
            return this;
        }

        public Builder timestamp(Date timestamp) {
            this.timestamp = timestamp;
            return this;
        }

        public MessageResponse build() {
            return new MessageResponse(messageId, senderId, receiverId, message, timestamp);
        }
    }

    @Override
    public String toString() {
        return "MessageResponse{" +
                "messageId=" + messageId +
                ", senderId=" + senderId +
                ", receiverId=" + receiverId +
                ", message='" + message + '\'' +
                ", timestamp=" + timestamp +
                '}';
    }
}
