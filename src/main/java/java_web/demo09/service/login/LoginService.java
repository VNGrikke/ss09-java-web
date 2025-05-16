package java_web.demo09.service.login;

import java_web.demo09.model.Customer;

public interface LoginService {
    Customer login(String email, String password);
}
