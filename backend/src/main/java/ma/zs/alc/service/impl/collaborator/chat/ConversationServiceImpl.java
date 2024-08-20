package ma.zs.alc.service.impl.collaborator.chat;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.persistence.EntityNotFoundException;
import ma.zs.alc.bean.core.chat.Conversation;
import ma.zs.alc.dao.facade.core.chat.ConversationRepository;
import ma.zs.alc.service.facade.collaborator.chat.ConversationService;

@Service
public class ConversationServiceImpl implements ConversationService{
	
	@Autowired
	private ConversationRepository conversationRepository;

	@Override
	public boolean updateConversationSeenToFalse(Long id) {
	    Optional<Conversation> conv = conversationRepository.findById(id);
	    if (conv.isPresent()) {
	        Conversation conversation = conv.get();
	        conversation.setSeen(false);
	        conversationRepository.save(conversation);
	        return conversation.getSeen();
	    } else {
	        throw new EntityNotFoundException("Conversation not found with id: " + id);
	    }
	}

	@Override
	public boolean updateConversationSeenToTrue(Long id) {
	    Optional<Conversation> conv = conversationRepository.findById(id);
	    if (conv.isPresent()) {
	        Conversation conversation = conv.get();
	        conversation.setSeen(true);
	        conversationRepository.save(conversation);
	        return conversation.getSeen();
	    } else {
	        throw new EntityNotFoundException("Conversation not found with id: " + id);
	    }
	}


	
}
