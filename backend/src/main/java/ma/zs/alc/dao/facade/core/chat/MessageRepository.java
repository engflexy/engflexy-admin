package ma.zs.alc.dao.facade.core.chat;

import org.springframework.data.jpa.repository.JpaRepository;

import ma.zs.alc.bean.core.chat.Conversation;
import ma.zs.alc.bean.core.chat.Message;

import java.util.List;

public interface MessageRepository extends JpaRepository<Message, Long> {

	List<Message> findAllByConversation(Conversation conversation);

	void deleteAllByConversation(Conversation conversation);
}
