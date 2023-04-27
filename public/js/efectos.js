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


//login

// const loginForm = document.getElementById('login-form');

// loginForm.addEventListener('submit', (e) => {
//   e.preventDefault();

//   const username = document.getElementById('username').value;
//   const password = document.getElementById('password').value;

//   // Aquí se pueden agregar las validaciones necesarias para verificar la información de inicio de sesión

//   // Ejemplo básico de verificación de información de inicio de sesión
//   if (username === 'usuario' && password === 'contraseña') {
//     alert('Inicio de sesión exitoso!');
//   } else {
//     alert('Nombre de usuario o contraseña incorrectos. Por favor, inténtelo de nuevo.');
//   }
// });

//login

const loginFormContainer = document.getElementById('login-form-container');
const registerFormContainer = document.getElementById('register-form-container');
const loginLink = document.getElementById('login-link');
const registerLink = document.getElementById('register-link');
const loginForm = document.getElementById('login-form');
const registerForm = document.getElementById('register-form');

// Muestra el formulario de inicio de sesión y oculta el de registro
function showLoginForm() {
  loginFormContainer.style.display = 'flex';
  registerFormContainer.style.display = 'none';
}

// Muestra el formulario de registro y oculta el de inicio de sesión
function showRegisterForm() {
  loginFormContainer.style.display = 'none';
  registerFormContainer.style.display = 'flex';
}

// Envía los datos de inicio de sesión
function login(event) {
  event.preventDefault();
  const username = loginForm.elements.username.value;
  const password = loginForm.elements.password.value;
  // Aquí puedes enviar los datos del formulario a través de una petición AJAX o a través de una redirección a una página que procese los datos del formulario
}

// Agrega los eventos a los enlaces de inicio de sesión y registro
loginLink.addEventListener('click', showLoginForm);
registerLink.addEventListener('click', showRegisterForm);

// Agrega el evento de envío de inicio de sesión al formulario de inicio de sesión
loginForm.addEventListener('submit', login);



document.getElementById("volver-al-inicio").addEventListener("click", function(){
  window.scrollTo({ top: 0, behavior: 'smooth' });
});


<script>
  // Example starter JavaScript for disabling form submissions if there are invalid fields
(() => {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  const forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }

      form.classList.add('was-validated')
    }, false)
  })
})()
</script>





