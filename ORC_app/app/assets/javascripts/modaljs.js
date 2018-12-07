//wait for document to load
$('document').ready(function(){

    if($('#userList').length){
        var listOfUsers = document.getElementById("userList").getElementsByTagName("tr");
        for (i=0; i< listOfUsers.length; i++){
            listOfUsers[i].addEventListener("click", activateItem);
        }
    }

    function activateItem(){
        var array_of_info = this.innerText.split("	");
        var first_name = array_of_info[0];
        var last_name = array_of_info[1];
        var email_address = array_of_info[2];
        var student_ID = array_of_info[3];
        var phone_number = array_of_info[4];
        document.getElementById("ModalLabel").innerHTML = first_name + " " + last_name;
        document.getElementById("ModalBody").innerHTML = "Email: " + email_address;
        document.getElementById("ModalBody2").innerHTML = "Student_ID: " + student_ID;
        document.getElementById("ModalBody3").innerHTML = "Phone Number: " + phone_number;
    }

});
