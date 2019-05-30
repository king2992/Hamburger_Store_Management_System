<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 정보 등록</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/js/cardAdd.js"></script>
</head>
<body>
 	<div><span>은행</span></div>
	<div>
		<select name="bankName">
			<option>농협</option>
			<option>신한은행</option>
			<option>국민은행</option>
			<option>하나은행</option>
			<option>카카오뱅크</option>
		</select>
	</div>
		<div><span>카드 번호</span></div>
		<input type="text" name="cardNum">
		<div><span>만기일</span></div>
	<div style="display:inline-flex">
		<select name="validityMonth">
			<option>MM</option><option>01</option><option>02</option><option>03</option><option>04</option><option>05</option><option>06</option><option>07</option><option>08</option><option>09</option><option>10</option><option>11</option><option>12</option><option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option><option>19</option><option>20</option><option>21</option><option>22</option><option>23</option><option>24</option><option>25</option><option>26</option><option>27</option><option>28</option><option>29</option><option>30</option><option>31</option>
		</select>
		<select name="validityYears">
			<option>YY</option><option>01</option><option>02</option><option>03</option><option>04</option><option>05</option><option>06</option><option>07</option><option>08</option><option>09</option><option>10</option><option>11</option><option>12</option>
		</select>
	</div>
		<div><span>보안 코드</span></div>
		<div><input type="text" name="securityCode"></div>
		<div><span>카드 비밀번호</span></div>
		<div><input type="password" name="cardPw"></div>
		<button type="button" id="cardCheck">카드 조회</button>
	<button type="button" id="cardAdd">카드 등록</button>
</body> 
</html>