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

    if($('#itemList').length){
        var listOfItems = document.getElementById("itemList").getElementsByTagName("tr");
        for (i=0; i< listOfItems.length; i++){
            listOfItems[i].addEventListener("click", activateItem2);
        }
    }

    function activateItem2(){
        var array_of_info = this.innerText.split("	");
        var gear_type = array_of_info[0];
        var brand = array_of_info[1];
        var model = array_of_info[2];
        var color = array_of_info[3];
        var size = array_of_info[4];
        var serial_number = array_of_info[5];
        var gear_category = array_of_info[6];

        document.getElementById("ItemModalLabel").innerHTML = "Item ID: ";
        document.getElementById("ItemModalBody").innerHTML = "Gear Type: " + gear_type;
        document.getElementById("ItemModalBody2").innerHTML = "Brand: " + brand;
        document.getElementById("ItemModalBody3").innerHTML = "Model: " + model;
        document.getElementById("ItemModalBody4").innerHTML = "Color: " + color;
        document.getElementById("ItemModalBody5").innerHTML = "Size: " + size;
        document.getElementById("ItemModalBody6").innerHTML = "Serial Number: " + serial_number;
        document.getElementById("ItemModalBody7").innerHTML = "Gear Category: " + gear_category;
    }

});
