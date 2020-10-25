package com.jing.dao;

import com.jing.bean.Department;
import com.jing.bean.DepartmentExample;
import com.jing.bean.Employee;
import com.jing.bean.EmployeeExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepartmentMapper {

    long countByExample(DepartmentExample example);

    int deleteByExample(DepartmentExample example);

    int deleteByPrimaryKey(Integer deptId);

    int insert(Department record);

    int insertSelective(Department record);

    List<Department> selectByExample(DepartmentExample example);

    Department selectByPrimaryKey(Integer deptId);

    int updateByExampleSelective(@Param("record") Department record, @Param("example") DepartmentExample example);

    int updateByExample(@Param("record") Department record, @Param("example") DepartmentExample example);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
}