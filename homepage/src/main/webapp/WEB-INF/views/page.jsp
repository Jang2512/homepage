<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
   <%
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");   
   %>
      <table class="table table-hover " style="width:70%; margin: auto; margin-bottom: 10%; align:center">
         <thead>
         <br><br>
            <tr>
               <th colspan="5">
                  <h2 align="center">회원자료출력</h2>
               </th>
            </tr>
            <tr>
               <th >글번호</th><th>제목</th><th >작성자</th>   <th >작성일</th><th >조회수</th>
            </tr>
         </thead>
         <tbody class="text-center">
         <c:forEach items="${viewAll }" var="n">
            <tr>
               <td>${n.num }</td>               
               <td>
               <c:forEach begin="1" end="${n.indent}">
                   ≫
               </c:forEach>               
                 <a href="detail?num=${n.num}">
                          ${n.title}
               </a></td>
               <td>${n.writer }</td>
               <td>${n.writeday }</td>
               <td>${n.readcnt }</td>
            </tr>
         </c:forEach>
            <tr>      
               <td colspan="5">
               <c:if test="${paging.startPage != 1 }">
                  <a href="notice?nowPage=${paging.startPage - 3 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
               </c:if>
               <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
                  <c:choose>
                     <c:when test="${p == paging.nowPage }">
                        <b>${p }</b>
                     </c:when>
                     <c:when test="${p != paging.nowPage }">
                        <a href="notice?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
                     </c:when>
                  </c:choose>
               </c:forEach>
               <c:if test="${paging.endPage != paging.lastPage}">
                  <a  href="notice?nowPage=${paging.endPage+3 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
               </c:if>
               </td>
            </tr>
      </tbody>
   </table>
