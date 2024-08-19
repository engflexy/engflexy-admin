package ma.zs.alc.ws.facade.collaborator.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ma.zs.alc.service.facade.collaborator.chat.ConversationService;


@RestController
@RequestMapping("/api/collaborator/conversation/")
public class ConversationController {

	@Autowired
	private ConversationService conversationService;

	@PostMapping("seen/false/id/{id}")
	public boolean updateConversationSeenToFalse(@PathVariable Long id) {
		return conversationService.updateConversationSeenToFalse(id);
	}
	
	@PostMapping("seen/true/id/{id}")
	public boolean updateConversationSeenToTrue(@PathVariable Long id) {
		return conversationService.updateConversationSeenToTrue(id);
	}
}
