<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>


<!-- 테일윈드 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" />

<style>
.big-outer-box {
	width: auto;
	height: 1500px;
	display: block;
	align-items: center;
	flex-direction: column;
	justify-content: center;
}

.small-outer-box {
	width: 100%;
	height: 100%;
	display: block;
	margin-top: 50px;
	flex-direction: column;
	margin-bottom: 250px;
}

.search-container {
	display: block;
	justify-content: center;
	align-items: center;
	margin-bottom: 20px;
	margin-left: 40%;
}

.area-search-box {
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

.content-box {
	display: flex;
}

.area-outer-box {
	width: 50%;
	margin-left: 40%;
}

/* 날씨 박스  */
.weather-outer-box {
	width: 50%;
	display: flex;
	justify-content: center;
}

.weather-info {
	width: 300px;
	height: 300px;
	border: none;
	border-radius: 12px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
background-color: #4CAF50;
	color: white;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	padding: 20px;
	font-size: 16px;
	line-height: 1.6;
}

.weather-info div {
	margin: 10px 0;
}

/* 대전 관광지 목록  */
.tour-spot-box {
	display: none; /* 초기 상태에서는 숨김 */
	width: 100%;
	height: 80%;
	display: flex;
	justify-content: center;
	margin-top: 50px;
}

.tour-spot-small-box {
	width: 90%;
	height: 50%;
	display: flex;
	justify-content: center;
}

.tour-info-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.tour-info-table, .tour-info-table th, .tour-info-table td {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: left;
}

.tour-info-table th {
background-color: #4CAF50;
	color: #333; /* 어두운 글씨 */
}

</style>

<div class="big-outer-box">
	<div class="small-outer-box">
		<!-- FAQ 검색창 및 버튼 -->
		<div class="search-container">
			<form class="form-box" action="../FAQ/search" method="POST">
				<input name="searchKeyword" type="text" id="faq-search" class="search-input" placeholder="FAQ 검색">
				<button type="button" onclick="searchFAQ()" class="search-btn">검색</button>
			</form>
		</div>
		<!-- 날씨 SELECT -->

		<div class="content-box">
			<div class="area-outer-box">
				<!-- 지역 select 박스 -->
				<div class="area-select-box mt-4">
					<select id="region-select" class="search-input" onchange="fetchWeather(); handleRegionChange();">
						<option value="Daejeon" selected>대전</option>
						<option value="Seoul">서울</option>
						<option value="Busan">부산</option>
						<option value="Los Angeles">로스앤젤레스</option>
						<option value="Paris">파리</option>
						<option value="Bangkok">방콕</option>
						<option value="Tokyo">도쿄</option>
						<option value="Moscow">모스크바</option>
						<option value="Madrid">마드리드</option>
						<option value="Paris">파리</option>
					</select>
				</div>
			</div>
			<div class="weather-outer-box">
				<div class="weather-small-outer-box">
					<!-- 날씨 정보 표시 요소 -->
					<div id="weather-info" class="weather-info mt-4 text-center">
						<p id="city"></p>
						<p id="temperature"></p>
						<p id="humidity" style="font-size: 14px;"></p>      
               			<p id="wind-speed" style="font-size: 14px;"></p>
						<p id="description"></p>
					</div>
				</div>
			</div>
		</div>
		<div class="tour-spot-box" id="tour-spot-box">
			<div class="tour-spot-small-box">
				<table class="tour-info-table">
					<thead>
						<tr>
							<th>구분</th>
							<th>명소 이름</th>
							<th>소재지</th>
							<th>전화번호</th>
							<th>부서 전화번호</th>
						</tr>
					</thead>
					<tbody>
						<!-- 첫 번째 행 -->
						<c:forEach var="touristDestination" items="${touristDestination }">
				<tr>
					<td>${touristDestination.division }</td>
					<td>${touristDestination.placename }</td>
					<td>${touristDestination.location }</td>
					<td>${touristDestination.phoneNumber }</td>
					<td>${touristDestination.departmentphoneNumber }</td>
				</tr>
			</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>
</div>

<script>
	function handleRegionChange() {
		var selectedRegion = document.getElementById("region-select").value;
		var tourSpotBox = document.getElementById("tour-spot-box");

		// "대전"이 선택되었을 때만 tour-spot-box를 보여줌
		if (selectedRegion === "Daejeon") {
			tourSpotBox.style.display = "flex"; // 관광지 목록 보이기
		} else {
			tourSpotBox.style.display = "none"; // 관광지 목록 숨기기
		}
	}

	// 페이지 로드 시 초기 상태 확인
	document.addEventListener('DOMContentLoaded', handleRegionChange);
</script>

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
function fetchWeather() {
    var city = document.getElementById('region-select').value;
    var apiKey = "4aeb4c84293bc9b4109638849c3b309c";
    var lang = "kr";
    var apiUrl = "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=" + apiKey + "&lang=" + lang + "&units=metric";

    fetch(apiUrl)
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            console.log(data); // 데이터를 콘솔에 출력합니다.

            // 받아온 데이터를 HTML에 삽입합니다.
            document.getElementById('city').textContent = data.name;
            document.getElementById('temperature').textContent = "온도: " +data.main.temp + "°C";
            document.getElementById('description').textContent = "설명: " +data.weather[0].description;
            document.getElementById('humidity').textContent = "습도: " + data.main.humidity + "%"; // 습도 추가
            document.getElementById('wind-speed').textContent = "풍속: " + data.wind.speed + " m/s"; // 풍속 추가
        })
        .catch(function(error) {
            console.error('Error:', error);
        });
}


    // 페이지 로드 시 날씨 데이터를 가져옵니다.
    window.onload = fetchWeather;
</script>
