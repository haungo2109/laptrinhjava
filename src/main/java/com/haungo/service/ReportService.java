package com.haungo.service;

import com.haungo.pojos.Report;

import java.util.List;

public interface ReportService {
    List<Report> getReports();
    boolean addReport(Report report);
}
