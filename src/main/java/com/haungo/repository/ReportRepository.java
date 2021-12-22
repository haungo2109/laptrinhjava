package com.haungo.repository;

import com.haungo.pojos.Report;

import java.util.List;

public interface ReportRepository {
    List<Report> getReports();
    boolean addReport(Report report);
}
