package com.haungo.repository;

import com.haungo.pojos.TypeReport;

import java.util.List;

public interface TypeReportRepository {
    List<TypeReport> getTypeReports();
    boolean addTypeReport(TypeReport typeReport);
    TypeReport getTypeReportById(Integer id);
}
