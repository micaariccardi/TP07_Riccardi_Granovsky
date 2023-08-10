public class Juego
{
    static private string username {get; set;}
    static private int puntajeActual {get; set;}
    static private int cantidadPreguntasCorrectas {get; set;}
    static private List<Pregunta> preguntas {get; set;}
    static private List<Respuesta> respuestas {get; set;}
}

public Juego(string user, int puntaje, int cantPregsCorrectas, List<Pregunta> pregs, List<Respuesta> rtas)
{
    username = user;
    puntajeActual = puntaje;
    cantidadPreguntasCorrectas = cantPregsCorrectas;
    preguntas = pregs;
    respuestas = rtas;
}

public void InicializarJuego()
{
    username = "";
    puntajeActual = 0;
    cantidadPreguntasCorrectas = 0;
}

public list<Categoria> ObtenerCategorias()
{
    return BD.ObtenerCategorias();
}

public List<Dificultad> ObtenerDificultades()
{
    return BD.ObtenerDificultades();
}

public void CargarPartida(string nickname, int dificultad, int categoria)
{
    username = nickname;
    preguntas = BD.ObtenerPreguntas(dificultad, categoria);
    respuestas = BD.ObtenerRespuestas(preguntas);
}

public Pregunta ObtenerProximaPregunta()
{
    return preguntas[GenerarRandom(0, preguntas.Length()-1)];
}

public List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
{
    return ObtenerRespuestas(idPregunta);
}

public bool VerificarRespuesta(int idPregunta, int idRespuesta)
{
    bool found = false;
    int i = 0;
    bool correcta;
    while (i < respuestas.Length() && !found)
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
        int dificultad = ObtenerDificultadPregunta(idPregunta)
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

}

private void EliminarPregunta(int idPregunta)
{
    bool found = false;
    int i = 0;
    while (i < preguntas.Length && !found)
    {
        if (idPregunta = preguntas[i].idPregunta)
        {
            found = true;
            preguntas.removeat(i);
        }
        i++;
    }
}

private int ObtenerDificultadPregunta(int idPregunta)
{
    bool found = false;
    int i = 0, dificultad;
    while (i < preguntas.Length() && !found)
    {
        if (preguntas[i].idRespuesta == idPregunta)
        {
            found = true;
            dificultad = preguntas[i].dificultad;
        }
        i++;
    }
    return dificultad;
}

private int GenerarRandom(int min, int max)
{
    int num;
    Random rnd = new Random();
    num = rnd.Next(min, max+1);
    return num;
}




