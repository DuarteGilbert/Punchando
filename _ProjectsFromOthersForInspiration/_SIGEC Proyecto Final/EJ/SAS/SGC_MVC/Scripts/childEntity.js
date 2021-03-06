var tableUrls = "";
function CreateJS(tableID, buttonID, addUrl, fields, tableUrl) {
    tableUrls = tableUrl;
    var dataTable = $('#dataTable').dataTable({
        bProcessing: true,
        "bJQueryUI": true
    });

    $('#' + buttonID).on('click', function () {
        var field = fields.split(",");
        var valid = true;

        for (var item in field) {
            if (!$('#' + field[item]).valid()) {
                valid = false;
            }
        }

        var serializeForm = "{";
        for (var item in field) {
            serializeForm = item+":'"+$('#' + field[item]).val()+"',";
        }
        serializeForm += "}";

        if (valid) {
            $.post(
                addUrl,
                eval(serializeForm)
                , function (data) {
                    alert(data);
                    RefreshTable("#dataTable", tableUrl);
                    $('#responsibleAct').prop('selectedIndex', 0);
                    $('#activity_activity').val('');
                });
        }
        else {
            alert('Debe llenar todos los campos de la actividad a incluir');
        }
    });
}

function RefreshTable(tableId, urlData, controller, editAction, deleteAction) {
    // Retrieve the new data with $.getJSON. You could use it ajax too
    $.getJSON(urlData, null, function (json) {
        table = $(tableId).dataTable();
        oSettings = table.fnSettings();

        table.fnClearTable(this);
        for (var i = 0; i < json.aaData.length; i++) {
            var links =
                '<a href="javascript:void(0);" class="editAction" data-val="/SAS/' + controller + '/' + editAction + '/' + json.aaData[i][2] + '" data-url="/SAS/' + controller + '/' + editAction + '/" >Editar</a> | ' +
                '<a href="javascript:void(0);" class="deleteAction" data-val="/SAS/' + controller + '/' + deleteAction + '/' + json.aaData[i][2] + '" data-url="/SAS/' + controller + '/' + deleteAction + '/" >Eliminar</a>';
            json.aaData[i][2] = links;
            table.oApi._fnAddData(oSettings, json.aaData[i]);
        }

        oSettings.aiDisplay = oSettings.aiDisplayMaster.slice();
        table.fnDraw();

        $('.editAction').on('click', function (evt) {
            evt.preventDefault();
            $('#actionModalUrl').val($(this).data('url'));
            $.get(
                $(this).data('val'),
                function (data) {
                    $('#modalPanel').html(data);
                    $('#modalPanel').dialog("open");
                }
            );

        });

        $('.deleteAction').on('click', function (evt) {
            evt.preventDefault();
            if (confirm('¿Esta seguro de eliminar esta tarea?')) {
                $.post(
                    $(this).data('val'),
                    function (data) {
                        alert(data);
                        RefreshTable("#dataTable", $('#partialUrl').val());
                    }
                );
            }
        });
    });
}

$('.editAction').on('click', function (evt) {
    evt.preventDefault();
    $('#actionModalUrl').val($(this).data('url'));
    $.get(
        $(this).data('val'),
        function (data) {
            $('#modalPanel').html(data);
            $('#modalPanel').dialog("open");
        }
    );
});

$('.deleteAction').on('click', function (evt) {
    evt.preventDefault();
    if (confirm('¿Esta seguro de eliminar este registro?')) {
        $.post(
            $(this).data('val'),
            function (data) {
                alert(data);
                RefreshTable("#dataTable", tableUrls);
            }
        );
    }
});