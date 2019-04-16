  <div class="row">
    <div class="col-md-4 col-md-offset-4">
      <form class="form-horizontal" role="form" action="save-company" method="POST">
        <fieldset>
		<input type="hidden" name="id" value="${company.id}">
          <!-- Form Name -->
          <legend>Company Details</legend>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Title</label>
            <div class="col-sm-10">
              <input type="text" placeholder="Title" class="form-control" name="title" value="${company.title}">
            </div>
          </div>

          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Description</label>
            <div class="col-sm-10">
              <textarea  placeholder="Description" class="form-control" name="description" >${company.description}</textarea>
            </div>
          </div>
          <!-- Text input-->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="textinput">Active</label>
            <div class="col-sm-4">
              <input type="checkbox" class="form-control" name="isActive" value="${company.isActive}" onchange="($(this).prop('checked') ? $(this).val(1) : $(this).val(0))" ${company.isActive == 1 ? 'checked' : ''}/>
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