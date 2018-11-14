<script src="${request.contextPath}/static/js/jquery-1.11.1.min.js"></script>
<link href="${request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
    .pageDetail {
        display: none;
    }

    .show {
        display: table-row;
    }
</style>
<script>
    $(function () {
        $('#list').click(function () {
            $('.pageDetail').toggleClass('show');
        });
    });

</script>