package java_web.demo09.repository.login;

import java_web.demo09.connection.ConnectionDB;
import java_web.demo09.model.Customer;
import org.springframework.stereotype.Repository;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

@Repository
public class LoginRepositoryImp implements LoginRepository{

    @Override
    public Customer login(String email, String password) {
        Connection conn = null;
        CallableStatement callst = null;
        Customer customer = null;
        try {
            conn = ConnectionDB.openConnection();
            callst = conn.prepareCall("{call login(?,?)}");
            callst.setString(1, email);
            callst.setString(2, password);
            ResultSet rs =  callst.executeQuery();
            while (rs.next()) {
                customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setName(rs.getString("name"));
                customer.setPhone(rs.getString("phone"));
                customer.setAddress(rs.getString("address"));
                customer.setEmail(rs.getString("email"));
                customer.setGender(rs.getString("gender"));
                customer.setPassword(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            ConnectionDB.closeConnection(conn, callst);
        }
        return customer;
    }
}
