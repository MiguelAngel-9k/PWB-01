const editInfo = document.getElementById("modify-info");
const email = document.getElementById("email");
const name = document.getElementById("name");
const file = document.getElementById("in-file");
const userName = document.getElementById("user-name");
const editBio = document.getElementById("edit-bio");
const inBio = document.getElementById("in-bio");


const userModify = `
<form action="" method="POST">
<label for="edit-name" style="color: white; margin-top: 20px"
    >Edita name</label
  ><input
    type="text"
    name="edit-name"
    id="edit-name"
    value="${name.innerHTML}"
  /><label for="edit-name" style="color: white; margin-top: 20px"
    >Correo (no-editable)</label
  ><input
  type="text"
    name="edit-email"
    id="edit-email"
    value="${email.innerHTML}"
  /><button id="edit-done" class="btn btn-danger">Done!</button>
  </form>
`;

var flag = false;


editInfo.addEventListener('click', function modify(event){
    event.preventDefault();
    let userContainer = document.getElementById("user-container");
    let editName = document.getElementById("edit-name");
    let editPassword = document.getElementById("password");
    let editUserName = document.getElementById("edit-userName");

    if(flag == false){

	    editName.style.display = "inline";
    	    editPassword.style.display = "inline";
	    editUserName.style.display = "inline";
	    editInfo.innerHTML = 'Done!';
	    flag = true;
    }else{
            name.innerHTML = editName.value;
	    userName.innerHTML = editUserName.value;
	    document.getElementById("user-name-nav").innerHTML = userName.innerHTML;
	    editName.style.display = "none";
	    editPassword.style.display = "none";
	    editBtn.innerHTML = 'Edit';
	    flag = false;
    }
    /*let buffer = userContainer.innerHTML;
    userContainer.innerHTML = "";
    userContainer.innerHTML = userModify;
    document.getElementById('edit-done').addEventListener('click', function(){
	    name.value = document.getElementById('edit-name').value;
	    email.value = document.getElementById('edit-email').value;
	    userContainer.innerHTML = buffer;
    });*/
});

let bioFlag = false;

editBio.addEventListener('click', ()=>{
	if(bioFlag == false){
		const temp = document.getElementById("biography").innerHTML;
		editBio.innerHTML = "Done!";
		document.getElementById("biography").innerHTML = "";
		inBio.style.display = "inline";
		bioFlag = true;
	}else{
		document.getElementById("biography").innerHTML = inBio.value;
		inBio.style.display = "none";
		inBio.value = "";
		bioFlag = false;
	}

});

/*document.getElementById("edit-done").addEventListener('click',function(event){
    event.preventDefault();
    name.value = document.getElementById('edit-name').value;
    email.value = document.getElementById('edit-email').value;
});*/

file.addEventListener('change', function image(){
   const prevFiles = file.files[0];
   const objectURL = URL.createObjectURL(prevFiles);
   document.getElementById("user-icon").src = objectURL;
   document.getElementById("main-user-icon").src = objectURL;
   console.log(file.files);
});
