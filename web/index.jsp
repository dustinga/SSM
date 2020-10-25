<%--
  Created by IntelliJ IDEA.
  User: liumingjing
  Date: 2020/09/27
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>员工列表</title>
  <%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
  %>
  <%----%>
  <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
  <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 员工修改的模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">员工修改</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
          <div class="form-group">
            <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
            <div class="col-sm-10">
                <p class="form-control-static" id="empName_update_static"></p>

            </div>
          </div>
          <div class="form-group">
            <label for="email_add_input" class="col-sm-2 control-label">email</label>
            <div class="col-sm-10">
              <input type="text" name="email" class="form-control" id="email_update_input" placeholder="empName@atguigu.com">
              <span class="help-block"></span>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">gender</label>
            <div class="col-sm-10">
              <label class="radio-inline">
                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked">男
              </label>
              <label class="radio-inline">
                <input type="radio" name="gender" id="gender2_update_input" value="F">女
              </label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">deptName</label>
            <div class="col-sm-4">
              <!--部门提交ID即可-->
              <select class="form-control" name="dId" id="dept_update_select">
              </select>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
      </div>
    </div>
  </div>
</div>
<!-- 员工添加的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
          <div class="form-group">
            <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
            <div class="col-sm-10">
              <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
              <span class="help-block"></span>
            </div>
          </div>
          <div class="form-group">
            <label for="email_add_input" class="col-sm-2 control-label">email</label>
            <div class="col-sm-10">
              <input type="text" name="email" class="form-control" id="email_add_input" placeholder="empName@atguigu.com">
              <span class="help-block"></span>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">gender</label>
            <div class="col-sm-10">
              <label class="radio-inline">
                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked">男
              </label>
              <label class="radio-inline">
                <input type="radio" name="gender" id="gender2_add_input" value="F">女
              </label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">deptName</label>
            <div class="col-sm-4">
              <!--部门提交ID即可-->
              <select class="form-control" name="dId" id="dept_add_select">
              </select>
            </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
      </div>
    </div>
  </div>
</div>

<!--搭建显示页面-->
<div class="container">
  <!--标题-->
  <div class="row">
    <div class="col-md-12">
      <h1>SSM-CRUD</h1>
    </div>
  </div>
  <!--按钮-->
  <div class="row">
    <div class="col-md-4 col-md-offset-8">
      <button class="btn btn-primary" id="emp_add_modal">新增</button>
      <button class="btn btn-danger">删除</button>
    </div>
  </div>
  <!--显示表格数据-->
  <div class="row">
    <div class="col-md-12">
      <table class="table table-hover" id="emps_table">
        <thead>
          <tr>
            <th>#</th>
            <th>empName</th>
            <th>gender</th>
            <th>email</th>
            <th>deptName</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
        </tbody>
      </table>
    </div>
  </div>
  <!--显示分页信息-->
  <div class="row">
    <div class="col-md-6" id="page_info_area">
    </div>
    <div class="col-md-6" id="page_nav_area">
    </div>
  </div>
