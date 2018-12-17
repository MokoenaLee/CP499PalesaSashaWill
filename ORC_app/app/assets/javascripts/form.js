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

      function update_form(data){
        var data = JSON.parse(data);
        console.log("BLAH", data)
        document.getElementById("fn").getElementsByTagName("input")[0].value = data.first_name;
        document.getElementById("ln").getElementsByTagName("input")[0].value = data.last_name;
        document.getElementById("em").getElementsByTagName("input")[0].value = data.email_address;

      }



        // console.log(studIC);
        // // $.ajax({
        //     type: "POST",
        //     url:  "rentals/get_info_from_iclass" ,
        //     data: {
        //         studIC: studIC
        //     },
        //     success: function(data) {
        //         alert('success');
        //     },
        //     error: function(data) {
        //         alert("Fail");
        //     }

//         $.post("/rentals/:rental_id/rentals/get_info_from_iclass", {iclass: studIC}, function(data){alert("BLAH")});
//
}
});

//
//
//
//
      // }
    //   $.ajax({
    //     type: 'GET',
    //     data: {data: temp},
    //     url: url,
    //     success: function(data){
    //     someOtherFunc(data.leader);
    //   }
    //   });
    // }
    // function someOtherFunc(blah) {
    //   console.log(data.leader);
    //
    // }
// $('document').ready(function(){
//
//   var iclass_field = document.getElementById("ic").getElementsByTagName("input")[0];
//   iclass_field.addEventListener("keypress", ignoreReturn());
//
//
//   function ignoreReturn(){
//     iclass_field.onkeypress = function(e){
//     var key = e.charCode || e.keyCode || 0;
//     if(key == 13){
//       e.preventDefault;
//     }
//     populateFields(iclass_field)
//     }
//   }
//
//   function populateFields(iclass){
//     var temp = iclass.value;
//     var studIC = parseInt(temp);
//     $.get("rentals/get_info_from_iclass", {studIC : studIC}, function (data) {
//         alert('Success');
//     });
//
//     // var actrec = get_info_from_iclass(studIC);
//      // document.getElementById("fn").getElementsByTagName("input")[0].value = actrec.first_name;
//      // document.getElementById("ln").getElementsByTagName("input")[0].value = actrec.last_name;
//      // document.getElementById("em").getElementsByTagName("input")[0].value = actrec.email_address;
//    };
// });
