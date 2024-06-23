/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.User;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Feature;
import model.Role;

/**
 *
 * @author KEISHA
 */
public class UserDBContext extends DBContext<User> {

    public User get(String username, String password) {
        PreparedStatement stm = null;
        User user = null;

        try {

            String sql = "SELECT \n"
                    + "    u.username,\n"
                    + "    u.displayname,\n"
                    + "    r.roleid,\n"
                    + "    r.rolename,\n"
                    + "    f.featureid,\n"
                    + "    f.url\n"
                    + "FROM lecturer_account u\n"
                    + "LEFT JOIN account_roles ur ON u.username = ur.username\n"
                    + "LEFT JOIN roles r ON r.roleid = ur.roleid\n"
                    + "LEFT JOIN roles_features rf ON rf.roleid = r.roleid\n"
                    + "LEFT JOIN features f ON f.featureid = rf.featureid\n"
                    + "WHERE u.username = ? \n"
                    + "  AND u.password = ?\n"
                    + "ORDER BY u.username, r.roleid, f.featureid ASC;";

            stm = connect.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();

            Role r_role = new Role();
            r_role.setId(-1);

            while (rs.next()) {
                if (user == null) {
                    user = new User();
                    user.setUsername(username);
                    user.setDisplayname(rs.getString("displayname"));
                }

                int roleid = rs.getInt("roleid");
                if (roleid != 0 && roleid != r_role.getId()) {
                    r_role = new Role();
                    r_role.setId(roleid);
                    r_role.setName(rs.getString("rolename"));
                    user.getRoles().add(r_role);

                }
                int featureid = rs.getInt("featureid");
                if(featureid!=0)
                {
                    Feature f = new Feature();
                    f.setId(featureid);
                    f.setUrl(rs.getString("url"));
                    r_role.getFeatures().add(f);
                }
                
                
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return user;
    }

    @Override
    public void insert() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public User get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<User> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
