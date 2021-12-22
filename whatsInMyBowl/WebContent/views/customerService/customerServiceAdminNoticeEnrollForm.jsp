<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자-고객센터 등록</title>
<style>
    .outer{
        margin-top: 100px;
        margin-left: 25%;
        width: 1000px;
    }
    .outer h2 {
        display: inline;
        font-size: 27px;
        font-weight: 700;
    }
    .outer table{margin-top: 130px;}
    #mainTitle{margin-bottom: 60px;}
    #mainTitle1{color: gray;}
    .insertNotice_title{width: 15%}
    .insertNotice_title_input{width: 100%;}
    .insertNotice_title_input:focus{outline: none;}
    .insertNotice_content{vertical-align: top;}
    .insertNotice_content_textarea{color: gray;}
    .insertNotice_content_textarea:focus{outline: none;}
    .insertNotice_title_input, .insertNotice_file_input, .insertNotice_content_textarea{
        margin: 5px 0;
        padding: 10px 5px;
    }
    .two_btn button{
        border: none;
        background-color: #ffee58;
        border-radius: 5px;
        font-size: 13px;
        padding: 3px 10px;
        margin: 20px 0 ;
    }
    .two_btn button:focus{outline: none;}
    #insert{
        margin-left: 10px;
        padding:3px 23px;
    }
    /* 첨부파일 영역 css*/
    .filebox input[class^=upload-file]{
        display: inline-block;
        height: 40px;
        padding: 0 10px;
        vertical-align: middle;
        border: 1px solid #dddddd;
        width: 78%;
        color: #999999;
    }
    .filebox label{
        display: inline-block;
        padding: 10px 20px;
        color: #fff;
        vertical-align: middle;
        background-color: #999999;
        cursor: pointer;
        height: 40px;
        margin-left: 3px;
    }
    .adddeletebtn{
        padding: 4px 4px;
        background-color: #999999;
        border: none;
        color: #fff;
        border-radius: 5px;
        vertical-align: middle;
        font-size: 15px;
    }
    .filebox input[type="file"] {
        position: absolute;
        width: 0;
        height: 0;
        padding: 0;
        overflow: hidden;
        border: 0;
    }
    input[class^=upload-file]{margin: 3px 0;}

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <%@ include file="../common/adminBar.jsp" %>

    <div class="outer">

        <div id="mainTitle">
            <h2 id="mainTitle1">고객센터관리 > 공지사항</h2>
            <h2>> 공지사항 등록</h2>
        </div>
		<form id="enroll-form" action="<%= contextPath %>/insert.no" method="post" enctype="multipart/form-data">
	        <table>
	            <tr>
	                <td class="insertNotice_title">제목</td>
	                <td><input type="text" name="title" id="title" class="insertNotice_title_input" placeholder="제목을 입력해주세요" required></td>
	            </tr>
	            <tr>
	                <td class="insertNotice_file">첨부파일</td>
	                <td style="border: 1px solid gray; padding: 10px 0 10px 5px">
                        <div class="filebox">
                            <input class="upload-file" value="첨부파일을 등록해주세요" placeholder="첨부파일">
                            <label for="file" style="margin: 0;">파일찾기</label> <input type="button" value="추가" class="adddeletebtn" onclick="addInput();" />
                            <input type="file" id="file" name="file0">
                            <div id="parah"><!-- 추가 버튼 클릭 시 새로운 첨부파일이 생성되는 영역--></div> 
                        </div>
                        
                    </td>
	            </tr>
	            <tr>
	                <td class="insertNotice_content">내용</td>
	                <td><textarea name="content" cols="100" rows="20"  class="insertNotice_content_textarea" required style="resize: none;">내용을 입력해주세요</textarea></td>
	            </tr>
	        </table>
            
            <div class="two_btn" align="center">
                <button type="button" onclick="location.href='<%=contextPath %>/adminListView.no?cpage=1';">목록으로</button>
                <button type="submit" id="insert">등록</button>
            </div>
		</form>


        <script>
            // 첨부파일 등록 시 파일명 보여지게 하는 함수
            //$("#enroll-form input[type=file]").on('change',function(){
            $(document).on("change", "#enroll-form input[type=file]", function(){
                var fileName = $(this).val();
                $(".upload-" + $(this).attr("id")).val(fileName);
            });

        	// 첨부파일 부분 (추가, 삭제 버튼 구현)----------------------------------------------------------------------
            var arrInput = new Array(0);
            var arrInputValue = new Array(0);
            
            function addInput() {
                arrInput.push(arrInput.length);
                if(arrInput.length>3){
                	alert("첨부파일은 최대3개까지 등록가능합니다.")
                } else{
	                arrInputValue.push("");
	                display();  	
                }
            }
            
            function display() {
            document.getElementById('parah').innerHTML="";
                for (intI=1;intI<arrInput.length;intI++) {
                    document.getElementById('parah').innerHTML+=createInput(arrInput[intI], arrInputValue[intI]);
                }
            }
            
            function saveValue(intId,strValue) {
                arrInputValue[intId]=strValue;
            }  
            
            function createInput(id,value) {
                return "<input class='upload-file" + id + "' value='첨부파일을 등록해주세요' placeholder='첨부파일'>\
                        <label for='file" + id + "' style='margin: 0;'>파일찾기</label>\
                        <input type='file' class='file' id='file"+ id +"' name='file"+ id +"'onChange='javascript:saveValue("+ id +",this.value)' value='"+ value +"'>\
                        <input type='button' class='adddeletebtn' value='삭제' onclick='deleteInput();'/><br>"
            }
            
            function deleteInput() {
                if (arrInput.length > 0) { 
                    arrInput.pop(); 
                    arrInputValue.pop();
                }
                display(); 
            }	
        </script>

    </div>
</body>
</html>