<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Q&A</title>
<link href="/3T/user/member/style.css" rel="stylesheet" type="text/css">
<style type="text/css">
#form td.tdstyle2 {background-color :#000000; border:#ccc 1px solid; width:400px; padding:20px; font-size:14px; font-weight:bold; color:#000;}

</style>

</head>
<script type="text/javascript">
	function open_win_noresizable(url, name)
	{
		var oWin = window.open(url, name, "scrollbars=no, status=no, resizable=no, width=600, height=500");
		
	}
</script>
<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center" class="text01 formbar"><h2>Q&A</h2></td>
		</tr>
		<tr>
          <td height="20" colspan="2"></td>
        </tr>
	</table>
	
	<s:if test="reply">
		<form action="qa_replyAction.action" method="post" 
		enctype="multipart/form-data" >
			<s:hidden name="QA_REF" value="%{resultClass.QA_REF}" />
			<s:hidden name="QA_RE_LEVEL" value="%{resultClass.QA_RE_LEVEL}" />
			<s:hidden name="QA_RE_STEP" value="%{resultClass.QA_RE_STEP}" />
	</s:if>
	
	<s:elseif test="resultClass == NULL">
		<form action="Qa_writeAction.action?goods_no=${goods_no}" method="post" enctype="multipart/form-data" >
	</s:elseif>
	
	<s:else>
		<form action="qa_modifyAction.action" method="post"
		 enctype="multipart/form-data">
			<s:hidden name="QA_NO" value="%{resultClass.QA_NO}" />
			<s:hidden name="currentPage" value="%{currentPage}" />
			<s:hidden name="old_file" value="%{resultClass.QA_FILE_SAVNAME}" />
	</s:else>
	

		<table width="600" border="0" cellspacing="0" cellpadding="0" height="120" background="/3T/upload/QA_BG.png">
			<s:if test="goods_no <=0">
				<input type="hidden" name="QA_GOODS_NO" value="goods_no"/>
				<tr>
					<td align="center" width="120"><img src="/3T/upload/QA.PNG" width="80" height="100"></td>
					
					<td colspan="2"><hr align="center" width="470" color="#8C8C8C"  ><br>
						<input type="button" name="button" value="��ǰ���� ���� ��"  onclick="javascript:open_win_noresizable('qa_SearchGoodsForm.action?currentPage=<s:property value="currentPage" />', write)"/>
					</td>
				</tr>
			</s:if>
			<s:else>
					<s:url id="viewURL" action="GoodsView">
							<s:param name="goods_no">
								<s:property value="goods_no" />
							</s:param>
							<s:param name="currentPage">
								<s:property value="currentPage" />
							</s:param>
						</s:url>
				<tr>                                             
					<td align="center" width="120"><img src="/3T/upload/<s:property value="goods_resultClass.goods_file_savname.split(',')[0]"/>" width="80" height="100"></td>
				
					<td colspan="2"> <s:property value="goods_resultClass.goods_name" /><br>KRW <s:property value="goods_resultClass.goods_price" />
					<hr align="center" width="470" color="#8C8C8C"  ><br>
						<s:a href="%{viewURL}"><input type="button" name="button" value="��ǰ �󼼺��� ��"/></s:a>
						<input type="button" name="button" value="��ǰ���� ���� ��"  onclick="javascript:open_win_noresizable('qa_SearchGoodsForm.action?currentPage=<s:property value="currentPage" />', write)"/>
					</td>
				</tr>
			</s:else>
		</table>

	
	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr>
		
          <td height="20" colspan="2"></td>
        </tr>
        <tr>
          <td align="right" colspan="2"><font color="#FF0000">*</font>�� �ʼ� �Է»����Դϴ�.</td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
				
        <tr>
          <td width="100" class="tdstyle2"><font color="#FF0000">*</font>  ����</td>
          <td width="500" class="tdstyle2"><select name="QA_CATEGORY_NO" 
					 id="QA_CATEGORY_NO">
						<option value="1">��ǰ����</option>
						<option value="2">��۹���</option>
						<option value="3">�Ա�Ȯ�ι���</option>
						<option value="4">��Ÿ����</option>					
				</select>
            <s:textfield name="QA_SUBJECT" theme="simple" value="%{resultClass.QA_SUBJECT}" cssStyle="width:370px" maxlength="30"/>
          </td>
        </tr>
        
        <tr bgcolor="#777777">
         	 <td height="1" colspan="2"></td>
        </tr>

        <tr>
          <td class="tdstyle2"><font color="#FF0000">*</font>  �̸� </td>
          <td class="tdstyle2">
            <s:textfield name="QA_NAME" theme="simple" value="%{resultClass.QA_NAME}" cssStyle="width:100px" maxlength="20"/>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
 
        <tr>
          <td class="tdstyle2"><font color="#FF0000">*</font>  ��й�ȣ </td>
          <td class="tdstyle2">
            <s:textfield name="QA_PASSWD" theme="simple" value="%{resultClass.QA_PASSWD}" cssStyle="width:100px" maxlength="20"/>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
	<tr>
          <td class="tdstyle2"><font color="#FF0000">*</font>  ���� </td>
          <td class="tdstyle2">
            <s:textarea name="QA_CONTENT" theme="simple" value="%{resultClass.QA_CONTENT}" cols="50" rows="10" />
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
       <tr>
          <td class="tdstyle2">  ÷������ </td>
          <td class="tdstyle2">
            <s:file name="upload" theme="simple"/>
            
            <s:if test="resultClass.QA_FILE_ORGNAME != NULL">
		&nbsp; * <s:property value="resultClass.QA_FILE_ORGNAME" /> ������ ��ϵǾ� �ֽ��ϴ�. �ٽ� ���ε��ϸ� ������ ������ �����˴ϴ�.
	</s:if>
						
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
        <tr>
          <td height="10" colspan="2"></td>
        </tr>
        
        
        <tr>
          <td align="right" colspan="2">
          	<input name="submit" type="submit" value="�ۼ��Ϸ�" class="submit">
            <input name="list" type="button" value="���" class="submit" onClick="javascript:location.href='qa_listAction.action?currentPage=<s:property value="currentPage" />'">
          </td>
        </tr>

    </table>
</form>
</body>
</html>