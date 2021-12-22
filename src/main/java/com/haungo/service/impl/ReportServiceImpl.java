package com.haungo.service.impl;

import com.haungo.pojos.Report;
import com.haungo.repository.ReportRepository;
import com.haungo.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReportServiceImpl implements ReportService {
    @Autowired private ReportRepository reportRepository;

    @Override
    public List<Report> getReports() {
        return this.reportRepository.getReports();
    }

    @Override
    public boolean addReport(Report report) {
        return this.reportRepository.addReport(report);
    }
}
