class article {
  /*
	this.header = _header;
        this.shortDesc = _shortDesc;
        this.body = _body;
        this.images = _images;
        setId();
    } */

  constructor(_article) {
    this.header = _article[0];
    this.shortDesc = _article[1];
    this.body = _article[2];
    this.images = _article[3];
    this.categorySelected = _article[4];
    this.status = false;
  }
  /* 
  setId() {
    if (this.id == 0) {
      this.id = 1;
    } else {
      this.id++;
    }
  } */

  sendArticle() {
    this.article = document.getElementById("articles-sended");
    this.article.innerHTML = `<div class="acordion" id = "content">
    <div class="card">
      <div class="card-header" id="content-header">
        <h2 class="mb-0">
          <button
           class="btn btn-danger btn-block text-left"
           type="button"
           data-toggle="collapse"
           data-target="#collapseContent"
           aria-expanded="true"
           aria-controls="collapseContent"
          >
          ${this.header}
          </button>
        </h2>
      </div>
      <div id="collapseContent" class="collapse show" aria-labelledby="content-header" data-parent="#content">
       <div class="card-body" style="color:black;">
         <a href="#">${this.shortDesc}</a>
       </div>
      </div>
    </div>
  </div>`;
    console.log(this.body);
  }
}

const $header = document.getElementById("article-header");
const $shortDesc = document.getElementById("short-description");
const $body = document.getElementById("article");
const $files = document.getElementById("image-file");
const sendEditor = document.getElementById("send-editor");
const deleteImg = [
  document.getElementById("delete-img-one"),
  document.getElementById("delete-img-two"),
  document.getElementById("delete-img-three"),
];
const articleCategory = document.getElementById("article-category");
const $storedImages = [
  document.getElementById("img-one"),
  document.getElementById("img-two"),
  document.getElementById("img-three"),
];
let $images = [];
let $imageCounter = 0;
let $storedImagesCounter = 0;
let flag = true;

console.log($storedImages);

function cleanForm() {
  $header.value = "";
  $shortDesc.value="";
  $body.value = "";
  $images = [0,0,0];
  $storedImages[0].src = 0;
  $storedImages[1].src = 0;
  $storedImages[2].src = 0;
  deleteImg[0].style.display = "none";
  deleteImg[1].style.display = "none";
  deleteImg[2].style.display = "none";
  $imageCounter = 0;
}

sendEditor.addEventListener("click", (event) => {
  event.preventDefault();
  let select = articleCategory.options[articleCategory.selectedIndex].value;
  const metaArticle = [
    $header.value,
    $shortDesc.value,
    $body.value,
    $images,
    select,
  ];
  if ($imageCounter == 3) {
    newArticle = new article(metaArticle);
    newArticle.sendArticle();
    console.log(newArticle);
    cleanForm();
  } else {
    alert("Rquiered 3 images");
  }
});

$files.addEventListener("change", () => {
  if ($imageCounter < 3) {
    const files = $files.files[0];
    $images[$imageCounter] = URL.createObjectURL(files);
    $storedImages[$imageCounter].src = $images[$imageCounter];
    deleteImg[$imageCounter].style.display = "inline";
    $imageCounter++;
    flag = true;
  } else {
    alert("Images limit reached or ");
  }
});

function deleteStoredImages(toDelete) {
  if ($storedImagesCounter < 0) {
    alert("all images deleted");
    return;
  }

  if (flag == false) {
    alert("add an image before delete another image");
  } else {
    $storedImages[toDelete].src = 0;
    deleteImg[toDelete].style.display = "none";
    $imageCounter = toDelete;
    flag = false;
    return;
  }
}

deleteImg[0].addEventListener("click", (event) => {
  /*event.preventDefault();
    $storedImages[0].src = 0;
    deleteImg[0].style.display= "none";*/
  event.preventDefault();
  deleteStoredImages(0);
});

deleteImg[1].addEventListener("click", (event) => {
  /*event.preventDefault();
    $storedImages[1].src = 0;
    deleteImg[1].style.display= "none";*/
  event.preventDefault();
  deleteStoredImages(1);
});

deleteImg[2].addEventListener("click", (event) => {
  /*event.preventDefault();
    $storedImages[2].src = 0;
    deleteImg[2].style.display= "none";*/
  event.preventDefault();
  deleteStoredImages(2);
});
/*
 **Obtener las partes de la noticia del DOM
 **Darle forma a la noticia
 **Enviar la noticia al editor
 **Colocar la noticia con su respectivo estus en el apartado de publicaciones
 */
