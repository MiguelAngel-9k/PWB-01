class user {
  constructor(
    _name,
    _lastName,
    _userName,
    _email,
    _password,
    _socialMedia,
  ) {
    this.name = _name.value;
    this.lastName = _lastName.value;
    this.email = _email.value;
    this.password = _password.value;
    this.socialMedia = _socialMedia;
    this.avatar = "UserIcon/letra-r.png";
  }

  static validateUserInfo(
    _name,
    _lastName,
    _userName,
    _email,
    _password,
    _socialMedia,
  ) {
    if (
      /^\w+([\.-]?\w+)*@(?:|hotmail|outlook|yahoo|live|gmail)\.(?:|com|es)+$/.test(
        _email.value
      )
    ) {
      this.flag = true;
      _email.style.backgroundColor = `transparent`;
    } else {
      email.style.backgroundColor = `red`;
      email.value = null;
      this.flag = false;
      return;
      // getSubmit['Email'].style.backgroundColor = `red`;
    }

    if (
      /^[A-Za-z\s]+$/.test(_name.value) & /^[A-Za-z\s]+$/.test(_lastName.value)
    ) {
      this.flag = true;
      _name.style.color = `transparent`;
      _lastName.style.color = `transparent`;
    } else {
      _name.style.backgroundColor = `red`;
      lastName.style.backgroundColor = `red`;
      _this.flag = false;
      return;
    }

    if (_userName.value.length <= 3) {
      _userName.style.backgroundColor = `red`;
      this.flag = false;
      return;
    } else {
      _userName.style.backgroundColor = `transparent`;
      this.flag = true;
    }

    if (/^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$/.test(_password.value)) {
      this.flag = true;
      _password.style.borderColor = `white`;
      return;
    } else {
      _password.style.borderColor = `red`;
      this.flag = true;
    }

    return new user(
      _name,
      _lastName,
      _userName,
      _email,
      _password,
      _socialMedia,
    );
  }

  getName(_name, _lastName) {
    _name = this.name;
    _lastName = this.lastName;
  }

  getEmail(_email) {
    _email = this.email;
  }

  getSocialMedia(_socialMedia) {
    _socialMedia;
  }

  setAvatar(_avatar) {
    this.avatar = _avatar;
    document.getElementById("avatar").src = _avatar;
    return;
  }

  /* mailVal(email) {}

  completeNameVal(name, lastName) {}

  userNameVal(userName) {}

  passwordVal(password) {} */
}

const getSubmit = document.getElementsByName("register-box");
const submitBtn = document.getElementById("submitInfo");
const loginBtn = document.getElementById("login-button");
const loginBox = document.getElementById("login-box");
const singBox = document.getElementById("login");
const iconImages = [
  "UserIcon/Icons/png/001-scientist.png",
  "UserIcon/Icons/png/002-werewolf.png",
  "UserIcon/Icons/png/003-pumpkin.png",
];

submitBtn.addEventListener("click", function submit(event) {
  event.preventDefault();
  const email = document.getElementById("Email");
  const name = document.getElementById("Name");
  const lastName = document.getElementById("last-name");
  const userName = document.getElementById("user-name");
  const password = document.getElementById("password");
  const socialMedia = null;

  const newUser = user.validateUserInfo(
    name,
    lastName,
    userName,
    email,
    password,
    socialMedia,
  );

  if (newUser != undefined) {
    document.getElementById("images").style.display = "inline";
    singBox.style.display = "none";
    submitBtn.style.display = "none";
  } else {
    alert("Favor de verificar su infomración");
    return;
  }

  document
      .getElementById("scientist")
      .addEventListener("click", function chooseImage(){
        newUser.setAvatar(iconImages[0]);
      });
    document
      .getElementById("werewolf")
      .addEventListener("click", function chooseImage(){
        newUser.setAvatar(iconImages[1])
      });
    document
      .getElementById("pumpik")
      .addEventListener("click", function chooseImage(){
        newUser.setAvatar(iconImages[2]);
      });

});

loginBtn.addEventListener('click', function findUser(event){
  event.preventDefault();
  const user = document.getElementById("login-user");
  const password = document.getElementById("login-password");

/* Funcion de buscar al usuario correspondiente de la pagina */

});
