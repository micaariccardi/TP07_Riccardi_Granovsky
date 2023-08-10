using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP07_Riccardi_Granovsky.Models;

namespace TP07_Riccardi_Granovsky.Controllers;

public class HomeController : Controller
{
    Juego juego = New Juego();

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult ConfigurarJuego()
    {
        juego.InicializarJuego();
        ViewBag categorias = BD.ObtenerCategorias();
        ViewBag dificultades = BD.ObtenerDificultades();        
        return View();
    }

    public IActionResult Comenzar(string username, int dificultad, int categoria)
    {
        juego.CargarPartida(username, dificultad, categoria);
        if (juego.preguntas.Count == 0)
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
        if (juego.preguntas.Count == 0)
        {
            ViewBag nombre = juego.username;
            ViewBag puntaje = juego.puntajeActual;
            return View("Fin");
        }
        else
        {
            ViewBag pregunta = juego.ObtenerProximaPregunta();
            ViewBag respuestas = juego.ObtenerProximasRespuestas(pregunta.idPregunta);
            return View("Juego");
        }
    }

    [HttpPost]
    public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        ViewBag correcta = juego.VerificarRespuesta(idPregunta, idRespuesta); // si respuesta seleccionada es correcta (bool)
        if(!correcta)
        {
            ViewBag respuestaCorrecta = juego.ObtenerRespuestaCorrecta(idPregunta); //respuesta correcta a la pregunta
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
