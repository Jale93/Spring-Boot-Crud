<%@page import="insurance.model.Department"%>
<%@page import="insurance.service.DepartmentService"%>
<%@page import="insurance.model.Company"%>
<%@page import="insurance.service.CompanyService"%>
<%@page import="insurance.SpringUtil"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<div class="row">
    <div class="col-md-4 col-md-offset-4">
      <form class="form-horizontal" role="form" action="save-department" method="POST">
        <fieldset>
		<input type="hidden" name="id" value="${department.id}">
          <!-- Form Name -->
          <legend>Department Details</legend>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Title</label>
            <div class="col-sm-10">
              <input type="text" placeholder="Title" class="form-control" name="title" value="${department.title}">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
	            <label class="col-sm-2 control-label" for="textinput">Description</label>
	            <div class="col-sm-10">
	              <textarea  placeholder="Description" class="form-control" name="description" >${department.description}</textarea>
	            </div>
           </div>
           <div class="form-group">
				<label class="col-sm-2 control-label" for="textinput">Company</label>
				<%
				   ApplicationContext ctx = SpringUtil.getApplicationContext();
				   CompanyService cs = (CompanyService) ctx.getBean(CompanyService.class);
				   DepartmentService ds = (DepartmentService) ctx.getBean(DepartmentService.class);
				   Department dep = ds.getDepartmentById(Long.parseLong(request.getParameter("id")));
				%>
				<div class="col-sm-10">
					<select class="form-control" id="companyId" name="company">
					<% for(Company c: cs.getAllCompanies()){ %>
						<option value="<%=c.getId()%>"  <%=c.getId().equals(dep.getCompany().getId()) ? "selected='selected'" : ""%>><%=c.getTitle() %></option>
						<% } %>
					</select>
				</div>
		  </div>
          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Active</label>
            <div class="col-sm-4">
              <input type="checkbox" class="form-control" name="isActive" value="${department.isActive}" onchange="($(this).prop('checked') ? $(this).val(1) : $(this).val(0))" ${department.isActive == 1 ? 'checked' : ''}>
            </div>
          </div>

          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="pull-right">
                <button type="button" class="btn btn-default">Cancel</button>
                <button type="submit" class="btn btn-primary">Save</button>
              </div>
            </div>
          </div>

        </fieldset>
      </form>
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->