// import React, { useRef } from "https://esm.sh/react@18";
// import ReactDOM from "https://esm.sh/react-dom@18";

// const App = () => {
//   const buttonRef  = useRef();
//   return(
//     <div className="box">
//       <h1>The Button has a ref</h1>
//       <button
//         onClick={() => {
//           console.log(buttonRef.current);
//         }}
//         ref={buttonRef}
//         className="button">
//           Special Button
//        </button>
//     </div>
//   );
// }

// ReactDOM.render(<App />,
// document.getElementById("root"))

// Función range



const rango = $("#rango");
const porc = $("#porc");

rango.on('change',()=> {
  console.log(rango.val());
  porc.html(rango.val()+ '%');
});

// Barra de progreso

function updateProgressBar(percent) {
  const progressBar = document.querySelector('.progress');
  progressBar.style.width = percent + '%';
}
updateProgressBar(50); // actualiza la barra de progreso al 50%

// Barra de progreso2

function updateProgress(percent) {
  var progress = document.querySelector('.progress2');
  var percentLabel = document.querySelector('.percent');
  
  progress.style.width = percent + '%';
  percentLabel.innerHTML = percent + '%';
}

updateProgress(25);

// Barra de progreso3

stroke-dashoffset 


// Barra de progreso4

// Obtener elementos de la barra de progreso y el porcentaje
const progressBar = document.querySelector('.progress3');
const progressText = document.querySelector('.progress-text3');

// Definir la duración de la animación y el porcentaje final
const duration = 5000;
const targetProgress = 100;

// Inicializar el porcentaje actual y el tiempo inicial
let currentProgress = 0;
let startTime = null;

// Función para actualizar la barra de progreso
function updateProgress(timestamp) {
  if (!startTime) {
    startTime = timestamp;
  }

  // Calcular el tiempo transcurrido desde el inicio de la animación
  const elapsedTime = timestamp - startTime;

  // Calcular el porcentaje actual
  currentProgress = Math.min((elapsedTime / duration) * targetProgress, targetProgress);

  // Actualizar la barra de progreso y el porcentaje
  progressBar.style.width = `${currentProgress}%`;
  progressText.innerText = `${Math.round(currentProgress)}%`;

  // Continuar la animación hasta que se alcance el porcentaje objetivo
  if (currentProgress < targetProgress) {
    requestAnimationFrame(updateProgress);
  }
}

// Iniciar la animación al cargar la página
requestAnimationFrame(updateProgress);






