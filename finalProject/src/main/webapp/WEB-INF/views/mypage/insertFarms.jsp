<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.table {
    width: 100%;
  }
.table td, .table th {
	border-top: 0px;
	white-space: nowrap;
	padding: 1.05rem 0.75rem;
}
.table th{
background-color: #c3e6cb;
font-weight: bold;
}
.modal-body {
    padding: 0px !important;
}
</style>
<div class="modal-body">
                        
                            <div class="card-body table-border-style">
                            <form action="insertFarms" enctype="multipart/form-data" method="post">
                           
                                <div class="table-responsive">
                                    <table class="table">
                                    <tr>
                                   			 <th>
                                                농장이름
                                            </th>
                                    	<td colspan="5"><input type="text" class="form-control" id="farm_name" name="farm_name"
                                    		placeholder="농장이름을 입력하세요" required="농장이름을 입력하세요">
                                    	</td>
                                    </tr>
                                        <tr>
                                            <th colspan="1">
                                                면적(㎡)
                                            </th>
                                            <td colspan="1">
                                                <input type="text" class="form-control" id="farm_area"
                                                    name="farm_area" placeholder="면적입력">
                                               <input type="hidden" class="form-control" id="farm_no"
                                                    name="farm_no" placeholder="번호"><!-- 농장번호 hidden-->
                                              <input type="hidden" class="form-control" id="user_id"
                                                    name="user_id" placeholder="소유자ID" value="${user_id }">   <!-- 사용자id hidden  -->
                                            </td>
                                            <th colspan="1">사진첨부</th>
											<td colspan="3">
													<input multiple="multiple" type="file" name="uploadFile" required="required"> 
													<input type="hidden" name="farm_filename">
						</td>
                                        </tr>
                                        <tr>
                                        	 <th colspan="1">
                                                주소
                                            </th>
                                            <td colspan="5">
                                                <input type="text" class="form-control" id="farm_adr"  name="farm_adr" placeholder="주소입력">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                소개
                                            </th>
                                            <td colspan="5">
                                                <textarea class="form-control" id="farm_content"
                                                name="farm_content" rows="3" placeholder="농장소개를 입력하세요"></textarea>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="col-md-12" align="center">
                                        <button type="submit" class="btn  btn-outline-success">저장</button>
                                        <button type="reset" class="btn  btn-outline-danger">입력취소</button>
                                    </div>
                                    </div>
                                     </form>
                                    </div>
                       
                    </div>

    <script type="text/javascript">
    /*도로명주소 API*/
	function goPopup(){
		var pop = window.open("jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	
	function jusoCallBack(roadAddrPart1,addrDetail,roadAddrPart2, zipNo){
		 document.form.farm_adr.value =  roadAddrPart1 + addrDetail +roadAddrPart2;
	}
    
    
    </script>