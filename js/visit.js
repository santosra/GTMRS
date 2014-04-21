$(document).ready(function() {

    var fields = 1;

    $("#addButton").click(function(e) {
        e.preventDefault();

        if ($("#medName" + fields).val() == "") {
            $("#medName" + fields).focus();
            return;
        }

        if ($("#dosage" + fields).val() == "") {
            $("#dosage" + fields).focus();
            return;
        }

        if ($("#monthDuration" + fields).val() == "") {
            $("#monthDuration" + fields).focus();
            return;
        }

        if ($("#dayDuration" + fields).val() == "") {
            $("#dayDuration" + fields).focus();
            return;
        }

        $("#medName" + fields).attr("readonly", true);
        $("#dosage" + fields).attr("readonly", true);
        $("#monthDuration" + fields).attr("readonly", true);
        $("#dayDuration" + fields).attr("readonly", true);
        $("#notes" + fields).attr("readonly", true);

        var row = '<div id="medicineDiv' + (fields + 1) + '">\
                            <div class="pure-control-group">\
                                <label for="medName' + (fields + 1) + '">Medicine Name</label>\
                                <input id="medName' + (fields + 1) + '" type="text" required>\
                            </div>\
                            <div class="pure-control-group">\
                                <label for="dosage' + (fields + 1) + '">Dosage</label>\
                                <input id="dosage' + (fields + 1) + '" type="number" min="1" max="10" required> per day\
                            </div>\
                            <div class="pure-control-group">\
                                <label for="monthDuration' + (fields + 1) + '">Duration</label>\
                                <input id="monthDuration' + (fields + 1) + '" type="number" min="0" max="30" required> months\
                                <input id="dayDuration' + (fields + 1) + '" type="number" min="1" max="30" required> days\
                            </div>\
                            <div class="pure-control-group">\
                                <label for="notes' + (fields + 1) + '">Notes</label>\
                                <input id="notes' + (fields + 1) + '" type="text">\
                            </div>\
                            <div class="pure-control-group" id="buttonLocation' + (fields + 1) + '">\
                                <label></label>\
                            </div>\
                        </div>';

        $("#medicineDiv" + fields).after(row);

        $("#removeButton").detach().appendTo('#buttonLocation' + (fields + 1) + '');
        $("#addButton").detach().appendTo('#buttonLocation' + (fields + 1) + '');

        fields = fields + 1;

        if (fields > 1) {
            $("#removeButton").attr("hidden", false);
        } else {
            $("#removeButton").attr("hidden", true);
        }

        $("#medName" + fields).focus();

    });

    $("#removeButton").click(function(e) {
        e.preventDefault();

        $("#removeButton").detach().appendTo('#buttonLocation' + (fields - 1) + '');
        $("#addButton").detach().appendTo('#buttonLocation' + (fields - 1) + '');

        $("#medicineDiv" + fields).remove();

        fields = fields - 1;

        $("#medName" + fields).attr("readonly", false);
        $("#dosage" + fields).attr("readonly", false);
        $("#monthDuration" + fields).attr("readonly", false);
        $("#dayDuration" + fields).attr("readonly", false);
        $("#notes" + fields).attr("readonly", false);

        if (fields > 1) {
            $("#removeButton").attr("hidden", false);
        } else {
            $("#removeButton").attr("hidden", true);
        }

        $("#medName" + fields).focus();

    });

});
