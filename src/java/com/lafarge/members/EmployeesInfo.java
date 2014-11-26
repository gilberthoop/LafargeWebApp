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
import javax.persistence.Lob;
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
@Table(name = "employees_info")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "EmployeesInfo.findAll", query = "SELECT e FROM EmployeesInfo e")})
public class EmployeesInfo implements Serializable {
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
    @Column(name = "previousOrientationDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date previousOrientationDate;
    @Basic(optional = false)
    @Lob
    @Column(name = "allowLogin")
    private String allowLogin;

    public EmployeesInfo() {
    }

    public EmployeesInfo(Integer id) {
        this.id = id;
    }

    public EmployeesInfo(Integer id, String fullName, String phoneNumber, String company, Date previousOrientationDate, String allowLogin) {
        this.id = id;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.company = company;
        this.previousOrientationDate = previousOrientationDate;
        this.allowLogin = allowLogin;
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

    public Date getPreviousOrientationDate() {
        return previousOrientationDate;
    }

    public void setPreviousOrientationDate(Date previousOrientationDate) {
        this.previousOrientationDate = previousOrientationDate;
    }

    public String getAllowLogin() {
        return allowLogin;
    }

    public void setAllowLogin(String allowLogin) {
        this.allowLogin = allowLogin;
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
        if (!(object instanceof EmployeesInfo)) {
            return false;
        }
        EmployeesInfo other = (EmployeesInfo) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lafarge.members.EmployeesInfo[ id=" + id + " ]";
    }
    
}
