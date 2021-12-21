package com.haungo.repository;

import com.haungo.pojos.Payment;

import java.util.List;

public interface PaymentRepository {
    List<Payment> getPayments();
    Payment getPaymentById(int payId);
    boolean addPayment(Payment payment);
}
