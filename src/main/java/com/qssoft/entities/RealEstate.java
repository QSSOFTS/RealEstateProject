package com.qssoft.entities;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;

@Entity
@Table( name = "RealEstates" )
public class RealEstate implements Serializable
{
    private static final long serialVersionUID = 1L;
    private int id;
    private String title;
    private String description;
    private int ownerId;
    private BigDecimal price;
    private String address;
    private String nearbyLocations;
    private String adminNote;
    private int statusId;
    private Float latitude;
    private Float longitude;

    @Id
    @GeneratedValue(generator="increment")
    @GenericGenerator(name="increment", strategy = "increment")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Column(name = "ownerId")
    public int getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }

    @Column(name = "price")
    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    @Column(name = "address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Column(name = "nearbyLocations")
    public String getNearbyLocations() {
        return nearbyLocations;
    }

    public void setNearbyLocations(String nearbyLocations) {
        this.nearbyLocations = nearbyLocations;
    }

    @Column(name = "adminNote")
    public String getAdminNote() {
        return adminNote;
    }

    public void setAdminNote(String adminNote) {
        this.adminNote = adminNote;
    }

    @Column(name = "statusId")
    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    @Column(name = "lat")
    public Float getLatitude() {
        return latitude;
    }

    public void setLatitude(Float latitude) {
        this.latitude = latitude;
    }

    @Column(name = "lng")
    public Float getLongitude() {
        return longitude;
    }

    public void setLongitude(Float longitude) {
        this.longitude = longitude;
    }

    public RealEstate(String title, String description, int ownerId, BigDecimal price, String address, String
            nearbyLocations, String adminNote, int statusId, Float latitude, Float longitude) {
        this.title = title;
        this.description = description;
        this.ownerId = ownerId;
        this.price = price;
        this.address = address;
        this.nearbyLocations = nearbyLocations;
        this.adminNote = adminNote;
        this.statusId = statusId;
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public RealEstate() {
    }
}
