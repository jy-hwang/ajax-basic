<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.css" />
<title>JSP Ajax</title>
<script src="js/jquery-3.7.1.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<body>
  <br />
  <div class="container">
    <div class="form-group row pull-right">
      <div class="col-xs-8">
        <input type="text" class="form-control" size="20" />
      </div>
      <div class="col-xs-2">
        <button type="button" class="btn btn-primary">검색</button>
      </div>
    </div>
    <table class="table"
      style="text-align: center; border: 1px solid #ddd">
      <thead>
        <tr>
          <th style="background-color: #fafafa; text-align: center">이름</th>
          <th style="background-color: #fafafa; text-align: center">나이</th>
          <th style="background-color: #fafafa; text-align: center">성별</th>
          <th style="background-color: #fafafa; text-align: center">이메일</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>홍길동</td>
          <td>36</td>
          <td>남자</td>
          <td>hong@gil.dong</td>
        </tr>
      </tbody>
    </table>
  </div>
</body>
</html>
