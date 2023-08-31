 public static class Juego
{
    private static string username {get; set;}
    private static int puntajeActual {get; set;}
    private static int cantidadPreguntasCorrectas {get; set;}
    private static List<Pregunta> preguntas {get; set;}
    private static List<Respuesta> respuestas {get; set;}


public static void InicializarJuego()
{
    username = "";
    puntajeActual = 0;
    cantidadPreguntasCorrectas = 0;
}

public static List<Categoria> ObtenerCategorias()
{
    return BD.ObtenerCategorias();
}

public static List<Dificultad> ObtenerDificultades()
{
    return BD.ObtenerDificultades();
}

public static void  CargarPartida(string nickname, int dificultad, int categoria)
{
    username = nickname;
    preguntas = BD.ObtenerPreguntas(dificultad, categoria);
    respuestas = BD.ObtenerRespuestas(preguntas);
}

public static Pregunta ObtenerProximaPregunta()
{
    return preguntas[GenerarRandom(0, preguntas.Count-1)];
}

public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
{
    List<Respuesta> Respuestasde1Pregunta = new List<Respuesta>();
    foreach(Respuesta item in respuestas)
    {
        if (item.idPregunta == idPregunta)
        {
            Respuestasde1Pregunta.Add(item);
        }
    }
    return Respuestasde1Pregunta;
}

public static bool VerificarRespuesta(int idPregunta, int idRespuesta)
{
    bool found = false, correcta = false;
    int i = 0;
     while (i < respuestas.Count && !found)
    {
        if (respuestas[i].idRespuesta == idRespuesta)
        {
            found = true;
            correcta = respuestas[i].correcta;
        }
        i++;
    }
    if(correcta)
    {
        int dificultad = ObtenerDificultadPregunta(idPregunta);
        switch(dificultad)
        {
            case 1:
                puntajeActual+=50;
                break;
            case 2:
                puntajeActual+=100;
                break;
            case 3:
                puntajeActual+=150;
                break;
        }
    }
    else 
    {
        EliminarPregunta(idPregunta);
    }
    return correcta;
}

public static Respuesta ObtenerRespuestaCorrecta(int idPregunta)
{
    return BD.ObtenerRespuestaCorrecta(idPregunta);
}

private static void EliminarPregunta(int idPregunta)
{
    bool found = false;
    int i = 0;
    while (i < preguntas.Count && !found)
    {
        if (idPregunta == preguntas[i].idPregunta)
        {
            found = true;
            preguntas.RemoveAt(i);
        }
        i++;
    }
}

private static int ObtenerDificultadPregunta(int idPregunta)
{
    bool found = false;
    int i = 0, dificultad = 0;
    while (i < preguntas.Count && !found)
    {
        if (preguntas[i].idPregunta == idPregunta)
        {
            found = true;
            dificultad = preguntas[i].idDificultad;
        }
        i++;
    }
    return dificultad;
}

private static int GenerarRandom(int min, int max)
{
    int num;
    Random rnd = new Random();
    num = rnd.Next(min, max+1);
    return num;
}
 public static string DevolverUsername()
{
    return username;
}

public static int DevolverPuntajeActual()
{
    return puntajeActual;
}
}





