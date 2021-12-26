package com.haungo.service.impl;

import com.haungo.repository.StatsRepository;
import com.haungo.service.StatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class StatsServiceImpl implements StatsService {
    @Autowired private StatsRepository statsRepository;
    @Override
    public List<Object[]> categoryStats() {
        return this.statsRepository.categoryStats();
    }

    @Override
    public List<Object[]> statusAuction() {
        return this.statsRepository.statusAuction();
    }

    @Override
    public List<Long> overviewStats(Date fromDate, Date toDate) {
        return this.statsRepository.overviewStats(fromDate, toDate);
    }

    @Override
    public List<Object[]> postStats(String kw, Date fromDate, Date toDate) {
        return this.statsRepository.postStats(kw, fromDate, toDate);
    }

    @Override
    public List<Object[]> auctionStats(Integer categoryId, Date fromDate, Date toDate) {
        return this.statsRepository.auctionStats(categoryId, fromDate, toDate);
    }
}
