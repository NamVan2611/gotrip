package com.spring.gotrip.model;

import jakarta.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class BookingServiceId implements Serializable {

    private Long bookingId;
    private Long serviceId;

    public BookingServiceId() {}

    public BookingServiceId(Long bookingId, Long serviceId) {
        this.bookingId = bookingId;
        this.serviceId = serviceId;
    }

    // Getter & Setter
    public Long getBookingId() {
        return bookingId;
    }

    public void setBookingId(Long bookingId) {
        this.bookingId = bookingId;
    }

    public Long getServiceId() {
        return serviceId;
    }

    public void setServiceId(Long serviceId) {
        this.serviceId = serviceId;
    }

    // equals & hashCode
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof BookingServiceId)) return false;
        BookingServiceId that = (BookingServiceId) o;
        return Objects.equals(bookingId, that.bookingId) &&
               Objects.equals(serviceId, that.serviceId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bookingId, serviceId);
    }
}
