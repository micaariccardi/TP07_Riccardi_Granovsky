using System.Data.SqlClient;
using Dapper;
public static class BD 
{
private static string _connectionString = @"Server = localhost; DataBase = PreguntadOrt; Trusted_Connection = True;";

public static List<Categoria> ObtenerCategorias()
{
    List<Categoria> listaCategorias = new List<Categoria>();
    string sql = "Select * from Categoria;";
    using(SqlConnection db = new SqlConnection(_connectionString))
    {
        listaCategorias = db.Query<Categoria>(sql).ToList();
    }
    return listaCategorias;
} 

public static List<Dificultad> ObtenerDificultades()
{
    List<Dificultad> listaDificultades = new List<Dificultad>();
    string sql = "Select * from Dificultad;";
    using(SqlConnection db = new SqlConnection(_connectionString))
    {
        listaDificultades = db.Query<Dificultad>(sql).ToList();
    }
    return listaDificultades;
}

public static List<Pregunta> ObtenerPreguntas(int idDificultad, int idCategoria)
{
    List<Pregunta> listaPreguntas = new List<Pregunta>();
    if (idDificultad == -1 && idCategoria == -1)
    {
        string sql = "Select * from Pregunta;";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            listaPreguntas = db.Query<Pregunta>(sql).ToList();
        }
    }
    else if (idDificultad == -1 && idCategoria != -1)
    {
        string sql = "SELECT * FROM Pregunta WHERE idCategoria = @pCategoria;";
        
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            listaPreguntas = db.Query<Pregunta>(sql, new {pCategoria = idCategoria}).ToList();
        }
    }
    else if (idDificultad != -1 && idCategoria == 1)
    {
        string sql = "SELECT * FROM Pregunta WHERE idDificultad = @pDificultad;";
        
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            listaPreguntas = db.Query<Pregunta>(sql, new {pDificultad = idDificultad}).ToList();
        }
    }
    else if (idDificultad != -1 && idCategoria != -1)
    {
        string sql = "SELECT * FROM Pregunta WHERE idCategoria = @pCategoria AND idDificultad = @pDificultad;";
        
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            listaPreguntas = db.Query<Pregunta>(sql, new {pCategoria = idCategoria, pDificultad = idDificultad}).ToList();
        }
    }
    return listaPreguntas;
}

public static List<Respuesta> ObtenerRespuestas(List<Pregunta> preguntas)
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

public static Respuesta ObtenerRespuestaCorrecta(int idPregunta)
{
    Respuesta correcta = new Respuesta();
    string sql = "SELECT * FROM Respuesta INNER JOIN Pregunta ON Pregunta.idPregunta = Respuesta.idPregunta WHERE Respuesta.correcta = 1 AND Pregunta.IdPregunta = @pIdPregunta";
    using(SqlConnection db = new SqlConnection(_connectionString))
        {
            correcta = db.QueryFirstOrDefault<Respuesta>(sql, new {@pIdPregunta = idPregunta});
        }
    return correcta;
}

}