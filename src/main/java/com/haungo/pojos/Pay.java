package com.haungo.pojos;

import com.haungo.utils.HMACUtil;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.*;

public class Pay {
    private long amount;
    private String orderId;

    public Pay(long amount, String orderId) {
        this.amount = amount;
        this.orderId = orderId;
    }

    private Map<String, String> config = new HashMap(){{
        put("app_id", "2553");
        put("key1", "PcY4iZIKFCIdgZvA6ueMcMHHUbRLYjPL");
        put("key2", "kLtgPl8HHhfvMuDHPwKfgfsY4Ydm9eIz");
        put("endpoint", "https://sb-openapi.zalopay.vn/v2/create");
    }};

    public String getCurrentTimeString(String format) {
        Calendar cal = new GregorianCalendar(TimeZone.getTimeZone("GMT+7"));
        SimpleDateFormat fmt = new SimpleDateFormat(format);
        fmt.setCalendar(cal);
        return fmt.format(cal.getTimeInMillis());
    }

    public JSONObject makeRequest(Map auction) throws Exception
    {
        final Map embed_data = new HashMap(){{
            put("redirecturl", "http://localhost:8088/laptrinhjava/auction/"+auction.getOrDefault("auctionId", ""));
        }};

        final Map[] item = {
            auction
        };
        String itemStr = "";
        for (Map entry : item) {
            itemStr += new JSONObject(entry).toString();
        }
        itemStr = "[" + itemStr + "]";

        String finalItemStr = itemStr;
        Map<String, Object> order = new HashMap<String, Object>(){{
            put("app_id", config.get("app_id"));
            put("app_trans_id", getCurrentTimeString("yyMMdd") +"_"+ orderId); // translation missing: vi.docs.shared.sample_code.comments.app_trans_id
            put("app_time", System.currentTimeMillis()); // miliseconds
            put("app_user", "demo");
            put("amount", amount);
            put("description", "Thanh toán đấu giá: Mã sản phẩm #"+orderId);
            put("bank_code", "zalopayapp");
            put("item", finalItemStr);
            put("embed_data", new JSONObject(embed_data).toString());
        }};

        // app_id +”|”+ app_trans_id +”|”+ appuser +”|”+ amount +"|" + app_time +”|”+ embed_data +"|" +item
        String data = order.get("app_id") +"|"+ order.get("app_trans_id") +"|"+ order.get("app_user") +"|"+ order.get("amount")
                +"|"+ order.get("app_time") +"|"+ order.get("embed_data") +"|"+ order.get("item");
        order.put("mac", HMACUtil.HMacHexStringEncode(HMACUtil.HMACSHA256, this.config.get("key1"), data));

        CloseableHttpClient client = HttpClients.createDefault();
        HttpPost post = new HttpPost(this.config.get("endpoint"));

        List<NameValuePair> params = new ArrayList<>();
        for (Map.Entry<String, Object> e : order.entrySet()) {
            params.add(new BasicNameValuePair(e.getKey(), e.getValue().toString()));
        }

        // Content-Type: application/x-www-form-urlencoded
        post.setEntity(new UrlEncodedFormEntity(params));

        CloseableHttpResponse res = client.execute(post);
        BufferedReader rd = new BufferedReader(new InputStreamReader(res.getEntity().getContent()));
        StringBuilder resultJsonStr = new StringBuilder();
        String line;

        while ((line = rd.readLine()) != null) {
            resultJsonStr.append(line);
        }

        JSONObject result = new JSONObject(resultJsonStr.toString());

        for (String key : result.keySet()) {
            System.out.format("%s = %s\n", key, result.get(key));
        }
        return result;
    }
}
