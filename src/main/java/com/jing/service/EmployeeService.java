package com.jing.service;

import com.jing.bean.Employee;
import com.jing.bean.EmployeeExample;
import com.jing.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;
    public List<Employee> getAll() {

        return  employeeMapper.selectByExampleWithDept(null);
    }
    //员工保存方法
    public void saveEmp(Employee employee) {

        employeeMapper.insertSelective(employee);
    }
    //检验用户名是否可用
    public boolean checkUser(@RequestParam("empName") String empName) {

        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(example);
        return count == 0;
    }

    public Employee getEmp(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        return employee;
    }

    public void updateEmp(Employee employee) {

        employeeMapper.updateByPrimaryKeySelective(employee);
    }
}
