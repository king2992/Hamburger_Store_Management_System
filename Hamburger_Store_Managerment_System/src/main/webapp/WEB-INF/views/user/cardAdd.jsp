<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 정보 등록</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/js/cardAdd.js"></script>
<link rel="stylesheet" href="/resources/css/mypage.css">
</head>
<body>
 	  <div class="cardAdd">
           <h2>결제카드 등록</h2>
               <div class="paymentCardAdd bank">
                    <p1>은행</p1>
                        <select name="bankName" id="bankName" class="bank_select" title="은행 선택">
                             <option value="NHbank" selected> 농협</option>
                             <option value="Shinhanbank"> 신한은행</option>
                             <option value="nationbank"> 국민은행</option>
                             <option value="hanabank"> 하나은행</option>
                             <option value="cacaobank"> 카카오뱅크</option>
                        </select>
                    </div>
                    <div class="paymentCardAdd cardNum">
                        <p1>카드번호</p1>
                        <input type="text" name="cardNum" class="Number"title="카드번호 입력">
                    </div>
                     <div class="paymentCardAdd Duedate">
                        <p1>만기일</p1>
                        <div style="display:inline-flex" class="date">
                            <select name="validityMonth" id="validityMonth" class="validity Month" title="달 선택">
                                     <option>MM</option><option>01</option><option>02</option><option>03</option><option>04</option><option>05</option><option>06</option><option>07</option><option>08</option><option>09</option><option>10</option><option>11</option><option>12</option><option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option><option>19</option><option>20</option><option>21</option><option>22</option><option>23</option><option>24</option><option>25</option><option>26</option><option>27</option><option>28</option><option>29</option><option>30</option><option>31</option>
                            </select>
                            <select name="validityYears" id="validityYears" class="validity Years" title="연도 선택">
                              <option value="YY" selected>YY</option>
                              <option>01</option>
                              <option>02</option>
                              <option>03</option>
                              <option>04</option>
                              <option>05</option>
                              <option>06</option>
                              <option>07</option>
                              <option>08</option>
                              <option>09</option>
                              <option>10</option>
                              <option>11</option>
                              <option>12</option>
                            </select>
                        </div>
                    </div>
                    <div class="paymentCardAdd securityCode">
                        <p1>보안코드</p1>
                        <input type="text" name="securityCode" class="Number"title="보안코드 입력">
                    </div>
                    <div class="paymentCardAdd cardPw">
                        <p1>카드 비밀번호</p1>
                        <input type="password" name="cardPw" class="Number"title="카드 비밀번호 입력">
                    </div>
                    <button type="button" id="cardCheck" class="cardButton Check">카드 조회</button>
                    <button type="button" id="cardAdd" class="cardButton">카드 등록</button>
                </div>
</body> 
</html>