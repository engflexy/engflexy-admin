package ma.zs.alc.ws.dto.chat;

import java.sql.Timestamp;

public interface ConversationResponse {

	Long getConversationId();

	Long getOtherUserId();
	
	Long getLastsenderId();
	
	Long getLastReceiverId();

	String getOtherUserName();

	String getLastMessage();

	Timestamp getLastMessageTimestamp();	
	
	Boolean getSeen();

}
