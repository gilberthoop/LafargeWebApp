/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lafarge.members;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author clementino
 */
@Entity
@Table(name = "employees_signin_signoff")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EmployeesSigninSignoff.findAll", query = "SELECT e FROM EmployeesSigninSignoff e"),
    @NamedQuery(name = "EmployeesSigninSignoff.findById", query = "SELECT e FROM EmployeesSigninSignoff e WHERE e.id = :id"),
    @NamedQuery(name = "EmployeesSigninSignoff.findByFullName", query = "SELECT e FROM EmployeesSigninSignoff e WHERE e.fullName = :fullName"),
    @NamedQuery(name = "EmployeesSigninSignoff.findByPhoneNumber", query = "SELECT e FROM EmployeesSigninSignoff e WHERE e.phoneNumber = :phoneNumber"),
    @NamedQuery(name = "EmployeesSigninSignoff.findByCompany", query = "SELECT e FROM EmployeesSigninSignoff e WHERE e.company = :company"),
    @NamedQuery(name = "EmployeesSigninSignoff.findBySignInTime", query = "SELECT e FROM EmployeesSigninSignoff e WHERE e.signInTime = :signInTime"),
    @NamedQuery(name = "EmployeesSigninSignoff.findBySignOutTime", query = "SELECT e FROM EmployeesSigninSignoff e WHERE e.signOutTime = :signOutTime")})
public class EmployeesSigninSignoff implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "fullName")
    private String fullName;
    @Basic(optional = false)
    @Column(name = "phoneNumber")
    private String phoneNumber;
    @Basic(optional = false)
    @Column(name = "company")
    private String company;
    @Basic(optional = false)
    @Column(name = "signInTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date signInTime;
    @Column(name = "signOutTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date signOutTime;

    public EmployeesSigninSignoff() {
    }

    public EmployeesSigninSignoff(Integer id) {
        this.id = id;
    }

    public EmployeesSigninSignoff(Integer id, String fullName, String phoneNumber, String company, Date signInTime) {
        this.id = id;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.company = company;
        this.signInTime = signInTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public Date getSignInTime() {
        return signInTime;
    }

    public void setSignInTime(Date signInTime) {
        this.signInTime = signInTime;
    }

    public Date getSignOutTime() {
        return signOutTime;
    }

    public void setSignOutTime(Date signOutTime) {
        this.signOutTime = signOutTime;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EmployeesSigninSignoff)) {
            return false;
        }
        EmployeesSigninSignoff other = (EmployeesSigninSignoff) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lafarge.members.EmployeesSigninSignoff[ id=" + id + " ]";
    }
    
}
