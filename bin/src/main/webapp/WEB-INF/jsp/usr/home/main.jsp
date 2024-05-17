<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>


<!-- 테일윈드 불러오기 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" />

<style>
.big-outer-box {
	width: auto;
	height: 1500px;
	display: flex;
	align-items: center;
	flex-direction: column;
	justify-content: center;
}

.small-outer-box {
	width: 100%;
	height: 100%;
	display: flex;
	margin-top: 50px;
	flex-direction: column;
	margin-bottom: 250px;
}

/* 추가된 스타일 */
.search-container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 20px;
}
.area-search-box{
height: auto;
margin-top: 50px;

}
.search-input {
	width: 300px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.search-btn {
	padding: 10px 20px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

/* 추가된 스타일 */
.radio-container {
	margin-bottom: 20px;
}

.radio-input {
	margin-right: 10px;
}

.weather-info{
width: 30px;
height: 30px;

}
</style>

<div class="big-outer-box">
    <div class="small-outer-box">
  
        <!-- 검색창 및 버튼 -->
        <div class="search-container">
            <input type="text" id="faq-search" class="search-input" placeholder="FAQ 검색">
            <button type="button" onclick="searchFAQ()" class="search-btn">검색</button>
        </div>
  
        <!-- 지역 검색 input -->
        <div class="area-search-box">
            <input type="text" id="region-search" class="search-input" placeholder="지역 검색">
            <button type="button" onclick="searchWeather()" class="search-btn">검색</button>
        </div>

        <!-- 지역 select 박스 -->
        <div class="area-select-box mt-4">
            <select id="region-select" class="search-input">
                <option value="대전" selected>대전</option>
                <!-- 다른 지역들을 필요한 만큼 추가할 수 있습니다 -->
            </select>
        </div>
  
        <!-- 날씨 정보 표시 요소 -->
        <div id="weather-info" class="weather-info mt-4 text-center"></div>
  
    </div>
</div>



<%@ include file="../common/foot.jspf"%>

<script>
	// 검색 함수
	function searchFAQ() {
		// 입력된 검색어 가져오기
		var searchQuery = document.getElementById("faq-search").value;

		// 여기서 검색 로직을 추가하고 검색 결과를 보여줄 수 있도록 구현
		// 예: AJAX 요청을 사용하여 서버에서 검색 결과를 가져와서 동적으로 화면에 표시
		// 검색 결과는 ".news" 클래스를 가진 요소 안에 추가되도록 설정
	}
</script>


<script>
function searchWeather() {
    // 입력된 지역 가져오기
    var region = document.getElementById("region-search").value;
    
    // 대전의 날씨 정보를 가져오는 API 사용 예시
    // 여기서는 테스트용으로 하드코딩한 것입니다. 실제로는 API를 호출해야 합니다.
    var weatherDescription = "맑음";
    var temperature = "3";
  
    // 표시할 요소 선택
    var weatherElement = document.getElementById('weather-info');
  
    // 날씨 정보 표시
    weatherElement.innerHTML = "지역: " + region + ", 온도: " + temperature + "℃, 설명: " + weatherDescription;
}

</script>

