<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/JavaScript">
	function chkBox(bool) { // ��ü����/���� 
		var obj = document.getElementsByName("join");
		for ( var i = 0; i < obj.length; i++)
			obj[i].checked = bool;
	}

	function check() {

		if (join_agree.agreeUse.checked == false) {
			alert("�̿���, �������� ���� �� �̿뿡 ��� ������ �ֽñ� �ٶ��ϴ�.");
			return false;
		}

		if (join_agree.agreePrivacy.checked == false) {
			alert("�̿���, �������� ���� �� �̿뿡 ��� ������ �ֽñ� �ٶ��ϴ�.");
			return false;
		}

	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�̿���</title>
<link href="/hi1/style.css" rel="stylesheet" type="text/css">
</head>
<center>
	<body>

		<!-- �����մϴ� �������� memberReg.action�������� -->

		<form name="join_agree" action="join2.action" method="post"
			onsubmit="return check()">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="center" style="padding: 50px;">

						<table width="700" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td height="40" align="center" class="text01 formbar">�̿���</td>
							</tr>
							<tr>
								<td height="60"></td>
							</tr>
							<tr>
								<td align="right" class="edge"><label for="agreeAll">
										<strong>�̿���, �������� ���� �� �̿뿡 ��� �����մϴ�.</strong> <input
										type="checkbox" id="agreeAll" value="" class="checkbox"
										onclick=chkBox(this.checked) />
								</label></td>
							</tr>
							<tr>
								<td align="center"
									style="border: #ccc 1px solid; border-top: #fff 1px solid;"><table
										width="500" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td align="left" class="formtext">[�ʼ�]�̿��� ����</td>
										</tr>
										<tr>
											<td align="center"><textarea rows="10" cols="100">
                              ��1��(����)
�� ����� 3T(���ڻ�ŷ� �����)�� ��ϴ� 3T ���̹� ��(���� �������̶� �Ѵ�)���� �����ϴ� ���ͳ� ���� ����(���� �����񽺡��� �Ѵ�)�� �̿��Կ� �־� ���̹� ���� �̿����� �Ǹ�,�ǹ� �� å�ӻ����� �������� �������� �մϴ�.
�ء�PC���, ���� ���� �̿��ϴ� ���ڻ�ŷ��� ���ؼ��� �� ������ ������ �ʴ� �� �� ����� �ؿ��մϴ�.��

��2��(����)
�� �������̶� OO ȸ�簡 ��ȭ �Ǵ� �뿪(���� ����ȭ ��̶� ��)�� �̿��ڿ��� �����ϱ� ���Ͽ� ��ǻ�� �� ������ż��� �̿��Ͽ� ��ȭ ���� �ŷ��� �� �ֵ��� ������ ������ �������� ���ϸ�, �ƿ﷯ ���̹����� ��ϴ� ������� �ǹ̷ε� ����մϴ�.
�� ���̿��ڡ��� �������� �����Ͽ� �� ����� ���� �������� �����ϴ� ���񽺸� �޴� ȸ�� �� ��ȸ���� ���մϴ�.
�� ��ȸ�����̶� ���� �������� (����) ȸ������� �� �ڷμ�, ��������� �������� �����ϴ� ���񽺸� �̿��� �� �ִ� �ڸ� ���մϴ�.
�� ����ȸ�����̶� ���� ȸ���� �������� �ʰ� �������� �����ϴ� ���񽺸� �̿��ϴ� �ڸ� ���մϴ�.

��3�� (��� ���� ���ÿ� ���� �� ����) 
�� �������� �� ����� ����� ��ȣ �� ��ǥ�� ����, ������ ������ �ּ�(�Һ����� �Ҹ��� ó���� �� �ִ� ���� �ּҸ� ����), ��ȭ��ȣ,������۹�ȣ,���ڿ����ּ�, ����ڵ�Ϲ�ȣ, ����Ǹž� �Ű���ȣ, ������������å���ڵ��� �̿��ڰ� ���� �� �� �ֵ��� 00 ���̹����� �ʱ� ����ȭ��(����)�� �Խ��մϴ�. �ٸ�, ����� ������ �̿��ڰ� ����ȭ���� ���Ͽ� �� �� �ֵ��� �� �� �ֽ��ϴ�.
�� ������ �̿��ڰ� ����� �����ϱ⿡ �ռ� ����� ���Ͽ��� �ִ� ���� �� û��öȸ.���å��.ȯ������ ��� ���� �߿��� ������ �̿��ڰ� ������ �� �ֵ��� ������ ����ȭ�� �Ǵ� �˾�ȭ�� ���� �����Ͽ� �̿����� Ȯ���� ���Ͽ��� �մϴ�.
�� �������� �����ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ������, ������� ������ ���� ������, �����ڹ��� �� ���ڰŷ��⺻����, �����ڱ����ŷ�����, �����ڼ�������, ��������Ÿ� �̿����� �� ������ȣ � ���� ������, ���湮�Ǹ� � ���� ������, ���Һ��ڱ⺻���� �� ���� ���� �������� �ʴ� �������� �� ����� ������ �� �ֽ��ϴ�.
�� �������� ����� ������ ��쿡�� �������� �� ���������� �����Ͽ� �������� �Բ� ���� �ʱ�ȭ�鿡 �� �������� 7�� �������� �������� ���ϱ��� �����մϴ�. �ٸ�, �̿��ڿ��� �Ҹ��ϰ� ��������� �����ϴ� ��쿡�� �ּ��� 30�� �̻��� ���� �����Ⱓ�� �ΰ� �����մϴ�. �� ��� "������ ���� �� ����� ���� �� ������ ��Ȯ�ϰ� ���Ͽ� �̿��ڰ� �˱� ������ ǥ���մϴ�. 
�� �������� ����� ������ ��쿡�� �� ��������� �� �������� ���Ŀ� ü��Ǵ� ��࿡�� ����ǰ� �� ������ �̹� ü��� ��࿡ ���ؼ��� ���� ���� ��������� �״�� ����˴ϴ�. �ٸ� �̹� ����� ü���� �̿��ڰ� ������� ������ ������ �ޱ⸦ ���ϴ� ���� ��3�׿� ���� ��������� �����Ⱓ ���� �������� �۽��Ͽ� �������� ���Ǹ� ���� ��쿡�� ������� ������ ����˴ϴ�.
�� �� ������� ������ �ƴ��� ���װ� �� ����� �ؼ��� ���Ͽ��� ���ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ����, ����� ���� � ���� ����, �����ŷ�����ȸ�� ���ϴ� ���ڻ�ŷ� ����� �Һ��� ��ȣ��ħ �� ������� �Ǵ� ����ʿ� �����ϴ�.

��4��(������ ���� �� ����) 
�� �������� ������ ���� ������ �����մϴ�.
  1. ��ȭ �Ǵ� �뿪�� ���� ���� ���� �� ���Ű���� ü��
  2. ���Ű���� ü��� ��ȭ �Ǵ� �뿪�� ���
  3. ��Ÿ �������� ���ϴ� ����
�� �������� ��ȭ �Ǵ� �뿪�� ǰ�� �Ǵ� ����� ����� ���� ���� ��쿡�� ���� ü��Ǵ� ��࿡ ���� ������ ��ȭ �Ǵ� �뿪�� ������ ������ �� �ֽ��ϴ�. �� ��쿡�� ����� ��ȭ �Ǵ� �뿪�� ���� �� �������ڸ� �����Ͽ� ������ ��ȭ �Ǵ� �뿪�� ������ �Խ��� ���� ��� �����մϴ�.
�� �������� �����ϱ�� �̿��ڿ� ����� ü���� ������ ������ ��ȭ���� ǰ�� �Ǵ� ����� ����� ���� ���� ������ ������ ��쿡�� �� ������ �̿��ڿ��� ���� ������ �ּҷ� ��� �����մϴ�.
�� ������ ��� �������� �̷� ���Ͽ� �̿��ڰ� ���� ���ظ� ����մϴ�. �ٸ�, �������� ���� �Ǵ� ������ ������ �����ϴ� ��쿡�� �׷����� �ƴ��մϴ�.

��5��(������ �ߴ�) 
�� �������� ��ǻ�� �� ������ż����� ��������.��ü �� ����, ����� ���� ���� ������ �߻��� ��쿡�� ������ ������ �Ͻ������� �ߴ��� �� �ֽ��ϴ�.
�� �������� ��1���� ������ ������ ������ �Ͻ������� �ߴܵ����� ���Ͽ� �̿��� �Ǵ� ��3�ڰ� ���� ���ؿ� ���Ͽ� ����մϴ�. ��, �������� ���� �Ǵ� ������ ������ �����ϴ� ��쿡�� �׷����� �ƴ��մϴ�.
�� ��������� ��ȯ, ����� ����, ��ü ���� ���� ���� ������ ���񽺸� ������ �� ���� �Ǵ� ��쿡�� �������� ��8���� ���� ������� �̿��ڿ��� �����ϰ� ���� ���������� ������ ���ǿ� ���� �Һ��ڿ��� �����մϴ�. �ٸ�, �������� ������� ���� �������� �ƴ��� ��쿡�� �̿��ڵ��� ���ϸ��� �Ǵ� ������ ���� ���������� ���Ǵ� ��ȭ��ġ�� �����ϴ� ���� �Ǵ� �������� �̿��ڿ��� �����մϴ�.

��6��(ȸ������) 
�� �̿��ڴ� �������� ���� ���� ��Ŀ� ���� ȸ�������� ������ �� �� ����� �����Ѵٴ� �ǻ�ǥ�ø� �����μ� ȸ�������� ��û�մϴ�.
�� �������� ��1�װ� ���� ȸ������ ������ ���� ��û�� �̿��� �� ���� �� ȣ�� �ش����� �ʴ� �� ȸ������ ����մϴ�.
  1. ���Խ�û�ڰ� �� ��� ��7����3�׿� ���Ͽ� ������ ȸ���ڰ��� ����� ���� �ִ� ���, �ٸ� ��7����3�׿� ���� ȸ���ڰ� ��� �� 3���� ����� �ڷμ� �������� ȸ���簡�� �³��� ���� ��쿡�� ���ܷ� �Ѵ�.
  2. ��� ���뿡 ����, ���紩��, ���Ⱑ �ִ� ���
  3. ��Ÿ ȸ������ ����ϴ� ���� �������� ����� ������ ������ �ִٰ� �ǴܵǴ� ���
�� ȸ�����԰���� ���� �ñ�� �������� �³��� ȸ������ ������ �������� �մϴ�.
�� ȸ���� ȸ������ �� ����� ���׿� ������ �ִ� ���, ����� �Ⱓ �̳��� �������� ���Ͽ� ȸ������ ���� ���� ������� �� ��������� �˷��� �մϴ�.

��7��(ȸ�� Ż�� �� �ڰ� ��� ��) 
�� ȸ���� �������� �������� Ż�� ��û�� �� ������ �������� ��� ȸ��Ż�� ó���մϴ�.
�� ȸ���� ���� �� ȣ�� ������ �ش��ϴ� ���, �������� ȸ���ڰ��� ���� �� ������ų �� �ֽ��ϴ�.
  1. ���� ��û �ÿ� ���� ������ ����� ���
  2. �������� �̿��Ͽ� ������ ��ȭ ���� ���, ��Ÿ �������̿뿡 �����Ͽ� ȸ���� �δ��ϴ� ä���� ���Ͽ� �������� �ʴ� ���
  3. �ٸ� ����� ������ �̿��� �����ϰų� �� ������ �����ϴ� �� ���ڻ�ŷ� ������ �����ϴ� ���
  4. �������� �̿��Ͽ� ���� �Ǵ� �� ����� �����ϰų� ������ӿ� ���ϴ� ������ �ϴ� ���
�� �������� ȸ�� �ڰ��� ����.���� ��Ų ��, ������ ������ 2ȸ �̻� �ݺ��ǰų� 30�� �̳��� �� ������ �������� �ƴ��ϴ� ��� �������� ȸ���ڰ��� ��ǽ�ų �� �ֽ��ϴ�.
�� �������� ȸ���ڰ��� ��ǽ�Ű�� ��쿡�� ȸ������� �����մϴ�. �� ��� ȸ������ �̸� �����ϰ�, ȸ����� ���� ���� �ּ��� 30�� �̻��� �Ⱓ�� ���Ͽ� �Ҹ��� ��ȸ�� �ο��մϴ�.

��8��(ȸ���� ���� ����)
�� �������� ȸ���� ���� ������ �ϴ� ���, ȸ���� �������� �̸� �����Ͽ� ������ ���ڿ��� �ּҷ� �� �� �ֽ��ϴ�.
�� �������� ��Ư���ټ� ȸ���� ���� ������ ��� 1�����̻� ������ �Խ��ǿ� �Խ������μ� ���� ������ ������ �� �ֽ��ϴ�. �ٸ�, ȸ�� ������ �ŷ��� �����Ͽ� �ߴ��� ������ ��ġ�� ���׿� ���Ͽ��� ���������� �մϴ�.

��9��(���Ž�û) 
�� �������̿��ڴ� �������󿡼� ���� �Ǵ� �̿� ������ ����� ���Ͽ� ���Ÿ� ��û�ϸ�, �������� �̿��ڰ� ���Ž�û�� �Կ� �־ ������ �� ������ �˱� ���� �����Ͽ��� �մϴ�. (����)
  1. ��ȭ ���� �˻� �� ����
  2. �޴� ����� ����, �ּ�, ��ȭ��ȣ, ���ڿ����ּ�(�Ǵ� �̵���ȭ��ȣ) ���� �Է�
  3. �������, û��öȸ���� ���ѵǴ� ����, ��۷�.��ġ�� ���� ���δ�� ������ ���뿡 ���� Ȯ��
  4. �� ����� �����ϰ� �� 3.ȣ�� ������ Ȯ���ϰų� �ź��ϴ� ǥ��(��, ���콺 Ŭ��)
  5. ��ȭ���� ���Ž�û �� �̿� ���� Ȯ�� �Ǵ� �������� Ȯ�ο� ���� ����
  6. ��������� ����
�� �������� ��3�ڿ��� ������ ���������� ����?��Ź�� �ʿ䰡 �ִ� ��� ���� ���Ž�û �� �������� ���Ǹ� �޾ƾ� �ϸ�, ȸ������ �� �̸� ���������� ���Ǹ� ���� �ʽ��ϴ�. �� �� �������� �����Ǵ� �������� �׸�, �����޴� ��, �����޴� ���� �������� �̿� ���� �� ����?�̿� �Ⱓ ���� �����ڿ��� �����Ͽ��� �մϴ�. �ٸ� ��������Ÿ��̿����� �� ������ȣ � ���� ������ ��25�� ��1�׿� ���� �������� �����Ź�� ��� �� ���� ���ɿ� �޸� ������ �ִ� ��쿡�� �׿� �����ϴ�.

��10�� (����� ����)
�� �������� ��9���� ���� ���Ž�û�� ���Ͽ� ���� �� ȣ�� �ش��ϸ� �³����� ���� �� �ֽ��ϴ�. �ٸ�, �̼����ڿ� ����� ü���ϴ� ��쿡�� �����븮���� ���Ǹ� ���� ���ϸ� �̼����� ���� �Ǵ� �����븮���� ����� ����� �� �ִٴ� ������ �����Ͽ��� �մϴ�.
  1. ��û ���뿡 ����, ���紩��, ���Ⱑ �ִ� ���
  2. �̼����ڰ� ���, �ַ� �� û�ҳ⺸ȣ������ �����ϴ� ��ȭ �� �뿪�� �����ϴ� ���
  3. ��Ÿ ���Ž�û�� �³��ϴ� ���� ������ ����� ������ ������ �ִٰ� �Ǵ��ϴ� ���
�� �������� �³��� ��12����1���� ����Ȯ���������·� �̿��ڿ��� ������ ������ ����� ������ ������ ���ϴ�.
�� �������� �³��� �ǻ�ǥ�ÿ��� �̿����� ���� ��û�� ���� Ȯ�� �� �ǸŰ��� ����, ���Ž�û�� ���� ��� � ���� ���� ���� �����Ͽ��� �մϴ�.

��11��(���޹��)
���������� ������ ��ȭ �Ǵ� �뿪�� ���� ������޹���� ���� �� ȣ�� ����� ������ ������� �� �� �ֽ��ϴ�. ��, �������� �̿����� ���޹���� ���Ͽ� ��ȭ ���� ��ݿ� ��� ������ �����ᵵ �߰��Ͽ� ¡���� �� �����ϴ�.
1. ����ŷ, ���ͳݹ�ŷ, ���� ��ŷ ���� ���� ������ü 
2. ����ī��, ����ī��, �ſ�ī�� ���� ���� ī�� ����
3. �¶��ι������Ա�
4. ����ȭ�� ���� ����
5. ���� �� �������
6. ���ϸ��� �� �������� ������ ����Ʈ�� ���� ����
7. �������� ����� �ξ��ų� �������� ������ ��ǰ�ǿ� ���� ���� 
8. ��Ÿ ������ ���� ����� ���� ��� ���� ��

��12��(����Ȯ������.���Ž�û ���� �� ���)
�� �������� �̿����� ���Ž�û�� �ִ� ��� �̿��ڿ��� ����Ȯ�������� �մϴ�.
�� ����Ȯ�������� ���� �̿��ڴ� �ǻ�ǥ���� ����ġ ���� �ִ� ��쿡�� ����Ȯ�������� ���� �� ��� ���Ž�û ���� �� ��Ҹ� ��û�� �� �ְ� �������� ��� ���� �̿����� ��û�� �ִ� ��쿡�� ��ü ���� �� ��û�� ���� ó���Ͽ��� �մϴ�. �ٸ� �̹� ����� ������ ��쿡�� ��15���� û��öȸ � ���� ������ �����ϴ�.

��13��(��ȭ ���� ����)
�� �������� �̿��ڿ� ��ȭ ���� ���޽ñ⿡ ���Ͽ� ������ ������ ���� �̻�, �̿��ڰ� û���� �� ������ 7�� �̳��� ��ȭ ���� ����� �� �ֵ��� �ֹ�����, ���� �� ��Ÿ�� �ʿ��� ��ġ�� ���մϴ�. �ٸ�, �������� �̹� ��ȭ ���� ����� ���� �Ǵ� �Ϻθ� ���� ��쿡�� ����� ���� �Ǵ� �Ϻθ� ���� ������ 3������ �̳��� ��ġ�� ���մϴ�. �̶� �������� �̿��ڰ� ��ȭ ���� ���� ���� �� ���� ������ Ȯ���� �� �ֵ��� ������ ��ġ�� �մϴ�.
�� �������� �̿��ڰ� ������ ��ȭ�� ���� ��ۼ���, ���ܺ� ��ۺ�� �δ���, ���ܺ� ��۱Ⱓ ���� �����մϴ�. ���� �������� ���� ��۱Ⱓ�� �ʰ��� ��쿡�� �׷� ���� �̿����� ���ظ� ����Ͽ��� �մϴ�. �ٸ� �������� ����.������ ������ ������ ��쿡�� �׷����� �ƴ��մϴ�.

��14��(ȯ��)
�������� �̿��ڰ� ���Ž�û�� ��ȭ ���� ǰ�� ���� ������ �ε� �Ǵ� ������ �� �� ���� ������ ��ü ���� �� ������ �̿��ڿ��� �����ϰ� ������ ��ȭ ���� ����� ���� ��쿡�� ����� ���� ������ 3������ �̳��� ȯ���ϰų� ȯ�޿� �ʿ��� ��ġ�� ���մϴ�.

��15��(û��öȸ ��)
�� �������� ��ȭ���� ���ſ� ���� ����� ü���� �̿��ڴ� �����ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ������ ��13�� ��2�׿� ���� ��೻�뿡 ���� ������ ���� ��(�� ������ ���� ������ ��ȭ ���� ������ �ʰ� �̷���� ��쿡�� ��ȭ ���� ���޹ްų� ��ȭ ���� ������ ���۵� ���� ���մϴ�)���� 7�� �̳����� û���� öȸ�� �� �� �ֽ��ϴ�. �ٸ�, û��öȸ�� ���Ͽ� �����ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� �������� �޸� ������ �ִ� ��쿡�� �� �� ������ �����ϴ�. 
�� �̿��ڴ� ��ȭ ���� ��� ���� ��� ���� �� ȣ�� 1�� �ش��ϴ� ��쿡�� ��ǰ �� ��ȯ�� �� �� �����ϴ�.
  1. �̿��ڿ��� å�� �ִ� ������ ��ȭ ���� ��� �Ǵ� �Ѽյ� ���(�ٸ�, ��ȭ ���� ������ Ȯ���ϱ� ���Ͽ� ���� ���� �Ѽ��� ��쿡�� û��öȸ�� �� �� �ֽ��ϴ�)
  2. �̿����� ��� �Ǵ� �Ϻ� �Һ� ���Ͽ� ��ȭ ���� ��ġ�� ������ ������ ���
  3. �ð��� ����� ���Ͽ� ���ǸŰ� ����� ������ ��ȭ���� ��ġ�� ������ ������ ���
  4. ���� ������ ���� ��ȭ ������ ������ ������ ��� �� ������ ��ȭ ���� ������ �Ѽ��� ���
�� ��2����2ȣ ���� ��4ȣ�� ��쿡 �������� ������ û��öȸ ���� ���ѵǴ� ����� �Һ��ڰ� ���� �� �� �ִ� ���� �����ϰų� �ÿ��ǰ�� �����ϴ� ���� ��ġ�� ���� �ʾҴٸ� �̿����� û��öȸ ���� ���ѵ��� �ʽ��ϴ�.
�� �̿��ڴ� ��1�� �� ��2���� ������ �ұ��ϰ� ��ȭ ���� ������ ǥ��?���� ����� �ٸ��ų� ��೻��� �ٸ��� ����� ������ ���� ��ȭ ���� ���޹��� ������ 3�� �̳�, �� ����� �� �� �Ǵ� �� �� �־��� ������ 30�� �̳��� û��öȸ ���� �� �� �ֽ��ϴ�.

��16��(û��öȸ ���� ȿ��)
�� �������� �̿��ڷκ��� ��ȭ ���� ��ȯ���� ��� 3������ �̳��� �̹� ���޹��� ��ȭ ���� ����� ȯ���մϴ�. �� ��� �������� �̿��ڿ��� ��ȭ���� ȯ���� �����Ѷ����� �� �����Ⱓ�� ���Ͽ� �����ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ���� ����ɡ���21����2���� ���ϴ� ����������(��ȣ �κ� ����)�� ���Ͽ� ������ �������ڸ� �����մϴ�.
�� �������� �� ����� ȯ���Կ� �־ �̿��ڰ� �ſ�ī�� �Ǵ� ����ȭ�� ���� ������������ ��ȭ ���� ����� ������ ������ ��ü ���� ���� ���������� ������ ����ڷ� �Ͽ��� ��ȭ ���� ����� û���� ���� �Ǵ� ����ϵ��� ��û�մϴ�.
�� û��öȸ ���� ��� ���޹��� ��ȭ ���� ��ȯ�� �ʿ��� ����� �̿��ڰ� �δ��մϴ�. �������� �̿��ڿ��� û��öȸ ���� ������ ����� �Ǵ� ���ع���� û������ �ʽ��ϴ�. �ٸ� ��ȭ ���� ������ ǥ��?���� ����� �ٸ��ų� ��೻��� �ٸ��� ����Ǿ� û��öȸ ���� �ϴ� ��� ��ȭ ���� ��ȯ�� �ʿ��� ����� �������� �δ��մϴ�.
�� �̿��ڰ� ��ȭ ���� �������� �� �߼ۺ� �δ��� ��쿡 �������� û��öȸ �� �� ����� ���� �δ��ϴ����� �̿��ڰ� �˱� ������ ��Ȯ�ϰ� ǥ���մϴ�.

��17��(����������ȣ)
�� �������� �̿����� �������� ������ ���������� ���Ͽ� �ʿ��� �������� �ּ����� ���������� �����մϴ�. 
�� �������� ȸ�����Խ� ���Ű�����࿡ �ʿ��� ������ �̸� �������� �ʽ��ϴ�. �ٸ�, ���� ���ɻ� �ǹ������� ���Ͽ� ���Ű�� ������ ����Ȯ���� �ʿ��� ���μ� �ּ����� Ư�� ���������� �����ϴ� ��쿡�� �׷����� �ƴ��մϴ�.
�� �������� �̿����� ���������� ����?�̿��ϴ� ������ ���� �̿��ڿ��� �� ������ �����ϰ� ���Ǹ� �޽��ϴ�. 
�� �������� ������ ���������� �������� �뵵�� �̿��� �� ������, ���ο� �̿������ �߻��� ��� �Ǵ� ��3�ڿ��� �����ϴ� ��쿡�� �̿�?�����ܰ迡�� ���� �̿��ڿ��� �� ������ �����ϰ� ���Ǹ� �޽��ϴ�. �ٸ�, ���� ���ɿ� �޸� ������ �ִ� ��쿡�� ���ܷ� �մϴ�.
�� �������� ��2�װ� ��3�׿� ���� �̿����� ���Ǹ� �޾ƾ� �ϴ� ��쿡�� ������������ å������ �ſ�(�Ҽ�, ���� �� ��ȭ��ȣ, ��Ÿ ����ó), ������ �������� �� �̿����, ��3�ڿ� ���� �������� ���û���(����������, �������� �� ������ ������ ����) �� ��������Ÿ� �̿����� �� ������ȣ � ���� ������ ��22����2���� ������ ������ �̸� �����ϰų� �����ؾ� �ϸ� �̿��ڴ� �������� �� ���Ǹ� öȸ�� �� �ֽ��ϴ�.
�� �̿��ڴ� �������� �������� ������ �ִ� �ڽ��� ���������� ���� ���� �� ���������� �䱸�� �� ������ �������� �̿� ���� ��ü ���� �ʿ��� ��ġ�� ���� �ǹ��� ���ϴ�. �̿��ڰ� ������ ������ �䱸�� ��쿡�� �������� �� ������ ������ ������ ���� ���������� �̿����� �ʽ��ϴ�.
�� �������� �������� ��ȣ�� ���Ͽ� �̿����� ���������� ����ϴ� �ڸ� �ּ������� �����Ͽ��� �ϸ� �ſ�ī��, ������� ���� ������ �̿����� ���������� �н�, ����, ����, ���� ���� ��3�� ����, ���� ������ ���� �̿����� ���ؿ� ���Ͽ� ��� å���� ���ϴ�.
�� ������ �Ǵ� �׷κ��� ���������� �������� ��3�ڴ� ���������� �������� �Ǵ� �������� ������ �޼��� ������ ���� ���������� ��ü ���� �ı��մϴ�.
�� �������� ���������� ����?�̿�?������ ���� ���Ƕ��� �̸� ������ ������ �����ص��� �ʽ��ϴ�. ���� ���������� ����?�̿�?������ ���� �̿����� ���ǰ����� ���ѵǴ� ���񽺸� ��ü������ �����ϰ�, �ʼ������׸��� �ƴ� ���������� ����?�̿�?������ ���� �̿����� ���� ������ ������ ȸ������ �� ���� ������ �����ϰų� �������� �ʽ��ϴ�.

��18��(�������� �ǹ�)
�� �������� ���ɰ� �� ����� �����ϰų� ������ӿ� ���ϴ� ������ ���� ������ �� ����� ���ϴ� �ٿ� ���� �������̰�, ���������� ��ȭ.�뿪�� �����ϴµ� �ּ��� ���Ͽ��� �մϴ�.
�� �������� �̿��ڰ� �����ϰ� ���ͳ� ���񽺸� �̿��� �� �ֵ��� �̿����� ��������(�ſ����� ����)��ȣ�� ���� ���� �ý����� ���߾�� �մϴ�.
�� �������� ��ǰ�̳� �뿪�� ���Ͽ� ��ǥ��.������ ����ȭ�� ���� ������ ��3�� ������ �δ��� ǥ��.���������� �����ν� �̿��ڰ� ���ظ� ���� ������ �̸� ����� å���� ���ϴ�.
�� �������� �̿��ڰ� ������ �ʴ� ���������� ������ ���ڿ����� �߼����� �ʽ��ϴ�.

��19��(ȸ���� ID �� ��й�ȣ�� ���� �ǹ�)
�� ��17���� ��츦 ������ ID�� ��й�ȣ�� ���� ����å���� ȸ������ �ֽ��ϴ�.
�� ȸ���� �ڽ��� ID �� ��й�ȣ�� ��3�ڿ��� �̿��ϰ� �ؼ��� �ȵ˴ϴ�.
�� ȸ���� �ڽ��� ID �� ��й�ȣ�� �������ϰų� ��3�ڰ� ����ϰ� ������ ������ ��쿡�� �ٷ� �������� �뺸�ϰ� �������� �ȳ��� �ִ� ��쿡�� �׿� ����� �մϴ�.

��20��(�̿����� �ǹ�)
�̿��ڴ� ���� ������ �Ͽ����� �� �˴ϴ�.
1. ��û �Ǵ� ����� ���� ������ ���
2. Ÿ���� ���� ����
3. �������� �Խõ� ������ ����
4. �������� ���� ���� �̿��� ����(��ǻ�� ���α׷� ��) ���� �۽� �Ǵ� �Խ�
5. ������ ��Ÿ ��3���� ���۱� �� �������ǿ� ���� ħ��
6. ������ ��Ÿ ��3���� ������ �ջ��Ű�ų� ������ �����ϴ� ����
7. �ܼ� �Ǵ� �������� �޽���, ȭ��, ����, ��Ÿ ������ӿ� ���ϴ� ������ ���� ���� �Ǵ� �Խ��ϴ� ����

��21��(���ᡰ������ �ǿ��ᡰ���� ���� ����)
�� ���� �������� ���� �������� �����۸�ũ(��: �����۸�ũ�� ��󿡴� ����, �׸� �� ��ȭ�� ���� ���Ե�)��� ������ ����� ���, ���ڸ� ���� ������(�� ����Ʈ)�̶�� �ϰ� ���ڸ� �ǿ��� ������(������Ʈ)�̶�� �մϴ�.
�� ���ᡰ������ �ǿ��ᡰ������ ���������� �����ϴ� ��ȭ � ���Ͽ� �̿��ڿ� ���ϴ� �ŷ��� ���ؼ� ���� å���� ���� �ʴ´ٴ� ���� ���ᡰ������ �ʱ�ȭ�� �Ǵ� ����Ǵ� ������ �˾�ȭ������ ������ ��쿡�� �� �ŷ��� ���� ���� å���� ���� �ʽ��ϴ�.

��22��(���۱��� �ͼ� �� �̿�����)
�� �������� �ۼ��� ���۹��� ���� ���۱� ��Ÿ ���������� �������� �ͼ��մϴ�.
�� �̿��ڴ� �������� �̿������ν� ���� ���� �� ���������� ���������� �ͼӵ� ������ �������� ���� �³� ���� ����, �۽�, ����, ����, ��� ��Ÿ ����� ���Ͽ� ������������ �̿��ϰų� ��3�ڿ��� �̿��ϰ� �Ͽ����� �ȵ˴ϴ�.
�� �������� ������ ���� �̿��ڿ��� �ͼӵ� ���۱��� ����ϴ� ��� ���� �̿��ڿ��� �뺸�Ͽ��� �մϴ�.

��23��(�����ذ�)
�� �������� �̿��ڰ� �����ϴ� ������ �ǰ��̳� �Ҹ��� �ݿ��ϰ� �� ���ظ� ����ó���ϱ� ���Ͽ� ���غ���ó���ⱸ�� ��ġ.��մϴ�.
�� �������� �̿��ڷκ��� ����Ǵ� �Ҹ����� �� �ǰ��� �켱������ �� ������ ó���մϴ�. �ٸ�, �ż��� ó���� ����� ��쿡�� �̿��ڿ��� �� ������ ó�������� ��� �뺸�� �帳�ϴ�.
�� �������� �̿��� ���� �߻��� ���ڻ�ŷ� ����� �����Ͽ� �̿����� ���ر�����û�� �ִ� ��쿡�� �����ŷ�����ȸ �Ǵ� ��?�����簡 �Ƿ��ϴ� ������������� ������ ���� �� �ֽ��ϴ�.

��24��(���Ǳ� �� �ذŹ�)
�� �������� �̿��� ���� �߻��� ���ڻ�ŷ� ���￡ ���� �Ҽ��� ���� ����� �̿����� �ּҿ� ���ϰ�, �ּҰ� ���� ��쿡�� �żҸ� �����ϴ� ��������� ���Ӱ��ҷ� �մϴ�. �ٸ�, ���� ��� �̿����� �ּ� �Ǵ� �żҰ� �и����� �ʰų� �ܱ� �������� ��쿡�� �λ�Ҽ۹����� ���ҹ����� �����մϴ�.
�� �������� �̿��� ���� ����� ���ڻ�ŷ� �Ҽۿ��� �ѱ����� �����մϴ�.



#īī�� �˸��� ���࿡ ���� ����

�ű� ȸ���� ��ȭ��ȣ���� ��� �� ���� ȸ�� ����� ���� �̸��� ���� ���� �ȳ� �ֹ�, ��� ���� �� �񱤰��� ������ īī���� �˸������� �˷��帮��, ���� �˸��� ������ �Ұ����ϰų� ���� �����Ͻ� ��쿡�� �Ϲ� ���� �޽����� �����帳�ϴ�. �������� �ƴ� �̵���Ÿ����� ���ӽ� �˸��� ���� �� �����Ϳ���� �߻��� �� �ֽ��ϴ�. �˸������ �ٸ� ������� ���� ������ ���Ͻø� �˸����� �������ּ���.
					</textarea></td>
										</tr>
										<tr>
											<td height="10">&nbsp;</td>
										</tr>
										<tr>
											<td height="30" valign="top" align="right"><label
												for="agreeUse"> 3T�̿����� �����մϴ�. <input
													type="checkbox" id="agreeUse" name="join" value=""
													class="checkbox" />
											</label></td>
										</tr>
										<tr>
											<td align="left" class="formtext">�������� ����, �̿� ����</td>
										</tr>
										<tr>
											<td align="center"><textarea rows="10" cols="100">
��1��(����)�� �����&nbsp;3T(���ڻ�ŷ� �����)�� ��ϴ�&nbsp;3T ���̹� ��(���� �������̶� �Ѵ�)���� �����ϴ� ���ͳ� ���� ����(���� �����񽺡��� �Ѵ�)�� �̿��Կ� �־� ���̹� ���� �̿����� �Ǹ�,�ǹ� �� å�ӻ����� �������� �������� �մϴ�.�ء�PC���, ���� ���� �̿��ϴ� ���ڻ�ŷ��� ���ؼ��� �� ������ ������ �ʴ� �� �� ����� �ؿ��մϴ�.��


��2��(����)�� �������̶� OO ȸ�簡 ��ȭ �Ǵ� �뿪(���� ����ȭ ��̶� ��)�� �̿��ڿ��� �����ϱ� ���Ͽ� ��ǻ�� �� ������ż��� �̿��Ͽ� ��ȭ ���� �ŷ��� �� �ֵ��� ������ ������ �������� ���ϸ�, �ƿ﷯ ���̹����� ��ϴ� ������� �ǹ̷ε� ����մϴ�.�� ���̿��ڡ��� �������� �����Ͽ� �� ����� ���� �������� �����ϴ� ���񽺸� �޴� ȸ�� �� ��ȸ���� ���մϴ�.�� ��ȸ�����̶� ���� �������� (����) ȸ������� �� �ڷμ�, ��������� �������� �����ϴ� ���񽺸� �̿��� �� �ִ� �ڸ� ���մϴ�.�� ����ȸ�����̶� ���� ȸ���� �������� �ʰ� �������� �����ϴ� ���񽺸� �̿��ϴ� �ڸ� ���մϴ�.


��3�� (��� ���� ���ÿ� ���� �� ����) �� �������� �� ����� ����� ��ȣ �� ��ǥ�� ����, ������ ������ �ּ�(�Һ����� �Ҹ��� ó���� �� �ִ� ���� �ּҸ� ����), ��ȭ��ȣ,������۹�ȣ,���ڿ����ּ�, ����ڵ�Ϲ�ȣ, ����Ǹž� �Ű���ȣ, ������������å���ڵ��� �̿��ڰ� ���� �� �� �ֵ��� 00 ���̹����� �ʱ� ����ȭ��(����)�� �Խ��մϴ�. �ٸ�, ����� ������ �̿��ڰ� ����ȭ���� ���Ͽ� �� �� �ֵ��� �� �� �ֽ��ϴ�.�� ������ �̿��ڰ� ����� �����ϱ⿡ �ռ� ����� ���Ͽ��� �ִ� ���� �� û��öȸ.���å��.ȯ������ ��� ���� �߿��� ������ �̿��ڰ� ������ �� �ֵ��� ������ ����ȭ�� �Ǵ� �˾�ȭ�� ���� �����Ͽ� �̿����� Ȯ���� ���Ͽ��� �մϴ�.�� �������� �����ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ������, ������� ������ ���� ������, �����ڹ��� �� ���ڰŷ��⺻����, �����ڱ����ŷ�����, �����ڼ�������, ��������Ÿ� �̿����� �� ������ȣ � ���� ������, ���湮�Ǹ� � ���� ������, ���Һ��ڱ⺻���� �� ���� ���� �������� �ʴ� �������� �� ����� ������ �� �ֽ��ϴ�.�� �������� ����� ������ ��쿡�� �������� �� ���������� �����Ͽ� �������� �Բ� ���� �ʱ�ȭ�鿡 �� �������� 7�� �������� �������� ���ϱ��� �����մϴ�. �ٸ�, �̿��ڿ��� �Ҹ��ϰ� ��������� �����ϴ� ��쿡�� �ּ��� 30�� �̻��� ���� �����Ⱓ�� �ΰ� �����մϴ�. �� ��� "������ ���� �� ����� ���� �� ������ ��Ȯ�ϰ� ���Ͽ� �̿��ڰ� �˱� ������ ǥ���մϴ�. �� �������� ����� ������ ��쿡�� �� ��������� �� �������� ���Ŀ� ü��Ǵ� ��࿡�� ����ǰ� �� ������ �̹� ü��� ��࿡ ���ؼ��� ���� ���� ��������� �״�� ����˴ϴ�. �ٸ� �̹� ����� ü���� �̿��ڰ� ������� ������ ������ �ޱ⸦ ���ϴ� ���� ��3�׿� ���� ��������� �����Ⱓ ���� �������� �۽��Ͽ� �������� ���Ǹ� ���� ��쿡�� ������� ������ ����˴ϴ�.�� �� ������� ������ �ƴ��� ���װ� �� ����� �ؼ��� ���Ͽ��� ���ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ����, ����� ���� � ���� ����, �����ŷ�����ȸ�� ���ϴ� ���ڻ�ŷ� ����� �Һ��� ��ȣ��ħ �� ������� �Ǵ� ����ʿ� �����ϴ�.


��4��(������ ���� �� ����) �� �������� ������ ���� ������ �����մϴ�.&nbsp; 1. ��ȭ �Ǵ� �뿪�� ���� ���� ���� �� ���Ű���� ü��&nbsp; 2. ���Ű���� ü��� ��ȭ �Ǵ� �뿪�� ���&nbsp; 3. ��Ÿ �������� ���ϴ� ������ �������� ��ȭ �Ǵ� �뿪�� ǰ�� �Ǵ� ����� ����� ���� ���� ��쿡�� ���� ü��Ǵ� ��࿡ ���� ������ ��ȭ �Ǵ� �뿪�� ������ ������ �� �ֽ��ϴ�. �� ��쿡�� ����� ��ȭ �Ǵ� �뿪�� ���� �� �������ڸ� �����Ͽ� ������ ��ȭ �Ǵ� �뿪�� ������ �Խ��� ���� ��� �����մϴ�.�� �������� �����ϱ�� �̿��ڿ� ����� ü���� ������ ������ ��ȭ���� ǰ�� �Ǵ� ����� ����� ���� ���� ������ ������ ��쿡�� �� ������ �̿��ڿ��� ���� ������ �ּҷ� ��� �����մϴ�.�� ������ ��� �������� �̷� ���Ͽ� �̿��ڰ� ���� ���ظ� ����մϴ�. �ٸ�, �������� ���� �Ǵ� ������ ������ �����ϴ� ��쿡�� �׷����� �ƴ��մϴ�.


��5��(������ �ߴ�) �� �������� ��ǻ�� �� ������ż����� ��������.��ü �� ����, ����� ���� ���� ������ �߻��� ��쿡�� ������ ������ �Ͻ������� �ߴ��� �� �ֽ��ϴ�.�� �������� ��1���� ������ ������ ������ �Ͻ������� �ߴܵ����� ���Ͽ� �̿��� �Ǵ� ��3�ڰ� ���� ���ؿ� ���Ͽ� ����մϴ�. ��, �������� ���� �Ǵ� ������ ������ �����ϴ� ��쿡�� �׷����� �ƴ��մϴ�.�� ��������� ��ȯ, ����� ����, ��ü ���� ���� ���� ������ ���񽺸� ������ �� ���� �Ǵ� ��쿡�� �������� ��8���� ���� ������� �̿��ڿ��� �����ϰ� ���� ���������� ������ ���ǿ� ���� �Һ��ڿ��� �����մϴ�. �ٸ�, �������� ������� ���� �������� �ƴ��� ��쿡�� �̿��ڵ��� ���ϸ��� �Ǵ� ������ ���� ���������� ���Ǵ� ��ȭ��ġ�� �����ϴ� ���� �Ǵ� �������� �̿��ڿ��� �����մϴ�.


��7��(ȸ�� Ż�� �� �ڰ� ��� ��) �� ȸ���� �������� �������� Ż�� ��û�� �� ������ �������� ��� ȸ��Ż�� ó���մϴ�.�� ȸ���� ���� �� ȣ�� ������ �ش��ϴ� ���, �������� ȸ���ڰ��� ���� �� ������ų �� �ֽ��ϴ�.&nbsp; 1. ���� ��û �ÿ� ���� ������ ����� ���&nbsp; 2. �������� �̿��Ͽ� ������ ��ȭ ���� ���, ��Ÿ �������̿뿡 �����Ͽ� ȸ���� �δ��ϴ� ä���� ���Ͽ� �������� �ʴ� ���&nbsp; 3. �ٸ� ����� ������ �̿��� �����ϰų� �� ������ �����ϴ� �� ���ڻ�ŷ� ������ �����ϴ� ���&nbsp; 4. �������� �̿��Ͽ� ���� �Ǵ� �� ����� �����ϰų� ������ӿ� ���ϴ� ������ �ϴ� ���� �������� ȸ�� �ڰ��� ����.���� ��Ų ��, ������ ������ 2ȸ �̻� �ݺ��ǰų� 30�� �̳��� �� ������ �������� �ƴ��ϴ� ��� �������� ȸ���ڰ��� ��ǽ�ų �� �ֽ��ϴ�.�� �������� ȸ���ڰ��� ��ǽ�Ű�� ��쿡�� ȸ������� �����մϴ�. �� ��� ȸ������ �̸� �����ϰ�, ȸ����� ���� ���� �ּ��� 30�� �̻��� �Ⱓ�� ���Ͽ� �Ҹ��� ��ȸ�� �ο��մϴ�.


��8��(ȸ���� ���� ����)�� �������� ȸ���� ���� ������ �ϴ� ���, ȸ���� �������� �̸� �����Ͽ� ������ ���ڿ��� �ּҷ� �� �� �ֽ��ϴ�.�� �������� ��Ư���ټ� ȸ���� ���� ������ ��� 1�����̻� ������ �Խ��ǿ� �Խ������μ� ���� ������ ������ �� �ֽ��ϴ�. �ٸ�, ȸ�� ������ �ŷ��� �����Ͽ� �ߴ��� ������ ��ġ�� ���׿� ���Ͽ��� ���������� �մϴ�.


��9��(���Ž�û) �� �������̿��ڴ� �������󿡼� ���� �Ǵ� �̿� ������ ����� ���Ͽ� ���Ÿ� ��û�ϸ�, �������� �̿��ڰ� ���Ž�û�� �Կ� �־ ������ �� ������ �˱� ���� �����Ͽ��� �մϴ�. (����)&nbsp; 1. ��ȭ ���� �˻� �� ����&nbsp; 2. �޴� ����� ����, �ּ�, ��ȭ��ȣ, ���ڿ����ּ�(�Ǵ� �̵���ȭ��ȣ) ���� �Է�&nbsp; 3. �������, û��öȸ���� ���ѵǴ� ����, ��۷�.��ġ�� ���� ���δ�� ������ ���뿡 ���� Ȯ��&nbsp; 4. �� ����� �����ϰ� �� 3.ȣ�� ������ Ȯ���ϰų� �ź��ϴ� ǥ��(��, ���콺 Ŭ��)&nbsp; 5. ��ȭ���� ���Ž�û �� �̿� ���� Ȯ�� �Ǵ� �������� Ȯ�ο� ���� ����&nbsp; 6. ��������� ���è� �������� ��3�ڿ��� ������ ���������� ����?��Ź�� �ʿ䰡 �ִ� ��� ���� ���Ž�û �� �������� ���Ǹ� �޾ƾ� �ϸ�, ȸ������ �� �̸� ���������� ���Ǹ� ���� �ʽ��ϴ�. �� �� �������� �����Ǵ� �������� �׸�, �����޴� ��, �����޴� ���� �������� �̿� ���� �� ����?�̿� �Ⱓ ���� �����ڿ��� �����Ͽ��� �մϴ�. �ٸ� ��������Ÿ��̿����� �� ������ȣ � ���� ������ ��25�� ��1�׿� ���� �������� �����Ź�� ��� �� ���� ���ɿ� �޸� ������ �ִ� ��쿡�� �׿� �����ϴ�.


��10�� (����� ����)�� �������� ��9���� ���� ���Ž�û�� ���Ͽ� ���� �� ȣ�� �ش��ϸ� �³����� ���� �� �ֽ��ϴ�. �ٸ�, �̼����ڿ� ����� ü���ϴ� ��쿡�� �����븮���� ���Ǹ� ���� ���ϸ� �̼����� ���� �Ǵ� �����븮���� ����� ����� �� �ִٴ� ������ �����Ͽ��� �մϴ�.&nbsp; 1. ��û ���뿡 ����, ���紩��, ���Ⱑ �ִ� ���&nbsp; 2. �̼����ڰ� ���, �ַ� �� û�ҳ⺸ȣ������ �����ϴ� ��ȭ �� �뿪�� �����ϴ� ���&nbsp; 3. ��Ÿ ���Ž�û�� �³��ϴ� ���� ������ ����� ������ ������ �ִٰ� �Ǵ��ϴ� ���� �������� �³��� ��12����1���� ����Ȯ���������·� �̿��ڿ��� ������ ������ ����� ������ ������ ���ϴ�.�� �������� �³��� �ǻ�ǥ�ÿ��� �̿����� ���� ��û�� ���� Ȯ�� �� �ǸŰ��� ����, ���Ž�û�� ���� ��� � ���� ���� ���� �����Ͽ��� �մϴ�.


��11��(���޹��)���������� ������ ��ȭ �Ǵ� �뿪�� ���� ������޹���� ���� �� ȣ�� ����� ������ ������� �� �� �ֽ��ϴ�. ��, �������� �̿����� ���޹���� ���Ͽ� ��ȭ ���� ��ݿ� ��� ������ �����ᵵ �߰��Ͽ� ¡���� �� �����ϴ�.1. ����ŷ, ���ͳݹ�ŷ, ���� ��ŷ ���� ���� ������ü 2. ����ī��, ����ī��, �ſ�ī�� ���� ���� ī�� ����3. �¶��ι������Ա�4. ����ȭ�� ���� ����5. ���� �� �������6. ���ϸ��� �� �������� ������ ����Ʈ�� ���� ����7. �������� ����� �ξ��ų� �������� ������ ��ǰ�ǿ� ���� ���� 8. ��Ÿ ������ ���� ����� ���� ��� ���� ��


��12��(����Ȯ������.���Ž�û ���� �� ���)�� �������� �̿����� ���Ž�û�� �ִ� ��� �̿��ڿ��� ����Ȯ�������� �մϴ�.�� ����Ȯ�������� ���� �̿��ڴ� �ǻ�ǥ���� ����ġ ���� �ִ� ��쿡�� ����Ȯ�������� ���� �� ��� ���Ž�û ���� �� ��Ҹ� ��û�� �� �ְ� �������� ��� ���� �̿����� ��û�� �ִ� ��쿡�� ��ü ���� �� ��û�� ���� ó���Ͽ��� �մϴ�. �ٸ� �̹� ����� ������ ��쿡�� ��15���� û��öȸ � ���� ������ �����ϴ�.


��13��(��ȭ ���� ����)�� �������� �̿��ڿ� ��ȭ ���� ���޽ñ⿡ ���Ͽ� ������ ������ ���� �̻�, �̿��ڰ� û���� �� ������ 7�� �̳��� ��ȭ ���� ����� �� �ֵ��� �ֹ�����, ���� �� ��Ÿ�� �ʿ��� ��ġ�� ���մϴ�. �ٸ�, �������� �̹� ��ȭ ���� ����� ���� �Ǵ� �Ϻθ� ���� ��쿡�� ����� ���� �Ǵ� �Ϻθ� ���� ������ 3������ �̳��� ��ġ�� ���մϴ�. �̶� �������� �̿��ڰ� ��ȭ ���� ���� ���� �� ���� ������ Ȯ���� �� �ֵ��� ������ ��ġ�� �մϴ�.�� �������� �̿��ڰ� ������ ��ȭ�� ���� ��ۼ���, ���ܺ� ��ۺ�� �δ���, ���ܺ� ��۱Ⱓ ���� �����մϴ�. ���� �������� ���� ��۱Ⱓ�� �ʰ��� ��쿡�� �׷� ���� �̿����� ���ظ� ����Ͽ��� �մϴ�. �ٸ� �������� ����.������ ������ ������ ��쿡�� �׷����� �ƴ��մϴ�.


��14��(ȯ��)�������� �̿��ڰ� ���Ž�û�� ��ȭ ���� ǰ�� ���� ������ �ε� �Ǵ� ������ �� �� ���� ������ ��ü ���� �� ������ �̿��ڿ��� �����ϰ� ������ ��ȭ ���� ����� ���� ��쿡�� ����� ���� ������ 3������ �̳��� ȯ���ϰų� ȯ�޿� �ʿ��� ��ġ�� ���մϴ�.


��15��(û��öȸ ��)�� �������� ��ȭ���� ���ſ� ���� ����� ü���� �̿��ڴ� �����ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ������ ��13�� ��2�׿� ���� ��೻�뿡 ���� ������ ���� ��(�� ������ ���� ������ ��ȭ ���� ������ �ʰ� �̷���� ��쿡�� ��ȭ ���� ���޹ްų� ��ȭ ���� ������ ���۵� ���� ���մϴ�)���� 7�� �̳����� û���� öȸ�� �� �� �ֽ��ϴ�. �ٸ�, û��öȸ�� ���Ͽ� �����ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� �������� �޸� ������ �ִ� ��쿡�� �� �� ������ �����ϴ�. �� �̿��ڴ� ��ȭ ���� ��� ���� ��� ���� �� ȣ�� 1�� �ش��ϴ� ��쿡�� ��ǰ �� ��ȯ�� �� �� �����ϴ�.&nbsp; 1. �̿��ڿ��� å�� �ִ� ������ ��ȭ ���� ��� �Ǵ� �Ѽյ� ���(�ٸ�, ��ȭ ���� ������ Ȯ���ϱ� ���Ͽ� ���� ���� �Ѽ��� ��쿡�� û��öȸ�� �� �� �ֽ��ϴ�)&nbsp; 2. �̿����� ��� �Ǵ� �Ϻ� �Һ� ���Ͽ� ��ȭ ���� ��ġ�� ������ ������ ���&nbsp; 3. �ð��� ����� ���Ͽ� ���ǸŰ� ����� ������ ��ȭ���� ��ġ�� ������ ������ ���&nbsp; 4. ���� ������ ���� ��ȭ ������ ������ ������ ��� �� ������ ��ȭ ���� ������ �Ѽ��� ���� ��2����2ȣ ���� ��4ȣ�� ��쿡 �������� ������ û��öȸ ���� ���ѵǴ� ����� �Һ��ڰ� ���� �� �� �ִ� ���� �����ϰų� �ÿ��ǰ�� �����ϴ� ���� ��ġ�� ���� �ʾҴٸ� �̿����� û��öȸ ���� ���ѵ��� �ʽ��ϴ�.�� �̿��ڴ� ��1�� �� ��2���� ������ �ұ��ϰ� ��ȭ ���� ������ ǥ��?���� ����� �ٸ��ų� ��೻��� �ٸ��� ����� ������ ���� ��ȭ ���� ���޹��� ������ 3�� �̳�, �� ����� �� �� �Ǵ� �� �� �־��� ������ 30�� �̳��� û��öȸ ���� �� �� �ֽ��ϴ�.


��16��(û��öȸ ���� ȿ��)�� �������� �̿��ڷκ��� ��ȭ ���� ��ȯ���� ��� 3������ �̳��� �̹� ���޹��� ��ȭ ���� ����� ȯ���մϴ�. �� ��� �������� �̿��ڿ��� ��ȭ���� ȯ���� �����Ѷ����� �� �����Ⱓ�� ���Ͽ� �����ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ���� ����ɡ���21����2���� ���ϴ� ����������(��ȣ �κ� ����)�� ���Ͽ� ������ �������ڸ� �����մϴ�.�� �������� �� ����� ȯ���Կ� �־ �̿��ڰ� �ſ�ī�� �Ǵ� ����ȭ�� ���� ������������ ��ȭ ���� ����� ������ ������ ��ü ���� ���� ���������� ������ ����ڷ� �Ͽ��� ��ȭ ���� ����� û���� ���� �Ǵ� ����ϵ��� ��û�մϴ�.�� û��öȸ ���� ��� ���޹��� ��ȭ ���� ��ȯ�� �ʿ��� ����� �̿��ڰ� �δ��մϴ�. �������� �̿��ڿ��� û��öȸ ���� ������ ����� �Ǵ� ���ع���� û������ �ʽ��ϴ�. �ٸ� ��ȭ ���� ������ ǥ��?���� ����� �ٸ��ų� ��೻��� �ٸ��� ����Ǿ� û��öȸ ���� �ϴ� ��� ��ȭ ���� ��ȯ�� �ʿ��� ����� �������� �δ��մϴ�.�� �̿��ڰ� ��ȭ ���� �������� �� �߼ۺ� �δ��� ��쿡 �������� û��öȸ �� �� ����� ���� �δ��ϴ����� �̿��ڰ� �˱� ������ ��Ȯ�ϰ� ǥ���մϴ�.


��17��(����������ȣ)�� �������� �̿����� �������� ������ ���������� ���Ͽ� �ʿ��� �������� �ּ����� ���������� �����մϴ�. �� �������� ȸ�����Խ� ���Ű�����࿡ �ʿ��� ������ �̸� �������� �ʽ��ϴ�. �ٸ�, ���� ���ɻ� �ǹ������� ���Ͽ� ���Ű�� ������ ����Ȯ���� �ʿ��� ���μ� �ּ����� Ư�� ���������� �����ϴ� ��쿡�� �׷����� �ƴ��մϴ�.�� �������� �̿����� ���������� ����?�̿��ϴ� ������ ���� �̿��ڿ��� �� ������ �����ϰ� ���Ǹ� �޽��ϴ�. �� �������� ������ ���������� �������� �뵵�� �̿��� �� ������, ���ο� �̿������ �߻��� ��� �Ǵ� ��3�ڿ��� �����ϴ� ��쿡�� �̿�?�����ܰ迡�� ���� �̿��ڿ��� �� ������ �����ϰ� ���Ǹ� �޽��ϴ�. �ٸ�, ���� ���ɿ� �޸� ������ �ִ� ��쿡�� ���ܷ� �մϴ�.�� �������� ��2�װ� ��3�׿� ���� �̿����� ���Ǹ� �޾ƾ� �ϴ� ��쿡�� ������������ å������ �ſ�(�Ҽ�, ���� �� ��ȭ��ȣ, ��Ÿ ����ó), ������ �������� �� �̿����, ��3�ڿ� ���� �������� ���û���(����������, �������� �� ������ ������ ����) �� ��������Ÿ� �̿����� �� ������ȣ � ���� ������ ��22����2���� ������ ������ �̸� �����ϰų� �����ؾ� �ϸ� �̿��ڴ� �������� �� ���Ǹ� öȸ�� �� �ֽ��ϴ�.�� �̿��ڴ� �������� �������� ������ �ִ� �ڽ��� ���������� ���� ���� �� ���������� �䱸�� �� ������ �������� �̿� ���� ��ü ���� �ʿ��� ��ġ�� ���� �ǹ��� ���ϴ�. �̿��ڰ� ������ ������ �䱸�� ��쿡�� �������� �� ������ ������ ������ ���� ���������� �̿����� �ʽ��ϴ�.�� �������� �������� ��ȣ�� ���Ͽ� �̿����� ���������� ����ϴ� �ڸ� �ּ������� �����Ͽ��� �ϸ� �ſ�ī��, ������� ���� ������ �̿����� ���������� �н�, ����, ����, ���� ���� ��3�� ����, ���� ������ ���� �̿����� ���ؿ� ���Ͽ� ��� å���� ���ϴ�.�� ������ �Ǵ� �׷κ��� ���������� �������� ��3�ڴ� ���������� �������� �Ǵ� �������� ������ �޼��� ������ ���� ���������� ��ü ���� �ı��մϴ�.�� �������� ���������� ����?�̿�?������ ���� ���Ƕ��� �̸� ������ ������ �����ص��� �ʽ��ϴ�. ���� ���������� ����?�̿�?������ ���� �̿����� ���ǰ����� ���ѵǴ� ���񽺸� ��ü������ �����ϰ�, �ʼ������׸��� �ƴ� ���������� ����?�̿�?������ ���� �̿����� ���� ������ ������ ȸ������ �� ���� ������ �����ϰų� �������� �ʽ��ϴ�.


��18��(�������� �ǹ�)�� �������� ���ɰ� �� ����� �����ϰų� ������ӿ� ���ϴ� ������ ���� ������ �� ����� ���ϴ� �ٿ� ���� �������̰�, ���������� ��ȭ.�뿪�� �����ϴµ� �ּ��� ���Ͽ��� �մϴ�.�� �������� �̿��ڰ� �����ϰ� ���ͳ� ���񽺸� �̿��� �� �ֵ��� �̿����� ��������(�ſ����� ����)��ȣ�� ���� ���� �ý����� ���߾�� �մϴ�.�� �������� ��ǰ�̳� �뿪�� ���Ͽ� ��ǥ��.������ ����ȭ�� ���� ������ ��3�� ������ �δ��� ǥ��.���������� �����ν� �̿��ڰ� ���ظ� ���� ������ �̸� ����� å���� ���ϴ�.�� �������� �̿��ڰ� ������ �ʴ� ���������� ������ ���ڿ����� �߼����� �ʽ��ϴ�.


��19��(ȸ���� ID �� ��й�ȣ�� ���� �ǹ�)�� ��17���� ��츦 ������ ID�� ��й�ȣ�� ���� ����å���� ȸ������ �ֽ��ϴ�.�� ȸ���� �ڽ��� ID �� ��й�ȣ�� ��3�ڿ��� �̿��ϰ� �ؼ��� �ȵ˴ϴ�.�� ȸ���� �ڽ��� ID �� ��й�ȣ�� �������ϰų� ��3�ڰ� ����ϰ� ������ ������ ��쿡�� �ٷ� �������� �뺸�ϰ� �������� �ȳ��� �ִ� ��쿡�� �׿� ����� �մϴ�.


��20��(�̿����� �ǹ�)�̿��ڴ� ���� ������ �Ͽ����� �� �˴ϴ�.1. ��û �Ǵ� ����� ���� ������ ���2. Ÿ���� ���� ����3. �������� �Խõ� ������ ����4. �������� ���� ���� �̿��� ����(��ǻ�� ���α׷� ��) ���� �۽� �Ǵ� �Խ�5. ������ ��Ÿ ��3���� ���۱� �� �������ǿ� ���� ħ��6. ������ ��Ÿ ��3���� ������ �ջ��Ű�ų� ������ �����ϴ� ����7. �ܼ� �Ǵ� �������� �޽���, ȭ��, ����, ��Ÿ ������ӿ� ���ϴ� ������ ���� ���� �Ǵ� �Խ��ϴ� ����


��21��(���ᡰ������ �ǿ��ᡰ���� ���� ����)�� ���� �������� ���� �������� �����۸�ũ(��: �����۸�ũ�� ��󿡴� ����, �׸� �� ��ȭ�� ���� ���Ե�)��� ������ ����� ���, ���ڸ� ���� ������(�� ����Ʈ)�̶�� �ϰ� ���ڸ� �ǿ��� ������(������Ʈ)�̶�� �մϴ�.�� ���ᡰ������ �ǿ��ᡰ������ ���������� �����ϴ� ��ȭ � ���Ͽ� �̿��ڿ� ���ϴ� �ŷ��� ���ؼ� ���� å���� ���� �ʴ´ٴ� ���� ���ᡰ������ �ʱ�ȭ�� �Ǵ� ����Ǵ� ������ �˾�ȭ������ ������ ��쿡�� �� �ŷ��� ���� ���� å���� ���� �ʽ��ϴ�.


��22��(���۱��� �ͼ� �� �̿�����)�� �������� �ۼ��� ���۹��� ���� ���۱� ��Ÿ ���������� �������� �ͼ��մϴ�.�� �̿��ڴ� �������� �̿������ν� ���� ���� �� ���������� ���������� �ͼӵ� ������ �������� ���� �³� ���� ����, �۽�, ����, ����, ��� ��Ÿ ����� ���Ͽ� ������������ �̿��ϰų� ��3�ڿ��� �̿��ϰ� �Ͽ����� �ȵ˴ϴ�.�� �������� ������ ���� �̿��ڿ��� �ͼӵ� ���۱��� ����ϴ� ��� ���� �̿��ڿ��� �뺸�Ͽ��� �մϴ�.


��23��(�����ذ�)�� �������� �̿��ڰ� �����ϴ� ������ �ǰ��̳� �Ҹ��� �ݿ��ϰ� �� ���ظ� ����ó���ϱ� ���Ͽ� ���غ���ó���ⱸ�� ��ġ.��մϴ�.�� �������� �̿��ڷκ��� ����Ǵ� �Ҹ����� �� �ǰ��� �켱������ �� ������ ó���մϴ�. �ٸ�, �ż��� ó���� ����� ��쿡�� �̿��ڿ��� �� ������ ó�������� ��� �뺸�� �帳�ϴ�.�� �������� �̿��� ���� �߻��� ���ڻ�ŷ� ����� �����Ͽ� �̿����� ���ر�����û�� �ִ� ��쿡�� �����ŷ�����ȸ �Ǵ� ��?�����簡 �Ƿ��ϴ� ������������� ������ ���� �� �ֽ��ϴ�.


��24��(���Ǳ� �� �ذŹ�)�� �������� �̿��� ���� �߻��� ���ڻ�ŷ� ���￡ ���� �Ҽ��� ���� ����� �̿����� �ּҿ� ���ϰ�, �ּҰ� ���� ��쿡�� �żҸ� �����ϴ� ��������� ���Ӱ��ҷ� �մϴ�. �ٸ�, ���� ��� �̿����� �ּ� �Ǵ� �żҰ� �и����� �ʰų� �ܱ� �������� ��쿡�� �λ�Ҽ۹����� ���ҹ����� �����մϴ�.�� �������� �̿��� ���� ����� ���ڻ�ŷ� �Ҽۿ��� �ѱ����� �����մϴ�.


#īī�� �˸��� ���࿡ ���� ����

�ű� ȸ���� ��ȭ��ȣ���� ��� �� ���� ȸ�� ����� ���� �̸��� ���� ���� �ȳ� �ֹ�, ��� ���� �� �񱤰��� ������ īī���� �˸������� �˷��帮��, ���� �˸��� ������ �Ұ����ϰų� ���� �����Ͻ� ��쿡�� �Ϲ� ���� �޽����� �����帳�ϴ�. �������� �ƴ� �̵���Ÿ����� ���ӽ� �˸��� ���� �� �����Ϳ���� �߻��� �� �ֽ��ϴ�. �˸������ �ٸ� ������� ���� ������ ���Ͻø� �˸����� �������ּ���.
					</textarea></td>
										</tr>
										<tr>
											<td height="10">&nbsp;</td>
										</tr>
										<tr>
											<td valign="top" align="right"><label for="agreePrivacy">
													������������, �̿� ���ǿ� �����մϴ�. <input type="checkbox"
													id="agreePrivacy" name="join" value="" class="checkbox" />
											</label></td>
										</tr>
										<tr>
											<td colspan="2" align="center" style="padding:20px 0px;"><input type="submit"
												value="������" class="submit"> <input type="button"
												value="���Ǿ���" onclick="location.href='main.action'"
												class="hreflink"></td>
										</tr>
									</table></td>
							</tr>
						</table>

					</td>
				</tr>
			</table>

		</form>
	</body>
</center>
</html>