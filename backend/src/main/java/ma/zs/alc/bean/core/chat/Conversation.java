package ma.zs.alc.bean.core.chat;

import jakarta.persistence.*;
import ma.zs.alc.zynerator.security.bean.User;

@Entity
@Table(name = "conversation")
public class Conversation {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "conversation_id")
	private Long id;

	@ManyToOne
	@JoinColumn(name = "user1_id")
	private User user1;

	@ManyToOne
	@JoinColumn(name = "user2_id")
	private User user2;

	// No-argument constructor
	public Conversation() {
	}

	// All-argument constructor
	public Conversation(Long id, User user1, User user2) {
		this.id = id;
		this.user1 = user1;
		this.user2 = user2;
	}

	// Getters and Setters
	public Long getId() {
		return id;
	}

	public void setConversationId(Long id) {
		this.id = id;
	}

	public User getUser1() {
		return user1;
	}

	public void setUser1(User user1) {
		this.user1 = user1;
	}

	public User getUser2() {
		return user2;
	}

	public void setUser2(User user2) {
		this.user2 = user2;
	}
}
