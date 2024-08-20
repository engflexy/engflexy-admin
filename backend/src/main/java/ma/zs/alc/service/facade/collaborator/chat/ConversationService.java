package ma.zs.alc.service.facade.collaborator.chat;

public interface ConversationService {

	boolean updateConversationSeenToFalse(Long id);
	boolean updateConversationSeenToTrue(Long id);

}
