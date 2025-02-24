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
        <input type="text" class="form-control" size="20" id="user-name"
          name="user-name" />
      </div>
      <div class="col-xs-2">
        <button type="button" class="btn btn-primary"
          onclick="search_ajax()">검색</button>
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
      <tbody id="ajax-table">

      </tbody>
    </table>
  </div>
  <script type="text/javascript">
      var request = new XMLHttpRequest();

      function searchProcess() {
        var table = $("#ajax-table")[0];
        table.innerHTML = ""
        
        if(request.readyState === 4){
          if(request.status !== 200){
            console.error('데이터 로드 실패 : 상태코드', request.status);
            return;
          }
          
          const responseData = JSON.parse(request.responseText);
          const tableRows = responseData.result;
          
          tableRows.forEach(rowData =>{
            const newRow = table.insertRow(0);
            rowData.forEach(cellData => {
              const cell = newRow.insertCell();
              cell.innerHTML = Object.values(cellData)[0];
            });
          });
        }
      }
      
      $(function() {
        var delay = (function() {
          var timer = 0;

          return function(callback, ms) {
            clearTimeout(timer);
            timer = setTimeout(callback, ms);
          };
        })();

        $("input:text[name=user-name]").keyup(function() {
          delay(function() {
            search_ajax();
          }, 500);
        });
      });

      function search_ajax() {
        request.open("Post", "./userSearchServlet?userName="
            + encodeURIComponent($("#user-name").val()), true);
        request.onreadystatechange = searchProcess;
        request.send(null);
      }
      
      window.onload = function(){
        search_ajax();
      }
    </script>
</body>
</html>
