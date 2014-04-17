$(document).ready(function() {

    var fieldsPatient = 1;
    var fieldsDoctor = 1;

    $("#addButtonPatient").click(function(e) {
        e.preventDefault();

        if ($("#allergy" + fieldsPatient).val() == "") {
            return;
        }

        $("#allergy" + fieldsPatient).attr("readonly", true);

        var row = '<div class="pure-control-group" id ="allergyDiv' + (fieldsPatient + 1) + '"> <label for="allergy' + (fieldsPatient + 1) + '"></label> <input id="allergy' + (fieldsPatient + 1) + '" type="text"> </div>';

        $("#allergyDiv" + fieldsPatient).after(row);

        $("#removeButtonPatient").detach().appendTo('#allergyDiv' + (fieldsPatient + 1) + '');
        $("#addButtonPatient").detach().appendTo('#allergyDiv' + (fieldsPatient + 1) + '');

        fieldsPatient = fieldsPatient + 1;

        if (fieldsPatient > 1) {
            $("#removeButtonPatient").attr("hidden", false);
        } else {
            $("#removeButtonPatient").attr("hidden", true);
        }

        $("#allergy" + fieldsPatient).focus();

    });

    $("#removeButtonPatient").click(function(e) {
        e.preventDefault();

        $("#removeButtonPatient").detach().appendTo('#allergyDiv' + (fieldsPatient - 1) + '');
        $("#addButtonPatient").detach().appendTo('#allergyDiv' + (fieldsPatient - 1) + '');

        $("#allergyDiv" + fieldsPatient).remove();

        fieldsPatient = fieldsPatient - 1;

        $("#allergy" + fieldsPatient).attr("readonly", false);

        if (fieldsPatient > 1) {
            $("#removeButtonPatient").attr("hidden", false);
        } else {
            $("#removeButtonPatient").attr("hidden", true);
        }

        $("#allergy" + fieldsPatient).focus();

    });

    $("#addButtonDoctor").click(function(e) {
        e.preventDefault();

        if ($("#availableDate" + fieldsDoctor).val() == "") {
            return;
        }

        if ($("#availableFrom" + fieldsDoctor).val() == "") {
            return;
        }

        if ($("#availableTo" + fieldsDoctor).val() == "") {
            return;
        }

        $("#availableDate" + fieldsDoctor).attr("readonly", true);
        $("#availableFrom" + fieldsDoctor).attr("readonly", true);
        $("#availableTo" + fieldsDoctor).attr("readonly", true);

        var row = '<div class="pure-control-group" id ="availableDiv' + (fieldsDoctor + 1) + '"> <label for="availableDate' + (fieldsDoctor + 1) + '">Availability</label> <select id="availableDate' + (fieldsDoctor + 1) + '" required> <option></option> <option>Monday</option> <option>Tuesday</option> <option>Wednesday</option> <option>Thursday</option> <option>Friday</option> <option>Saturday</option> <option>Sunday</option> </select> From  <input id="availableFrom' + (fieldsDoctor + 1) + '" type="time" required> To <input id="availableTo' + (fieldsDoctor + 1) + '" type="time" required> </div>';

        $("#availableDiv" + fieldsDoctor).after(row);

        $("#removeButtonDoctor").detach().appendTo('#availableDiv' + (fieldsDoctor + 1) + '');
        $("#addButtonDoctor").detach().appendTo('#availableDiv' + (fieldsDoctor + 1) + '');

        fieldsDoctor = fieldsDoctor + 1;

        if (fieldsDoctor > 1) {
            $("#removeButtonDoctor").attr("hidden", false);
        } else {
            $("#removeButtonDoctor").attr("hidden", true);
        }

        $("#availableDate" + fieldsDoctor).focus();

    });

    $("#removeButtonDoctor").click(function(e) {
        e.preventDefault();

        $("#removeButtonDoctor").detach().appendTo('#availableDiv' + (fieldsDoctor - 1) + '');
        $("#addButtonDoctor").detach().appendTo('#availableDiv' + (fieldsDoctor - 1) + '');

        $("#availableDiv" + fieldsDoctor).remove();

        fieldsDoctor = fieldsDoctor - 1;

        $("#availableDate" + fieldsDoctor).attr("readonly", false);
        $("#availableFrom" + fieldsDoctor).attr("readonly", false);
        $("#availableTo" + fieldsDoctor).attr("readonly", false);

        if (fieldsDoctor > 1) {
            $("#removeButtonDoctor").attr("hidden", false);
        } else {
            $("#removeButtonDoctor").attr("hidden", true);
        }

        $("#availableDate" + fieldsDoctor).focus();

    });

});
