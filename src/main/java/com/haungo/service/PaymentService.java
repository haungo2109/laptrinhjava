package com.haungo.service;

import com.haungo.pojos.Payment;

import java.util.List;

public interface PaymentService {
    List<Payment> getPayments();
    Payment getPaymentById(int payId);
    boolean addPayment(Payment payment);
}
