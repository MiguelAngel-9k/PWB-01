

const getSubmit = document.getElementsByName("register-box");
const submitBtn = document.getElementById('submitInfo');
const loginBox = document.eg
const iconImages = [
    
    'UserIcon/Icons/png/001-scientist.png',
    'UserIcon/Icons/png/002-werewolf.png',
    'UserIcon/Icons/png/003-pumpkin.png' 

    ];

var flag = false;

function mailVal (email){
    if(/^\w+([\.-]?\w+)*@(?:|hotmail|outlook|yahoo|live|gmail)\.(?:|com|es)+$/.test(email.value)){
        flag = true;
        email.style.backgroundColor = `transparent`;
        return;
    }

    else{
        alert('Email incorrecto');
        email.style.backgroundColor = `red`;
        email.value = null;
        flag = false;
       // getSubmit['Email'].style.backgroundColor = `red`;
    }
};

function completeNameVal (name, lastName){
    if(/^[A-Za-z\s]+$/.test(name.value) & /^[A-Za-z\s]+$/.test(lastName.value)){
        flag = true;
        name.style.color = `transparent`;
        lastName.style.color = `transparent`;
        return;
    }
    else{
        name.style.backgroundColor = `red`;
        lastName.style.backgroundColor = `red`;        
        flag = false;
    }
};

function userNameVal(userName){
    if(userName.value.length <= 3){
        userName.style.backgroundColor = `red`;
    }else{
        userName.style.backgroundColor=`transparent`;
    }
};

function passwordVal(password){
    if(/^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$/.test(password.value)){
        flag = true;
        password.style.borderColor = `white`;
        return;
    }else{
        password.style.borderColor = `red`;
        flag = true;
    }
};

submitBtn.addEventListener('click',function submit(event){
    event.preventDefault();
    const email = document.getElementById("Email");
    const name = document.getElementById("Name");
    const lastName = document.getElementById("last-name");
    const userName = document.getElementById("user-name");
    const password = document.getElementById("password");
    let avatarImage = null;
    mailVal(email);
    completeNameVal(name, lastName);
    userNameVal(userName);
	passwordVal(password);
    if(flag == true){
        document.getElementById("login-box").innerHTML = `
            <h1 style="color: white;">Imagen de perfil</h1>
            <div class="image-picker" id="image-picker">
                <img id="image-1" src="${iconImages[0]}">      
                <button id="scientist" value="Choose" class="btn btn-danger">Choose</button>
            </div>
            <div class="image-picker" id="image-picker">
                <img id="image-2" src="${iconImages[1]}">                
                <button id="werewolf" value="Choose" class="btn btn-danger">Choose</button>
            </div>
            <div class="image-picker" id="image-picker">
                <img id="image-3" src="${iconImages[2]}">                
                <button id="pumpik" value="Choose" class="btn btn-danger">Choose</button>
            </div>
            `;

        document.getElementById("scientist").addEventListener('click', function imagePick(){
            avatar = iconImages[0];
            alert('Uested escogio: ' + avatar);
        });
        document.getElementById("werewolf").addEventListener('click', function imagePick(){
            avatar = iconImages[1];
            alert('Uested escogio: ' + avatar);
        });
        document.getElementById("pumpik").addEventListener('click', function imagePick(){
            avatar = iconImages[2];
            alert('Uested escogio: ' + avatar);
        });
    };
});
