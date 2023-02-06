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





