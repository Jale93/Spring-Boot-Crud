<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
	<table id="example" class="display" style="width:100%;display: none;" border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>TITLE</th>
                <th>DESCRIPTION</th>
                <th>CREATION DATE</th>
                <th>ACTIVE</th>
                <th>OPERATION</th>
            </tr>
        </thead>
        <thead>
            <tr>
              	<th>ID</th>
                <th>TITLE</th>
                <th>DESCRIPTION</th>
                <th>CREATION DATE</th>
                <th>ACTIVE</th>
                <th>OPERATION</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="company" items="${companies}">
            <tr>
                <td>${company.id}</td>
                <td>${company.title}</td>
                <td>${company.description}</td>
                <td><fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss" value="${company.creationDate}"/> </td>
                <td><c:choose>
					  <c:when test="${company.isActive == 1}">
					    Active
					  </c:when>
		   			  <c:otherwise>
					  Deactive
					  </c:otherwise>
				  </c:choose>
			  	</td>
                <td><a href="delete-company?id=${company.id}"><span class="glyphicon glyphicon-trash"></span></a>
                <a href="update-company?id=${company.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
            </tr>
          </c:forEach>
        </tbody>
    </table>
        <!-- Modal -->
    <form action="save-company" method="POST" id="frm_company">
	    <div id="add_company" class="modal fade" role="dialog">
	        <div class="modal-dialog">
	            <!-- Modal content-->
	            <div class="modal-content">
	                <div class="modal-header login-header">
	                    <button type="button" class="close" data-dismiss="modal">×</button>
	                    <h4 class="modal-title">Add Company</h4>
	                </div>
	                <div class="modal-body">
	                     <input type="text" placeholder="Company Title" name="title" id="title">
	                     <textarea placeholder="Desicrption"  name="description" id="description"></textarea>
	                     Active <input type="checkbox" id="isActive" class="isActiveChc" name="isActive" value="0" onchange="($(this).prop('checked') ? $(this).val(1) : $(this).val(0))">
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="cancel" data-dismiss="modal">Close</button>
	                    <button type="submit" class="add-project"  name="save">Save</button>
	                </div>
	            </div>
	
	        </div>
	    </div>
    </form>
</div>
