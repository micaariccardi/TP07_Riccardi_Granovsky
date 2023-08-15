using System.Data.SqlClient;
using Dapper;
private static string _connectionString = @"Server = localhost; DataBase = PreguntadOrt; Trusted_Connection = True;";

list<Categoria> ObtenerCategorias()
{
    List<Categoria> listaCategorias = new List<Categoria>();
    string sql = "Select * from Categoria;";
    using(SqlConnection db = new SqlConnection(_connectionString))
    {
        listaCategorias = db.Query<Categoria>(sql).ToList();
    }
    return listaCategorias;
} 

List<Dificultad> ObtenerDificultades()
{
    List<Dificultad> listaDificultades = new List<Dificultad>();
    string sql = "Select * from Dificultad;";
    using(SqlConnection db = new SqlConnection(_connectionString))
    {
        listaDificultades = db.Query<Dificultad>(sql).ToList();
    }
    return listaDificultades;
}

List<Preguntas> ObtenerPreguntas(int dificultad, int categoria)
{
    List<Dificultad> listaPreguntas = new List<Pregunta>();
    if (dificultad == -1 && categoria == -1)
    {
        string sql = "Select * from Pregunta;";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            listaPreguntas = db.Query<Pregunta>(sql).ToList();
        }
    }
    else if (dificultad == -1 && categoria != -1)
    {
        string sql = "SELECT * FROM Pregunta WHERE categoria = @pCategoria;";
        
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            listaPreguntas = db.Query<Pregunta>(sql, new {pCategoria = categoria}).ToList();
        }
    }
    else if (dificultad != -1 && categoria == 1)
    {
        string sql = "SELECT * FROM Pregunta WHERE dificultad = @pDificultad;";
        
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            listaPreguntas = db.Query<Pregunta>(sql, new {pDificultad = dificultad}).ToList();
        }
    }
    else if (dificultad != -1 && categoria != -1)
    {
        string sql = "SELECT * FROM Pregunta WHERE categoria = @pCategoria AND dificultad = @pDificultad;";
        
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            listaPreguntas = db.Query<Pregunta>(sql, new {pCategoria = categoria, pDificultad = dificultad}).ToList();
        }
    }
    return listaPreguntas;
}

static List<Respuesta> ObtenerRespuestas(List<Pregunta> preguntas)
{
    List<Respuesta> listaRespuestas = new List<Respuesta>();
    foreach (Pregunta pregunta in preguntas)
    {
        string sql = "SELECT * FROM Respuesta INNER JOIN Pregunta ON Pregunta.idPregunta = Respuesta.idPregunta WHERE idPregunta = @pIdPregunta";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            listaRespuestas.Add(db.QueryFirstOrDefault<Respuesta>(sql, new {@pIdPregunta = pregunta.idPregunta}));
        }
    }
    return listaRespuestas;
}

static Respuesta ObtenerRespuestaCorrecta(int idPregunta)
{
    Respuesta correcta = new Respuesta();
    string sql = "SELECT * FROM Respuesta INNER JOIN Pregunta ON Pregunta.idPregunta = Respuesta.idPregunta WHERE Respuesta.correcta = 1 AND Pregunta.IdPregunta = @pIdPregunta";
    using(SqlConnection db = new SqlConnection(_connectionString))
        {
            correcta = db.QueryFirstOrDefault<Respuesta>(sql, new {@pIdPregunta = idPregunta});
        }
    return correcta;
}
