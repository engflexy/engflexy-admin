import { Injectable } from '@angular/core';
import { Subscription } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class StompService {
  private socket: any;
  private stompClient: any;
  private connected: Promise<void>;
  private resolveConnected: () => void;

  constructor() {
    this.connected = new Promise((resolve) => {
      this.resolveConnected = resolve;
    });
    this.initializeWebSocketConnection();
  }

  private initializeWebSocketConnection(): void {
    console.log("initializeWebSocketConnection")
    this.socket = new SockJS('http://localhost:8036/stomp-endpoint', null, {
      withCredentials: true
    });
    this.stompClient = Stomp.over(this.socket);

    // Disable debugging output
    this.stompClient.debug = null;

    // Connect to the WebSocket server
    this.stompClient.connect({}, this.onConnect.bind(this), this.onError.bind(this));
  }

  private onConnect(): void {
    console.log('Connected to the WebSocket server');
    this.resolveConnected();
  }

  private onError(error: string): void {
    console.error('WebSocket connection error:', error);
  }

  // Subscribe to a specific topic and provide a callback function to handle incoming messages
  async subscribe(topic: string, callback: (message: any) => void): Promise<Subscription> {
    console.log("subscribe")

    await this.connected;
    return this.stompClient.subscribe('/topic/' + topic, (frame: any): any => {
      callback(JSON.parse(frame.body));
    });
  }

  // Send a message to a specific application using Stomp
  async send(app: string, data: any): Promise<void> {
    console.log("send")

    await this.connected;
    this.stompClient.send('/app/' + app, {}, JSON.stringify(data));
  }
}
