package ma.zs.alc.ws.dto.chat;

import java.sql.Timestamp;

public interface ConversationResponse {

	Long getConversationId();

	Long getOtherUserId();

	Long getOtherUserName();

	Long getLastMessage();

	Timestamp getLastMessageTimestamp();
}