</div>
<script type="text/javascript">
  var totalRecord,currentPage;
  $(function () {
    to_page(1);
  })

  function  to_page(pn){
    $.ajax({

      url:"${APP_PATH}/emps",
      data:"pn="+pn,
      type:"GET",
      success:function (result){
        //console.log(result);
        //解析员工数据
        build_emps_table(result);
        //解析显示分页信息
        buile_page_info(result);
        //解析显示分页条数据
        build_page_nav(result);
      }

    });

  }
  function build_emps_table(result){
    //清空table数据
    $("#emps_table tbody").empty();
    var emps = result.extend.pageInfo.list;
    $.each(emps,function (index,item){
        var empIdTd = $("<td></td>").append(item.empId);
        var empNameTd = $("<td></td>").append(item.empName);
        var genderId =$("<td></td>").append(item.gender == 'M'?"男":"女");
        var emailTd = $("<td></td>").append(item.email);
        var deptNameTd = $("<td></td>").append(item.department.deptName);
        var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
        editBtn.attr("edit-id",item.empId);
        var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
              .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
        var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
        //append方法执行完成后还是返回原来的元素
        $("<tr></tr>").append(empIdTd)
                .append(empNameTd)
                .append(genderId)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
    });
  }
  //解析显示分页信息
  function  buile_page_info(result){
    $("#page_info_area").empty();
    $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+
            "页，总"+result.extend.pageInfo.pages+"页，总"+result.extend.pageInfo.total+"条记录");
    totalRecord = result.extend.pageInfo.total;
    currentPage = result.extend.pageInfo.pageNum;

  }
  //解析显示分页条，点击分页要能去下一页
  function build_page_nav(result){
    $("#page_nav_area").empty();
    var ul =$("<ul></ul>").addClass("pagination");
    //构建元素
    var firstPageli = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
    var prePageli = $("<li></li>").append($("<a></a>").append("&laquo;"));
    if(result.extend.pageInfo.hasPreviousPage == false){
      firstPageli.addClass("disabled");
      prePageli.addClass("disabled");
    }else {
      //为元素添加点击翻页的事件
      firstPageli.click(function(){
        to_page(1);
      });
      prePageli.click(function(){
        to_page(result.extend.pageInfo.pageNum - 1)
      });
    }

    var nextPageli = $("<li></li>").append($("<a></a>").append("&raquo;"));
    var lastPageli = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
    if(result.extend.pageInfo.hasNextPage == false){
      lastPageli.addClass("disabled");
      nextPageli.addClass("disabled");
    }else {
      //为元素添加点击翻页的事件
      lastPageli.click(function (){
        to_page(result.extend.pageInfo.pages)
      });
      nextPageli.click(function (){
        to_page(result.extend.pageInfo.pageNum + 1)
      });
    }


    ul.append(firstPageli).append(prePageli);
    $.each(result.extend.pageInfo.navigatepageNums,function (index,item){
          var numli = $("<li></li>").append($("<a></a>").append(item));
          if(result.extend.pageInfo.pageNum == item){
            numli.addClass("active")
          }
          numli.click(function (){
            to_page(item);
          })
          ul.append(numli);
    });
    ul.append(nextPageli).append(lastPageli);

    var navEle = $("<nav></nav>").append(ul);
    //navEle.appendTo("#page_nav_area");
    $("#page_nav_area").append(navEle);
  }

  function reset_form(ele){
    $(ele)[0].reset();
    $(ele).find("*").removeClass("has-error has-error");
    $(ele).find(".help-block").text("");
  }
  $("#emp_add_modal").click(function () {
    //清除表单数据
    reset_form("#empAddModal form");
    //ajax查出部门信息
    getDepts("#empAddModal select");
    //弹出模态框
    $("#empAddModal").modal({
      backdrop:"static"
    });
  });

  function getDepts(ele){
      //清空之前下拉列表的值
    $(ele).empty();
    $.ajax({
      url:"${APP_PATH}/depts",
      type:"GET",
      success:function (result){
        //console.log(result);】
        //$("#dept_add_select").append();
        $.each(result.extend.depts,function (){
          var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
          optionEle.appendTo(ele);
        });
      }

    });

  }
  //校验表单数据
  function validate_add_form(){
    //拿到要校验的数据，使用正则表达式进行校验
    var empName = $("#empName_add_input").val();
    var regName = /^[a-zA-Z0-9_-]{6,16}$/;
    if(!regName.test(empName)){
      //alert("用户名可以是6-16位英文字母");
      show_validate_msg("#empName_add_input","error","用户名可以是6-16位英文字母");
      return false;
    }else {
      show_validate_msg("#empName_add_input","success","");
    }
    var email = $("#email_add_input").val();
    var regemail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    if(!regemail.test(email)){
      //alert("邮箱不符合");
      show_validate_msg("#email_add_input","error","邮箱不符合");
      return false;
    }else {
      show_validate_msg("#email_add_input","success","");
    }
    return true;
  }

  function show_validate_msg(ele,status,msg){
    //清除当前元素的校验状态
    $(ele).parent().removeClass("has-success has-error");
    $(ele).next("span").text("");
    if("success" == status){

      $(ele).parent().addClass("has-success");
      $(ele).next("span").text(msg);

    }else if("error" == status){
      $(ele).parent().addClass("has-error");
      $(ele).next("span").text(msg);

    }
  }

  $("#empName_add_input").change(function () {
    //1.判断之前的ajax用户明校验是否成功，如果成功继续进行

    //2.发送ajax校验用户名是否可用
    var empName = this.value;
    $.ajax({
      url:"${APP_PATH}/checkuser",
      data:"empName="+empName,
      type:"POST",
      success:function (result) {
        if(result.code == 100){
          show_validate_msg("#empName_add_input","success","用户名可用");
          $("#emp_save_btn").attr("ajax-va","success");
        }else{
          show_validate_msg("#empName_add_input","error",result.extend.va_msg);
          $("#emp_save_btn").attr("ajax-va","error");
        }
      }
    });

  });

  $("#emp_save_btn").click(function (){
    //点击后将表中填写的数据交给服务器进行保存
    //先对要发给服务器的数据进行校验
    if (!validate_add_form()){
      return  false;
    };
    //1.判断之前的ajax用户名是否校验成功
    if($(this).attr("ajax-va") == "error"){
        return false;
    }
    //2.发送ajax请求保存员工
    $.ajax({
      url:"${APP_PATH}/emp",
      type:"POST",
      data:$("#empAddModal form").serialize(),
      success:function (result){

        if(result.code == 100){
          //保存成功后关闭模态框
          $("#empAddModal").modal('hide');
          //来到最后一页，显示保存数据
          to_page(totalRecord);
        }else {
          if (undefined != result.extend.errorFields.email) {
            show_validate_msg("#empName_add_input","error",result.extend.errorFields.email);
          }
          if (undefined != result.extend.errorFields.empName) {
            show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);
          }
        }

      }
    })
    });
  //1.按钮创建之前就绑定的事件，所以是绑定不上的
  //创建按钮时绑定方法 绑定live方法
  //jquery新版本没有live，使用on进行替换
  $(document).on("click",".edit_btn",function (){
      //查出部门信息，并显示部门列表
      getDepts("#empUpdateModal select");
      //查出员工信息，显示员工信息
      getEmp($(this).attr("edit-id"));
      //把员工id传给模态框的更新按钮
      $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
      $("#empUpdateModal").modal({
          backdrop:"static"
      });

  });

  function getEmp(id){
      $.ajax({
          url:"${APP_PATH}/emp/"+id,
          type:"GET",
          success:function (result){
              var empData = result.extend.emp;
              $("#empName_update_static").text(empData.empName);
              $("#email_update_input").val(empData.email);
              $("#empUpdateModal input[name=gender]").val([empData.gender]);
              $("#empUpdateModal select").val([empData.dId]);

          }

      });
  }
  //点击更新，更新员工信息
  $("#emp_update_btn").click(function () {
      //验证邮箱是否合法
      var email = $("#email_update_input").val();
      var regemail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
      if(!regemail.test(email)){
          //alert("邮箱不符合");
          show_validate_msg("#email_update_input","error","邮箱不符合");
          return false;
      }else {
          show_validate_msg("#email_update_input","success","");
      }
      //发送ajax请求
      $.ajax({
          url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
          type:"POST",
          data:$("#empUpdateModal form").serialize()+"&_method=PUT",
          success:function (result){
              $("#empUpdateModal").modal("hide");
              to_page(currentPage);
          }


      });
  });
</script>

</body>
</html>