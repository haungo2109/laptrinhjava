package com.haungo.service.impl;

import com.haungo.pojos.Payment;
import com.haungo.repository.PaymentRepository;
import com.haungo.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaymentServiceImpl implements PaymentService {
    @Autowired private PaymentRepository paymentRepository;

    @Override
    public List<Payment> getPayments() {
        return this.paymentRepository.getPayments();
    }

    @Override
    public Payment getPaymentById(int payId) {
        return this.paymentRepository.getPaymentById(payId);
    }

    @Override
    public boolean addPayment(Payment payment) {
        return this.paymentRepository.addPayment(payment);
    }
}
