//wait for document to load
$("document").ready(function(){

    if($("#userList").length){
        var listOfUsers = document.getElementById("userList").getElementsByTagName("tr");
        for (i=0; i< listOfUsers.length; i++){
            listOfUsers[i].addEventListener("click", activateItem);
        }
    }

    function activateItem(){
        var first_name = this.childNodes[0].innerHTML;
        var last_name = this.childNodes[1].innerHTML;
        var email_address = this.childNodes[2].innerHTML;
        document.getElementById("ModalLabel").innerHTML = first_name + last_name;
        document.getElementById("ModalBody").innerHTML = email_address;
    }

}):
