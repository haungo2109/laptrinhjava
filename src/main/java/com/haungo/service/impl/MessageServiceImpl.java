package com.haungo.service.impl;

import com.haungo.pojos.Message;
import com.haungo.pojos.Notification;
import com.haungo.repository.MessageRepository;
import com.haungo.service.MessageService;
import com.haungo.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
    @Autowired private MessageRepository messageRepository;
    @Autowired private NotificationService notificationService;
    @Autowired private SimpMessagingTemplate messagingTemplate;

    @Override
    public Message getMessageById(Integer id) {
        return this.messageRepository.getMessageById(id);
    }

    @Override
    public List<Message> getMessageByUserId(Integer uid) {
        return this.messageRepository.getMessageByUserId(uid);
    }

    @Override
    public List<Message> getMessageByAuctionId(Integer auctionId) {
        return this.messageRepository.getMessageByAuctionId(auctionId);
    }

    @Override
    public Message addMessage(Message message) {
        Message message1 = this.messageRepository.addMessage(message);
        if (message1 != null){
            String content = Notification.genContent(message.getFrom(), " đã nhắn ") + message.getContent();
            Notification notification = new Notification(Notification.AddMessage, content, message.getTo());
            this.notificationService.addNotification(notification);

            messagingTemplate.convertAndSendToUser(notification.getUser().getUsername(),"/topic/chatMessage", message1);
            return message1;
        }
        return null;
    }
}
