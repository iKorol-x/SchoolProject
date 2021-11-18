import com.skd.controller.Excel;
import com.skd.domain.Information;
import com.skd.domain.User;
import com.skd.service.InformationService;
import com.skd.service.SalaryService;
import com.skd.service.UserService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class test01 {
    @Test
    public void test(){
        ApplicationContext atx = new ClassPathXmlApplicationContext("conf/applicationContext.xml");
        UserService service = (UserService) atx.getBean("userServiceImpl");
        List<User> userList= service.querryUser();
        System.out.println(userList);
    }
    @Test
    public void test02(){
        ApplicationContext atx = new ClassPathXmlApplicationContext("conf/applicationContext.xml");
        UserService service = (UserService) atx.getBean("userServiceImpl");
        User user = new User();
        user.setUsername("mcl");
        user.setPassword("123456");
        user.setPriority(0);
        int nums = service.addUser(user);
        System.out.println(nums);
    }
    @Test
    public void test03(){
        ApplicationContext atx = new ClassPathXmlApplicationContext("conf/applicationContext.xml");
        UserService service = (UserService) atx.getBean("userServiceImpl");
        User user = new User();
        user.setId(2);
        user.setUsername("user01");
        user.setPassword("123456");
        user.setPriority(0);
        int nums = service.modifyUser(user);
        System.out.println(nums);
    }
    @Test
    public void test04(){
        ApplicationContext atx = new ClassPathXmlApplicationContext("conf/applicationContext.xml");
        SalaryService service = (SalaryService) atx.getBean("salaryServiceImpl");
        service.dropSalary("111");
        System.out.println(service.querrySalary());
    }
    @Test
    public void test05(){
        ApplicationContext atx = new ClassPathXmlApplicationContext("conf/applicationContext.xml");
        InformationService  is= (InformationService) atx.getBean("informationServiceImpl");
        System.out.println(is.queryAllInformation());
    }


}
