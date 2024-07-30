package ma.zs.alc.service.facade.collaborator.chat;

import ma.zs.alc.ws.dto.chat.MessageRequest;

public interface MessageSocketService {

	void sendUserConversationByUserId(Long userId);

	void sendMessagesByConversationId(Long conversationId);

	void saveMessage(MessageRequest msg);

	void deleteConversationByConversationId(Long conversationId);

	void deleteMessageByMessageId(Long conversationId, Long messageId);
}
