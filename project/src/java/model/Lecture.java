/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author KEISHA
 */
public class Lecture {
    private int id;
    private String l_name;
    private ArrayList<Subject> subs = new ArrayList();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getL_name() {
        return l_name;
    }

    public void setL_name(String l_name) {
        this.l_name = l_name;
    }

    public ArrayList<Subject> getSubs() {
        return subs;
    }

    public void setSubs(ArrayList<Subject> subs) {
        this.subs = subs;
    }
    
    
}
