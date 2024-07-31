package ma.zs.alc.service.impl.collaborator.chat;


import org.springframework.messaging.simp.SimpMessagingTemplate;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ma.zs.alc.bean.core.chat.Conversation;
import ma.zs.alc.bean.core.chat.Message;
import ma.zs.alc.dao.facade.core.chat.ConversationRepository;
import ma.zs.alc.dao.facade.core.chat.MessageRepository;
import ma.zs.alc.service.facade.collaborator.chat.MessageSocketService;
import ma.zs.alc.ws.dto.chat.ConversationResponse;
import ma.zs.alc.ws.dto.chat.MessageRequest;
import ma.zs.alc.ws.dto.chat.MessageResponse;
import ma.zs.alc.ws.dto.chat.WebSocketResponse;
import ma.zs.alc.zynerator.security.bean.User;
import ma.zs.alc.zynerator.security.dao.facade.core.UserDao;

import java.sql.Date;
import java.time.ZoneId;
import java.util.List;

@Service
public class MessageSocketServiceImpl implements MessageSocketService {

	private final SimpMessagingTemplate messagingTemplate;
	private final UserDao userRepository;
	private final ConversationRepository conversationRepository;
	private final MessageRepository messageRepository;

	public MessageSocketServiceImpl(SimpMessagingTemplate messagingTemplate, UserDao userRepository,
			ConversationRepository conversationRepository, MessageRepository messageRepository) {
		this.messagingTemplate = messagingTemplate;
		this.userRepository = userRepository;
		this.conversationRepository = conversationRepository;
		this.messageRepository = messageRepository;
	}

	@Override
	public void sendUserConversationByUserId(Long userId) {
	    List<ConversationResponse> conversation = conversationRepository.findConversationsByUserId(userId);
	    messagingTemplate.convertAndSend("/topic/user/".concat(String.valueOf(userId)),
	            new WebSocketResponse.Builder().type("ALL").data(conversation).build());
	}


	@Override
	public void sendMessagesByConversationId(Long conversationId) {
	    Conversation conversation = new Conversation();
	    conversation.setConversationId(conversationId);
	    List<Message> messageList = messageRepository.findAllByConversation(conversation);
	    List<MessageResponse> messageResponseList = messageList.stream()
	            .map((Message message) -> new MessageResponse.Builder()
	                    .messageId(message.getId())
	                    .message(message.getMessage())
	                    .timestamp(Date.from(message.getTimestamp().atZone(ZoneId.systemDefault()).toInstant()))
	                    .senderId(message.getSender().getId())
	                    .receiverId(message.getReceiver().getId())
	                    .build())
	            .toList();
	    messagingTemplate.convertAndSend("/topic/conv/" + conversationId,
	            new WebSocketResponse.Builder().type("ALL").data(messageResponseList).build());
	}


	@Override
	public void saveMessage(MessageRequest msg) {
	    User sender = userRepository.findById(msg.getSenderId()).get();
	    User receiver = userRepository.findById(msg.getReceiverId()).get();
	    Conversation conversation = conversationRepository.findConversationByUsers(sender, receiver).get();
	    Message newMessage = new Message();
	    newMessage.setMessage(msg.getMessage());
	    newMessage.setTimestamp(msg.getTimestamp());
	    newMessage.setConversation(conversation);
	    newMessage.setSender(sender);
	    newMessage.setReceiver(receiver);
	    Message savedMessage = messageRepository.save(newMessage);

	    // notify listener
	    MessageResponse res = new MessageResponse.Builder()
	            .messageId(savedMessage.getId())
	            .message(savedMessage.getMessage())
	            .timestamp(Date.from(savedMessage.getTimestamp().atZone(ZoneId.systemDefault()).toInstant()))
	            .senderId(savedMessage.getSender().getId())
	            .receiverId(savedMessage.getReceiver().getId())
	            .build();

	    messagingTemplate.convertAndSend("/topic/conv/".concat(msg.getConversationId().toString()),
	            new WebSocketResponse.Builder().type("ADDED").data(res).build());

	    sendUserConversationByUserId(msg.getSenderId());
	    sendUserConversationByUserId(msg.getReceiverId());
	}


	@Transactional
	@Override
	public void deleteConversationByConversationId(Long conversationId) {
		Conversation c = new Conversation();
		c.setConversationId(conversationId);
		messageRepository.deleteAllByConversation(c);
		conversationRepository.deleteById(conversationId);
	}

	@Override
	public void deleteMessageByMessageId(Long conversationId, Long messageId) {
		messageRepository.deleteById(messageId);
		// notify listener
		sendMessagesByConversationId(conversationId);
	}
	
	

	
}
