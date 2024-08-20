package ma.zs.alc.dao.facade.core.chat;

import ma.zs.alc.bean.core.chat.Conversation;
import ma.zs.alc.ws.dto.chat.ConversationResponse;
import ma.zs.alc.zynerator.security.bean.User;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface ConversationRepository extends JpaRepository<Conversation, Long> {

	@Query("SELECT c FROM Conversation c WHERE (c.user1 = :user1 AND c.user2 = :user2) OR (c.user1 = :user2 AND c.user2 = :user1)")
	Optional<Conversation> findConversationByUsers(@Param("user1") User user1, @Param("user2") User user2);

	@Query(nativeQuery = true, value = """
						SELECT
			    C.conversation_id AS conversationId,
			    C.seen AS seen,
			    U.id AS otherUserId,
			    U.username AS otherUserName,
			    M.sender_id AS LastsenderId,
			    M.receiver_id AS LastReceiverId,
			    M.message AS lastMessage,
			    M.timestamp AS lastMessageTimestamp
			FROM conversation AS C

			INNER JOIN user AS U
			ON (C.user1_id = U.id OR C.user2_id = U.id) AND U.id != ?1

			LEFT JOIN (
			    SELECT
			        M1.conversation_id,
			        M1.sender_id,
			        M1.receiver_id,
			        M1.message,
			        M1.timestamp
			    FROM message M1
			    WHERE M1.timestamp = (
			        SELECT MAX(M2.timestamp)
			        FROM message M2
			        WHERE M2.conversation_id = M1.conversation_id
			    )
			) AS M
			ON C.conversation_id = M.conversation_id

			WHERE C.user1_id = ?1 OR C.user2_id = ?1
			ORDER BY M.timestamp DESC;
						""")
	List<ConversationResponse> findConversationsByUserId(Long userId);

	void save(Optional<Conversation> conv);

}
