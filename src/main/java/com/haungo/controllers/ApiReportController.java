package com.haungo.controllers;

import com.haungo.pojos.Report;
import com.haungo.pojos.TypeReport;
import com.haungo.pojos.User;
import com.haungo.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
public class ApiReportController {
    @Autowired private ReportService reportService;

    @PostMapping(value = "/api/add-report/{userReportId}", produces = MediaType.APPLICATION_JSON_VALUE)
    public HttpStatus addReport(@RequestBody Report report, @PathVariable Integer userReportId,
                                HttpSession session) {
        User user = (User) session.getAttribute("currentUser");
        report.setUser(user);
        report.setUserReport(new User(userReportId));
        report.setTypeReport(new TypeReport(Integer.parseInt(report.getTypeReportId())));

        if (this.reportService.addReport(report)==false) return HttpStatus.BAD_REQUEST;

        return  HttpStatus.OK;
    }
}
