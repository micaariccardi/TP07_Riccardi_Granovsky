class Juego
{
    static private string username {get; set;}
    static private int puntajeActual {get; set;}
    static private int cantidadPreguntasCorrectas {get; set;}
    static private List<Pregunta> preguntas {get; set;}
    static private List<Respuesta> respuestas {get; set;}
}

Juego(string user, int puntaje, int cantPregsCorrectas, List<Pregunta> pregs, List<Respuesta> rtas)
{
    username = user;
    puntajeActual = puntaje;
    cantidadPreguntasCorrectas = cantPregsCorrectas;
    preguntas = pregs;
    respuestas = rtas;
}

void InicializarJuego()
{

}

static list<Categoria> ObtenerCategorias()
{
    List<Categoria> listaCategorias = new List<Categoria>;
    string sql = "Select * from Categoria";
    using(SqlConnection db = new SqlConnection(_connectionString))
    {
        listaCategorias = db.Query<Categoria>(sql).ToList();
    }
    return listaCategorias;
} 

static List<Dificultad> ObtenerDificultades()
{
    List<Dificultad> listaDificultades = new List<Dificultad>;
    string sql = "Select * from Dificultad";
    using(SqlConnection db = new SqlConnection(_connectionString))
    {
        listaDificultades = db.Query<Dificultad>(sql).ToList();
    }
    return listaDificultades;
}

CargarPartida(string username, int dificultad, int categoria)
{
    
}

ObtenerProximaPregunta()
{

}

ObtenerProximasRespuestas(int idPregunta)
{

}

VerificarRespuesta(int idPregunta, int idRespuesta)
{

}




