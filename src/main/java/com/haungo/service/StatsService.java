package com.haungo.service;

import java.util.Date;
import java.util.List;

public interface StatsService {
    List<Object[]> categoryStats();
    List<Object[]> statusAuction();
    List<Long> overviewStats(Date fromDate, Date toDate);
    List<Object[]> postStats(String kw, Date fromDate, Date toDate);
    List<Object[]> auctionStats(Integer categoryId, Date fromDate, Date toDate);
}
