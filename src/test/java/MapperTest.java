import com.jing.bean.Department;
import com.jing.bean.Employee;
import com.jing.dao.DepartmentMapper;
import com.jing.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;
    /**
     * 测试DepartmentMapper
     */
    @Test
    public void testCRUD(){
        System.out.println(departmentMapper);
//        departmentMapper.insertSelective(new Department(null,"开发部"));
//        departmentMapper.insertSelective(new Department(null,"测试部"));

        //employeeMapper.insertSelective(new Employee(null,"Jerry","M","Jerry@atguigu.com",1));

//        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//        for(int i = 0;i<1000;i++){
//            String uid = UUID.randomUUID().toString().substring(0,5)+i;
//            mapper.insertSelective(new Employee(null,uid,"M",uid+"@atguigu",1));
//
//        }
//        System.out.println("piliangzhixingwancheng");
    }



}
