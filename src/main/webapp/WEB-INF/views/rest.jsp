<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>윤종민 NCS 스프링부트</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
</head>
<body>
	<h1>윤종민 NCS 스프링부트</h1>
	<div class="input-group mb-3" style="width: 75%; clear: both;">
	<div>
	<h3>입력폼</h3>
      Name : <input type="text" class="form-control" id="username" name="username" />
      Password : <input type="password" class="form-control" id="password" name="password" />
      Email : <input type="email" class="form-control" id="email" name="email" />
      <button class="btn btn-outline-secondary" type="button" id="button" onclick="return insert()">
        입력
      </button>
    </div>
    <div>
    <h3>수정폼</h3>
    Who : <input type="text" class="form-control" id="modifyId" name="id" />
    Password : <input type="password" class="form-control" id="modifyPassword" name="password" />
    Email : <input type="email" class="form-control" id="modifyEmail" name="email" />
    <button class="btn btn-outline-secondary" type="button" id="button" onclick="return modify()">
      수정
    </button>
    </div>
    <div>
    <h3>상세정보</h3>
     Who : <input type="text" class="form-control" id="detailId" name="id" />
    	<div id="detail">
    
    	</div>
     <button class="btn btn-outline-primary" type="button" onclick="return getOne()">
      유저 상세보기
    </button>
    </div>
    </div>
    <ul class="list-group" style="width: 75%" id="list">
    </ul>
</body>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
const getOne = () => {
	$.ajax({
		type: "get",
		url: "api/user/"+$("#detailId").val(),
		dataType: "json",
	}).done((data,textStatus, xhr) => {
		let str = "";
		str += "ID : "+data.id+"</br>";
		str += "Name : "+data.username+"</br>";
		str += "Password : "+data.password+"</br>";
		str += "Email : "+data.email+"</br>";
		str += "RegDate : "+data.regdate.substr(0,19)+"</br>";
		$("#detail").html(str);
	})
	
}

const getAllList = () => {
	  $.ajax({
	    type: "get",
	    url: "/api/user/all",
	    dataType: "json",
	  })
	    .done((data, textStatus, xhr) => {
	      const list = data;
	      let str = "";
	      for (let i = 0; i < list.length; i++) {
	        let one = list[i];
	        str += '<li class="list-group-item">';
	        str += "<div class='content'>ID : "+one.id+"</br> Name : "+one.username+"</br> RegDate : "+one.regdate.substr(0,10)+"</div>";
	        str += '<button class="btn btn-danger btn-sm" onclick="return del('+one.id+')">삭제</button></li>';
	      }
	      $("#list").html(str);
	    })
	    .fail((data, textStatus, errorThrown) => {
	      console.log("fail");
	      console.log(data);
	      console.log(errorThrown);
	    });
	};
	const insert = () => {
	  let content = {
	    content: $("#input").val(),
	  };
	  $.ajax({
	    type: "post",
	    url: "/api/user",
	    dataType: "json",
	    data: {
	    	username : $("#username").val(),
	    	password : $("#password").val(),
	    	email : $("#email").val()
	    },
	  })
	    .done((data, textStatus, xhr) => {
	      $("#username").val("");
	      $("#password").val("");
	      $("#email").val("");
	      getAllList();
	    })
	    .fail((data, textStatus, errorThrown) => {
	      console.log("fail");
	      console.log(data);
	      console.log(errorThrown);
	    });
	};
	const del = (id) => {
	  if (!confirm("정말 삭제할래?")) {
	    return;
	  } else {
	    $.ajax({
	      type: "delete",
	      url: "/api/user/"+id,
	      dataType: "text",
	    })
	      .done((data, textStatus, xhr) => {
	    	  getAllList();
	      })
	      .fail((data, textStatus, errorThrown) => {
	        console.log("fail");
	        console.log(data);
	        console.log(errorThrown);
	      });
	  }
	};
	const modify = () => {
	  $.ajax({
	    type: "put",
	    url: "/api/user/"+$("#modifyId").val(),
	    data: {
	      password: $("#modifyPassword").val(),
	      email: $("#modifyEmail").val()
	    },
	    dataType: "json",
	  })
	    .done((data, textStatus, xhr) => {
	    	getAllList();
	    })
	    .fail((data, textStatus, errorThrown) => {
	      console.log("fail");
	      console.log(data);
	      console.log(errorThrown);
	    });
	};
	getAllList();
</script>
</html>