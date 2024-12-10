# 🛍️ 옷 쇼핑몰 프로젝트 (DRESS MALL)

### **📜 프로젝트 개요**
- Spring Boot를 기반으로 **MySQL**과 **MyBatis**를 활용한 구현된 옷 쇼핑몰 웹사이트 제작.
- 프로젝트 기간 : 2024/11/18 - 2024/12/05
<br>

## **✨ 주요 기능**

### 🛒 사용자 기능
- 🔑 **회원가입 및 로그인** : 개인 계정을 통해 개인화된 쇼핑 경험 제공.
- 🔍 **상품 검색** : 카테고리별로 상품을 손쉽게 검색.
- 🛍️ **장바구니** : 장바구니에 상품을 담고, 원하는 상품만 선택하여 결제.
- 🧾 **주문내역 관리** : 관리자가 배송처리를 하기 전 주문취소가 가능하고, 제품이 정상적으로 도착했을 때 구매확정처리 가능.
- 📜 **리뷰 작성** : 상품을 사용해본 후 리뷰작성이 가능하며 해당 리뷰는 상품상세정보페이지에 노출.
- 📊 **인기 상품** : 누적 주문수량이 가장 많은 상품을 메인페이지 상단에 노출.
  
### 🛠️ 관리자 기능
- 📝 **상품 관리** : 상품 등록(이미지는 대표이미지만 등록가능), 수정, 삭제 기능 제공.
- 📦 **주문 관리** : 사용자 주문 확인 가능, 배송처리로 등록가능.
- 📊 **카테고리 관리** : 카테고리 등록, 삭제 기능 제공.
- 👤 **회원 관리** : 모든 회원 리스트 확인 가능.
- 👨‍💼 **스태프 관리** : 모든 스태프 리스트 확인 가능.
<br>

## 🛠️ 사용 기술

| **분류**       | **기술 및 도구**                                |
|-----------------|-----------------------------------------------|
| 🌐 **백엔드**   | ![Java](https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=java&logoColor=white) ![Spring Boot](https://img.shields.io/badge/Spring%20Boot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white) ![MyBatis](https://img.shields.io/badge/MyBatis-000000?style=for-the-badge&logo=&logoColor=white) ![Apache Tomcat](https://img.shields.io/badge/Tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black) |
| 🎨 **프론트엔드** | ![HTML](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white) ![CSS](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white) ![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black) ![jQuery](https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white) ![Bootstrap](https://img.shields.io/badge/Bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white) |
| 📜 **템플릿 엔진** | ![JSTL](https://img.shields.io/badge/JSTL-007396?style=for-the-badge&logoColor=white) |
| 💾 **데이터베이스** | ![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white) ![MySQL Workbench](https://img.shields.io/badge/MySQL%20Workbench-4479A1?style=for-the-badge&logo=mysql&logoColor=white) |
| 🤝 **협업 및 디자인** | ![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white) ![Figma](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white) |
| 🔧 **개발 도구**   | ![STS](https://img.shields.io/badge/Spring%20Tool%20Suite-6DB33F?style=for-the-badge&logo=spring&logoColor=white) |
<br>

## 💾 데이터베이스 구조
<img width="660" alt="image" src="https://github.com/user-attachments/assets/dbf8ba82-ca80-47d8-9438-15af677e8d1b">
<br><br>

## **🚀 프로젝트 실행 방법**
1. **데이터베이스 설정**  
 - 프로젝트에서 databaseFile 폴더를 찾아 폴더 내에 있는 쿼리문을 MySQL에서 실행시켜 데이터베이스를 구축.

2. **프로젝트 실행**  
 - Spring Tool Suite에서 프로젝트를 실행. 
 - 브라우저에서 `http://localhost/dressmall/off/customer/main`으로 접속.
<br>


## **📌 추가 정보**
- 이 프로젝트는 학습 및 포트폴리오 목적으로 제작되었으며, 무단으로 상업적 이용을 금합니다.
<br>
