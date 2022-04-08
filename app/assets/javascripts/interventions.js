$(function() {
    if ($("select#customer").val() == "") {
        $("select#building option").remove();
        $("select#battery option").remove();
        $("select#column option").remove();
        $("select#elevator option").remove();
        $("select#building").hide();
        $("select#battery").hide();
        $("select#column").hide();
        $("select#elevator").hide();
        var buildingDefault = "<option value=\"" + "" + "\">" + "Building" + "</option>";
        var batteryDefault = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
        var columnDefault = "<option value=\"" + "" + "\">" + "Column" + "</option>";
        var elevatorDefault = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
        $(buildingDefault).appendTo("select#building");
        $(batteryDefault).appendTo("select#battery");
        $(columnDefault).appendTo("select#column");
        $(elevatorDefault).appendTo("select#elevator");
    }

    $("select#customer").change(function() {
     var id_value_string = $(this).val();
     if (id_value_string == "") {
      $("select#building option").remove();
      $("select#battery option").remove();
      $("select#column option").remove();
      $("select#elevator option").remove();
      $("select#building").hide();
      $("select#battery").hide();
      $("select#column").hide();
      $("select#elevator").hide();
      var buildingDefault = "<option value=\"" + "" + "\">" + "Building" + "</option>";
      var batteryDefault = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
      var columnDefault = "<option value=\"" + "" + "\">" + "Column" + "</option>";
      var elevatorDefault = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
      $(buildingDefault).appendTo("select#building");
      $(batteryDefault).appendTo("select#battery");
      $(columnDefault).appendTo("select#column");
      $(elevatorDefault).appendTo("select#elevator");
     } else {
      // Send the request and update building dropdown
      $.ajax({
       dataType: "json",
       cache: false,
       url: '/get_buildings_by_customer/' + id_value_string,
       timeout: 5000,
       error: function(XMLHttpRequest, errorTextStatus, error) {
        alert("Failed to submit : " + errorTextStatus + " ;" + error);
       },

       success: function(data) {
        // Clear all options from building select
      $("select#building option").remove();
      $("select#battery option").remove();
      $("select#column option").remove();
      $("select#elevator option").remove();
      var buildingDefault = "<option value=\"" + "" + "\">" + "Building" + "</option>";
      var batteryDefault = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
      var columnDefault = "<option value=\"" + "" + "\">" + "Column" + "</option>";
      var elevatorDefault = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
      $(buildingDefault).appendTo("select#building");
      $(batteryDefault).appendTo("select#battery");
      $(columnDefault).appendTo("select#column");
      $(elevatorDefault).appendTo("select#elevator")
      $("select#building").show();;
      
        // Fill building select
        $.each(data, function(i, j) {
         row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
         $(row).appendTo("select#building");
        });
       }
      });
     }
    });

    if ($("select#building").val() == "") {
      $("select#battery option").remove();
      $("select#column option").remove();
      $("select#elevator option").remove();
      $("select#battery").hide();
      $("select#column").hide();
      $("select#elevator").hide();
      var batteryDefault = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
      var columnDefault = "<option value=\"" + "" + "\">" + "Column" + "</option>";
      var elevatorDefault = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
      $(batteryDefault).appendTo("select#battery");
      $(columnDefault).appendTo("select#column");
      $(elevatorDefault).appendTo("select#elevator");
       }

       $("select#building").change(function() {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
          $("select#battery option").remove();
          $("select#column option").remove();
          $("select#elevator option").remove();
          $("select#battery").hide();
          $("select#column").hide();
          $("select#elevator").hide();
          var batteryDefault = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
          var columnDefault = "<option value=\"" + "" + "\">" + "Column" + "</option>";
          var elevatorDefault = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
          $(batteryDefault).appendTo("select#battery");
          $(columnDefault).appendTo("select#column");
          $(elevatorDefault).appendTo("select#elevator");
        } else {
         // Send the request and update battery dropdown
         $.ajax({
          dataType: "json",
          cache: false,
          url: '/get_batteries_by_building/' + id_value_string,
          timeout: 5000,
          error: function(XMLHttpRequest, errorTextStatus, error) {
           alert("Failed to submit : " + errorTextStatus + " ;" + error);
          },

          success: function(data) {
           // Clear all options from battery select
           $("select#battery option").remove();
        $("select#column option").remove();
        $("select#elevator option").remove();
        var batteryDefault = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
        var columnDefault = "<option value=\"" + "" + "\">" + "Column" + "</option>";
        var elevatorDefault = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
        $(batteryDefault).appendTo("select#battery");
        $(columnDefault).appendTo("select#column");
        $(elevatorDefault).appendTo("select#elevator");
        $("select#battery").show();
           // Fill battery select
           $.each(data, function(i, j) {
            row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
            $(row).appendTo("select#battery");
           });
          }
         });
        }
       });

       if ($("select#battery").val() == "") {
        $("select#column option").remove();
        $("select#elevator option").remove();
        $("select#column").hide();
        $("select#elevator").hide();
      var columnDefault = "<option value=\"" + "" + "\">" + "Column" + "</option>";
      var elevatorDefault = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
      $(columnDefault).appendTo("select#column");
      $(elevatorDefault).appendTo("select#elevator");
       }

       $("select#battery").change(function() {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
          $("select#column option").remove();
          $("select#elevator option").remove();
          $("select#column").hide();
          $("select#elevator").hide();
          var columnDefault = "<option value=\"" + "" + "\">" + "Column" + "</option>";
          var elevatorDefault = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
          $(columnDefault).appendTo("select#column");
          $(elevatorDefault).appendTo("select#elevator");
        } else {
         // Send the request and update column dropdown
         $.ajax({
          dataType: "json",
          cache: false,
          url: '/get_columns_by_battery/' + id_value_string,
          timeout: 5000,
          error: function(XMLHttpRequest, errorTextStatus, error) {
           alert("Failed to submit : " + errorTextStatus + " ;" + error);
          },
          
          success: function(data) {
           // Clear all options from column select
           $("select#column option").remove();
           $("select#elevator option").remove();
         var columnDefault = "<option value=\"" + "" + "\">" + "Column" + "</option>";
         var elevatorDefault = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
         $(columnDefault).appendTo("select#column");
         $(elevatorDefault).appendTo("select#elevator");
         $("select#column").show();
           // Fill column select
           $.each(data, function(i, j) {
            row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
            $(row).appendTo("select#column");
           });
          }
         });
        }
       });

       if ($("select#column").val() == "") {
        $("select#elevator option").remove();
        $("select#elevator").hide();
        var row = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
        $(row).appendTo("select#elevator");
       }
       
       $("select#column").change(function() {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
         $("select#elevator option").remove();
         $("select#elevator").hide();
         var row = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
         $(row).appendTo("select#elevator");
        } else {
         // Send the request and update elevator dropdown
         $.ajax({
          dataType: "json",
          cache: false,
          url: '/get_elevators_by_column/' + id_value_string,
          timeout: 5000,
          error: function(XMLHttpRequest, errorTextStatus, error) {
           alert("Failed to submit : " + errorTextStatus + " ;" + error);
          },

          success: function(data) {
           // Clear all options from elevator select
           $("select#elevator option").remove();
           //put in a empty default line
           var row = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
           $(row).appendTo("select#elevator");
           $("select#elevator").show();
           // Fill elevator select
           $.each(data, function(i, j) {
            row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
            $(row).appendTo("select#elevator");
           });
          }
         });
        }
       });  
 
   });