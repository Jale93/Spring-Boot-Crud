

    <!-- Modal -->
    <div id="add_project" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header login-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h4 class="modal-title">Add Project</h4>
                </div>
                <div class="modal-body">
                            <input type="text" placeholder="Project Title" name="name">
                            <input type="text" placeholder="Post of Post" name="mail">
                            <input type="text" placeholder="Author" name="passsword">
                            <textarea placeholder="Desicrption"></textarea>
                    </div>
                <div class="modal-footer">
                    <button type="button" class="cancel" data-dismiss="modal">Close</button>
                    <button type="button" class="add-project" data-dismiss="modal">Save</button>
                </div>
            </div>

        </div>
    </div>
</body>
<script>
$('#example thead tr:eq(1) th').each( function () {
    var title = $('#example thead tr:eq(0) th').eq( $(this).index() ).text();
    if(title !='OPERATION')
    $(this).html( '<input type="text" placeholder="'+title+'" />' );
} );
var table = $('#example').DataTable({
    orderCellsTop: true,
    order: [],
    columnDefs: [{ orderable: false, targets: [0]}],
    
});

$('#example').show();
// Apply the search
table.columns().every(function (index) {
    $('#example thead tr:eq(1) th:eq(' + index + ') input').on('keyup change', function () {
        table.column($(this).parent().index() + ':visible')
            .search(this.value)
            .draw();
    });
});
$("[name=example_length]").append('<option value="500">500</option>').append('<option value="1000">1000</option>');
</script>
</html>
