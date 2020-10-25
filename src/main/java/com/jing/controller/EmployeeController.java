package com.jing.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jing.bean.Employee;
import com.jing.bean.Msg;
import com.jing.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;

/*处理员工CRUD请求*/
@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    @ResponseBody
    @RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
    public Msg saveEmp(Employee employee){
        employeeService.updateEmp(employee);
        return Msg.success();
    }

    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){
        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp",employee);
    }
    /**
     * 检查用户名是否可用
     * @param empName
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkuser")
    public Msg checkuse(String empName){

        String regx = "(^[a-zA-Z0-9_-]{6,16})";
        if(!empName.matches(regx)){
            return Msg.fail().add("va_msg","用户名必须是6-16位数字和字母的组合");
        }
        //数据库校验
        boolean b = employeeService.checkUser(empName);
        if (b){
            return Msg.success();
        }else{
            return Msg.fail().add("va_msg","用户名不可用");
        }
    }

    @RequestMapping(value="/emp",method= RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        HashMap<Object, Object> map = new HashMap<>();
        List<FieldError> errors = result.getFieldErrors();
        if (result.hasErrors()){
            for (FieldError fieldError : errors){

                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorField",map);
        }else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }

    }

    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmosWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        //引入分页插件PageHelper
        //在查询之前只需调用，传入页码，以及每页的页面大小
        PageHelper.startPage(pn,5);
        //startPage后面紧跟的查询就是一个分页查询
        List<Employee> emps = employeeService.getAll();
        //用来包装查询后结果，只需将pageInfo交给页面
        //封装了详细的分页信息，包括我们查询出来的结果,传入连续显示的页数
        PageInfo page = new PageInfo(emps,5);
        return Msg.success().add("pageInfo",page);

    }

    //@RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){

        //引入分页插件PageHelper
        //在查询之前只需调用，传入页码，以及每页的页面大小
        PageHelper.startPage(pn,5);
        //startPage后面紧跟的查询就是一个分页查询
        List<Employee> emps = employeeService.getAll();
        //用来包装查询后结果，只需将pageInfo交给页面
        //封装了详细的分页信息，包括我们查询出来的结果,传入连续显示的页数
        PageInfo page = new PageInfo(emps,5);
        model.addAttribute("pageInfo",page);
        return "list";
    }
/*    @RequestMapping("/emps")
    public String getEmps(){

        return "list";
    }*/
}
