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

        if ($("#consultingDoctor" + fields).val() == "") {
            $("#consultingDoctor" + fields).focus();
            return;
        }

        if ($("#date" + fields).val() == "") {
            $("#date" + fields).focus();
            return;
        }

        $("#medName" + fields).attr("readonly", true);
        $("#dosage" + fields).attr("readonly", true);
        $("#monthDuration" + fields).attr("readonly", true);
        $("#dayDuration" + fields).attr("readonly", true);
        $("#consultingDoctor" + fields).attr("readonly", true);
        $("#date" + fields).attr("readonly", true);

        var row = '<div id="medicineDiv' + (fields + 1) + '">\
                            <div class="pure-control-group">\
                                <label for="medName' + (fields + 1) + '">Medicine Name</label>\
                                <input name="medName' + (fields + 1) + '" id="medName' + (fields + 1) + '" type="text" required>\
                            </div>\
                            <div class="pure-control-group">\
                                <label for="dosage' + (fields + 1) + '">Dosage</label>\
                                <input name="dosage' + (fields + 1) + '" id="dosage' + (fields + 1) + '" type="number" min="1" max="10" required> per day\
                            </div>\
                            <div class="pure-control-group">\
                                <label for="monthDuration' + (fields + 1) + '">Duration</label>\
                                <input name="monthDuration' + (fields + 1) + '" id="monthDuration' + (fields + 1) + '" type="number" min="0" max="30" required> months\
                                <input name="dayDuration' + (fields + 1) + '" id="dayDuration' + (fields + 1) + '" type="number" min="1" max="30" required> days\
                            </div>\
                            <div class="pure-control-group">\
                                <label for="consultingDoctor' + (fields + 1) + '">Consulting Doctor</label>\
                                <input name="consultingDoctor' + (fields + 1) + '" id="consultingDoctor' + (fields + 1) + '" type="text" required>\
                            </div>\
                            <div class="pure-control-group">\
                                <label for="date' + (fields + 1) + '">Date of Prescription</label>\
                                <input name="date' + (fields + 1) + '" id="date' + (fields + 1) + '" type="date" required>\
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
        $("#consultingDoctor" + fields).attr("readonly", false);
        $("#date" + fields).attr("readonly", false);

        if (fields > 1) {
            $("#removeButton").attr("hidden", false);
        } else {
            $("#removeButton").attr("hidden", true);
        }

        $("#medName" + fields).focus();

    });

});
