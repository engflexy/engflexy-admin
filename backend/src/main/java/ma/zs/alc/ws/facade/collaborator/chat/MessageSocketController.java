package ma.zs.alc.ws.facade.collaborator.chat;

import java.util.Map;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;

import ma.zs.alc.service.facade.collaborator.chat.MessageSocketService;
import ma.zs.alc.ws.dto.chat.MessageRequest;

@Controller
public class MessageSocketController {
	
	private final MessageSocketService socketService;

	public MessageSocketController(MessageSocketService socketService) {
        this.socketService = socketService;
    }
	
	@MessageMapping("/user")
	public void sendUserConversationByUserId(Long userId) {
		socketService.sendUserConversationByUserId(userId);
	}

	@MessageMapping("/conv")
	public void sendMessagesByConversationId(Long conversationId) {
		socketService.sendMessagesByConversationId(conversationId);
	}

	@MessageMapping("/sendMessage")
	public void saveMessage(MessageRequest message) {
		socketService.saveMessage(message);
	}

	@MessageMapping("/deleteConversation")
	public void deleteConversation(Map<String, Object> payload) {
		Long conversationId = (Long) payload.get("conversationId");
		Long user1 = (Long) payload.get("user1Id");
		Long user2 = (Long) payload.get("user2Id");
		socketService.deleteConversationByConversationId(conversationId);
		socketService.sendUserConversationByUserId(user1);
		socketService.sendUserConversationByUserId(user2);
	}

	@MessageMapping("/deleteMessage")
	public void deleteMessage(Map<String, Object> payload) {
		Long conversationId = (Long) payload.get("conversationId");
		Long messageId = (Long) payload.get("messageId");
		socketService.deleteMessageByMessageId(conversationId, messageId);
	}
}