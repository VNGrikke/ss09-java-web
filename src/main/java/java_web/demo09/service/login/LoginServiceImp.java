package java_web.demo09.service.login;

import java_web.demo09.model.Customer;
import java_web.demo09.repository.login.LoginRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImp implements LoginService{

    @Autowired
    private LoginRepository loginRepository;


    @Override
    public Customer login(String email, String password) {
        return loginRepository.login(email, password);

    }
}
