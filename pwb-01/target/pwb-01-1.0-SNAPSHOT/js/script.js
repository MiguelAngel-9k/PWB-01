const navSlided = () => {
  const burger = document.querySelector(".burger");
  const nav = document.querySelector(".nav-list");
  const navList = document.querySelectorAll(".nav-list li");
  var loginBox = document.querySelector(".login-box");
  let carruselBox = document.querySelector(".carrusel-box");

  burger.addEventListener("click", () => {
    nav.classList.toggle("nav-active");
    loginBox.classList.toggle("login-box-active");
    

    navList.forEach((link, index) => {
      if(link.style.animation){
        link.style.animation = `navListFade  0.5s ease fordward ${index / 7 + 1}s`;
        loginBox.style.animation = `loginBoxFade 0.5s ease fordward 2s`;        
      }else{
        link.style.animation = ``;
        loginBox.style.animation = ``;
      }
    });

    burger.classList.toggle("cross");
  });
};


navSlided();
