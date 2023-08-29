using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP07_Riccardi_Granovsky.Models;

namespace TP07_Riccardi_Granovsky.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }

    public IActionResult ConfigurarJuego()
    {
        Juego.InicializarJuego();
        ViewBag.categorias = BD.ObtenerCategorias();
        ViewBag.dificultades = BD.ObtenerDificultades();        
        return View();
    }

    public IActionResult Comenzar(string username, int dificultad, int categoria)
    {
        Juego.CargarPartida(username, dificultad, categoria);
        if (Juego.ObtenerProximaPregunta() == null)
        {
            return RedirectToAction("ConfigurarJuego");
        }
        else
        {
            return RedirectToAction("Jugar");
        }
    }
   
    public IActionResult Jugar()
    {
        if (Juego.ObtenerProximaPregunta() == null)
        {
            ViewBag.nombre = Juego.DevolverUsername();
            ViewBag.puntaje = Juego.DevolverPuntajeActual();
            return View("Fin");
        }
        else
        {
            ViewBag.pregunta = Juego.ObtenerProximaPregunta();
            List<Respuesta> respuestas = Juego.ObtenerProximasRespuestas(ViewBag.Pregunta.idPregunta);
            return View("Juego");
        }
    }

    [HttpPost]
    public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        ViewBag.correcta = Juego.VerificarRespuesta(idPregunta, idRespuesta); // si respuesta seleccionada es correcta (bool)
        if(!ViewBag.correcta)
        {
            ViewBag.respuestaCorrecta = Juego.ObtenerRespuestaCorrecta(idPregunta); //respuesta correcta a la pregunta
        }
        return View("Respuesta");
    }

    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
