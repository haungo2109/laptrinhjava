package com.haungo.service;

import com.haungo.pojos.Message;

import java.util.List;

public interface MessageService {
    Message getMessageById(Integer id);
    List<Message> getMessageByUserId(Integer uid);
    List<Message> getMessageByAuctionId(Integer auctionId);
    Message addMessage(Message message);
}
