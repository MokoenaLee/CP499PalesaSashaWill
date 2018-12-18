 $('document').ready(function () {
   if(document.getElementById("ic") != null){
    console.log("EHRER")
    var iclass_field = document.getElementById("ic").getElementsByTagName("input")[0];
    console.log(iclass_field == null);
    let timeout;
    iclass_field.addEventListener("input", () => {
    clearTimeout(timeout);
      timeout = setTimeout(() => populate_fields(iclass_field), 500);
    });

        function populate_fields(iclass) {
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
});
