export interface ConversationResponse {
  conversationId: number;
  otherUserId: number;
  otherUserName: string;
  lastMessage: string;
  lastMessageTimestamp: string;
  lastReceiverId: number;
  lastsenderId: number;
  seen: boolean;
}
