package kr.or.ddit.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class SocketChatHandler extends TextWebSocketHandler {
	private static final Logger logger = LoggerFactory.getLogger(SocketChatHandler.class);

	private List<WebSocketSession> sessionList;	// 소켓에 연결된 세션정보
	public SocketChatHandler() {
		sessionList = new ArrayList<>();
	}

	// 클라이언트가 웹소켓에 접속하여 연결이 맺어진 후에 호출
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String user = getUser(session);
		sessionList.add(session);
		logger.debug("채팅 접속 : {}", user);
		logger.debug("☞챗에 접속 인가요?:{}",user);
	}
	
// 클라이언트가 웹소켓에 메세지를 전송한 경우 : 모든 사용자에게 메세지를 전달
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) 
	throws Exception {
			String user = getUser(session);
			logger.debug("메세지전송 = {} : {}", user, message.getPayload());
			for (WebSocketSession currentSession : sessionList)
				currentSession.sendMessage(new TextMessage(user + " : " + message.getPayload()));
		}
	
	// 클라이언트 연결이 종료된경우 : 연결 리스트에서 해당 사용자 제거
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status)
	throws Exception {
		
			String user = getUser(session);
			sessionList.remove(session);
			logger.debug("☞연결 끊김:{}",user);
			logger.debug("연결 끊김 : {}", user);
		}
	
	//webSocketSession으로부터 userId 정보 조회
	private String getUser(WebSocketSession session) {
		logger.debug("☞session.getAttributes().get(mem_id) :{}",session.getAttributes().get("mem_id"));
		return (String) session.getAttributes().get("mem_id");
		
	}
	// 서버측에서 모든 websocket session으로 보내는 메세지
		public void serverToClient() throws IOException {
			for(WebSocketSession wSession : sessionList)
				wSession.sendMessage(new TextMessage("서버 전송 메세지"));				
		}
	




}