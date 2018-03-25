package com.devone.finalp.webchat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.StringTokenizer;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.OnClose; // 접속이 끊겼을때 처리
import javax.websocket.OnMessage; // 클라이언트로부터 메시지가 도착했을때
import javax.websocket.OnOpen; // 클라이언트 ㅡ 서버로 접속할때
import javax.websocket.OnError;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint; // 클라이언트에서 서버로 접솔할 주소 지정

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.devone.finalp.common.model.vo.Webchat;
import com.devone.finalp.webchat.model.service.webchatService;
import com.sun.xml.internal.ws.api.message.stream.InputStreamMessage;
 
@ServerEndpoint("/broadcasting")
public class ChatBroadCast {
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
    
    
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
    	
        synchronized(clients) {
            for(Session client : clients) {
            			if(!client.equals(session)) {
                			client.getBasicRemote().sendText(message);	
            		}
                
            	
            }
        }
    }
    
    @OnOpen
    public void onOpen(Session session) throws IOException {
        clients.add(session);
    }
    
    @OnClose
    public void onClose(Session session) throws IOException {
        clients.remove(session);
    }
    @OnError public void error(Session session, Throwable t) { 
    	clients.remove(session);
    	System.out.println(t);
    	} 
}
 