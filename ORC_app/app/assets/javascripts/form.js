 // $('document').ready(function () {
 $( document ).on('turbolinks:load', function() {
    document.getElementById("dail").style.display = 'none';
    document.getElementById("weekl").style.display = 'none';

   if(document.getElementById("ic") != null){
    var iclass_field = document.getElementById("ic").getElementsByTagName("input")[0];
    let timeout;
    iclass_field.addEventListener("input", () => {
    clearTimeout(timeout);
      timeout = setTimeout(() => populate_user(iclass_field), 500);
    });

        function populate_user(iclass) {
          var temp = iclass.value;
          var studIC = parseInt(temp);
          $.ajax({
            type: "GET",
            url: "rentals/get_info_from_iclass",
            data: {iclass : temp},
            dataType: 'text',
            async: true,
            success: update_form,
            error: function(data) {
                    alert("Fail");
                }
          });
      }
    }
      function update_form(data){
        var data = JSON.parse(data);
        console.log("BLAH", data)
        document.getElementById("fn").getElementsByTagName("input")[0].value = data.first_name;
        document.getElementById("ln").getElementsByTagName("input")[0].value = data.last_name;
        document.getElementById("em").getElementsByTagName("input")[0].value = data.email_address;
      }

      if(document.getElementById("BID") != null){
       var gear_id_field = document.getElementById("BID").getElementsByTagName("input")[0];
       let timeout;
       gear_id_field.addEventListener("input", () => {
       clearTimeout(timeout);
         timeout = setTimeout(() => populate_gear(gear_id_field), 500);
       });

           function populate_gear(gear_id) {
             var temp = gear_id.value.split(".png")[0];
             $.ajax({
               type: "GET",
               url: "rentals/get_info_from_gearid",
               data: {blahID : temp},
               dataType: 'text',
               async: true,
               success: update_gear,
               error: function(data) {
                 document.getElementById("dail").style.display = 'block';
                 document.getElementById("weekl").style.display = 'block';
                 alert("Gear Type not recognized in Price model, Please enter daily and weekly rates manually");
                   }
             });
         }
       }

       function update_gear(data){
         var data = JSON.parse(data);
         document.getElementById("dail").getElementsByTagName("input")[0].value = data.daily;
         document.getElementById("weekl").getElementsByTagName("input")[0].value = data.weekly;

       }

});
