package com.haungo.controllers;

import com.haungo.pojos.*;
import com.haungo.service.AuctionService;
import com.haungo.utils.HMACUtil;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import com.google.gson.Gson;

import javax.xml.ws.Response;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class PaymenController {

    @Autowired private AuctionService auctionService;

    @GetMapping(value = "/api/payment/zalopay/{feedId}")
    public ResponseEntity<StringResponse> getComment(@PathVariable Integer feedId) {
        Auction auction = this.auctionService.getAuctionById(feedId);
        if (auction == null) return new ResponseEntity(new StringResponse("Không thấy đấu giá."), HttpStatus.BAD_REQUEST);


        String orderId = String.format("Kanj_auctionId%d_userId%d",auction.getId(), auction.getUser().getId());
        long price = auction.getAcceptPrice().longValue();
        Map item = new HashMap(){{
            put("auctionId", auction.getId());
            put("buylerId", auction.getBuyler().getId());
            put("price", auction.getAcceptPrice());
        }};

        Pay pay = new Pay(price, orderId);
        try {
            JSONObject resultPayment = pay.makeRequest(item);
            if (resultPayment.getInt("return_code") == 1)
                return new ResponseEntity(new StringResponse(resultPayment.getString("order_url")), HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
        }

//        String description = "Thanh toán đấu giá " + auction.getTitle();
//        ZaloPay zaloPay = new ZaloPay(orderId, price, description, feedId, auction);
//
//        Gson gson = new Gson();
//        HttpClient httpClient = HttpClientBuilder.create().build();
//        HttpPost post = new HttpPost(zaloPay.getUrl());
//        String body = gson.toJson(zaloPay);
//        StringEntity postingString = new StringEntity(gson.toJson(zaloPay), ContentType.APPLICATION_JSON);//gson.tojson() converts your pojo to json
//        post.setEntity(postingString);
//        post.setHeader("Content-type", "application/json");
//        try {
//            HttpResponse response = httpClient.execute(post);
//            String rs = EntityUtils.toString(response.getEntity());
//            ResultPayment resultPayment = gson.fromJson(rs, ResultPayment.class);
//            if (resultPayment.getReturn_code() == 1)
//                return new ResponseEntity(new StringResponse(resultPayment.getOrder_url()), HttpStatus.OK);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

        return new ResponseEntity(new StringResponse("Không tạo được mã thanh toán"), HttpStatus.BAD_REQUEST);
    }
}
