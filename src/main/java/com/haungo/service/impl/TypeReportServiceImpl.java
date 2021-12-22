package com.haungo.service.impl;

import com.haungo.pojos.TypeReport;
import com.haungo.repository.TypeReportRepository;
import com.haungo.service.TypeReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeReportServiceImpl implements TypeReportService {
    @Autowired private TypeReportRepository typeReportRepository;

    @Override
    public List<TypeReport> getTypeReports() {
        return this.typeReportRepository.getTypeReports();
    }

    @Override
    public boolean addTypeReport(TypeReport typeReport) {
        return this.typeReportRepository.addTypeReport(typeReport);
    }

    @Override
    public TypeReport getTypeReportById(Integer id) {
        return this.typeReportRepository.getTypeReportById(id);
    }
}
