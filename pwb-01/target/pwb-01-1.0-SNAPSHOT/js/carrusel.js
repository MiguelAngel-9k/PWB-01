/*window.onload = function(){
	const IMAGES[
		'images/News/390RTX.jpg',
		'images/News/freeFornite.png',
		'images/News/iphone12.png'
	];

	const timer = 10000;
	let actualPos = 0;
	let $btnPrev = document.querySelector('#preview');
	let $btnNext = document.querySelector('#next');
	let $images = document.querySelector('#image');
	let intervalue;

	function nextImage(){
		if(actualPos >= IMAGES.length -1){
			actualPos = 0;
		}else{
			actualPos++;
		}
		alert('render on');
		render();
	}

	function prevImage() {
		if(actualPos <= 0){
			actualPos = IMAGES.length - 1;
		}else{
			actualPos--;
		}
		render()
	}

	function render(){
		$images.style.backgroundImage = `url(${IMAGES[actualPos]})`;
	}

	$btnNext.addEventListener('click', nextImage);	
	$btnPrev.addEventListener('click', prevImage);

	render();
}*/

        window.onload = function () {
            // Variables
            const IMAGENES = [
                'images/News/390RTX.jpg',
                'images/News/freeFornite.png',
                'images/News/iphone12.png'
            ];

            const TIEMPO_INTERVALO_MILESIMAS_SEG = 5000;
            let posicionActual = 0;
            let $botonRetroceder = document.querySelector('#preview');
            let $botonAvanzar = document.querySelector('#next');
            let $imagen = document.querySelector('#image');
            let $botonPlay = document.querySelector('#play');
            let $botonStop = document.querySelector('#stop');
            let intervalo;            
            let $radioPosOne = document.querySelector('#posOne');
            let $radioPosTwo = document.querySelector('#posTwo');
            let $radioPosThre = document.querySelector('#posThre');

            const RADIO_VALUES = [
            	$radioPosOne,
            	$radioPosTwo,
            	$radioPosThre
            ];
            // Funciones

            /**
             * Funcion que cambia la foto en la siguiente posicion
             */
            function pasarFoto() {
                if(posicionActual >= IMAGENES.length - 1) {
                    posicionActual = 0;                                   
                } else {
                    posicionActual++;
                }
                renderizarImagen();
            }

            /**
             * Funcion que cambia la foto en la anterior posicion
             */
            function retrocederFoto() {
                if(posicionActual <= 0) {
                    posicionActual = IMAGENES.length - 1;
                } else {
                    posicionActual--;
                }
                renderizarImagen();
            }

            /**
             * Funcion que actualiza la imagen de imagen dependiendo de posicionActual
             */
            function renderizarImagen () {
                $imagen.style.backgroundImage = `url(${IMAGENES[posicionActual]})`;
                RADIO_VALUES[posicionActual].checked = true;
                console.log(posicionActual);
            }

            /**
             * Activa el autoplay de la imagen
             */
            function playIntervalo() {
                intervalo = setInterval(pasarFoto, TIEMPO_INTERVALO_MILESIMAS_SEG);
                // Desactivamos los botones de control
                 $botonAvanzar.setAttribute('disabled', true);
                $botonRetroceder.setAttribute('disabled', true);
                $botonPlay.setAttribute('disabled', true);
                $botonStop.removeAttribute('disabled');
                

            }

            /**
             * Para el autoplay de la imagen
             */
            function stopIntervalo() {
                clearInterval(intervalo);
                // Activamos los botones de control
                $botonAvanzar.removeAttribute('disabled');
                $botonRetroceder.removeAttribute('disabled');
                $botonPlay.removeAttribute('disabled');
                $botonStop.setAttribute('disabled', true);
            }

            // Eventos
            playIntervalo();
            $botonAvanzar.addEventListener('click', pasarFoto);
            $botonRetroceder.addEventListener('click', retrocederFoto);
            $botonPlay.addEventListener('click', playIntervalo);
            $botonStop.addEventListener('click', stopIntervalo);
            // Iniciar
            renderizarImagen();
        } 