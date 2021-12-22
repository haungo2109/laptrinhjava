package com.haungo.service;

import com.haungo.pojos.TypeReport;

import java.util.List;

public interface TypeReportService {
    List<TypeReport> getTypeReports();
    boolean addTypeReport(TypeReport typeReport);
    TypeReport getTypeReportById(Integer id);
}
