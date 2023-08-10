using System.Data.SqlClient;
using Dapper;
private static string _connectionString = @"Server = localhost; DataBase = PreguntadOrt; Trusted_Connection = True;";

public class Categoria
{
    int idCategoria {get; set;}
    string nombre{get; set;}
    string foto{get; set;}
}

public Categoria(int idCat, string nom, string fto)
{
    idCategoria = idCat;
    nombre = nom;
    foto = fto;
}

public class Pregunta
{
    int idPregunta {get; set;}
    int idCategoria {get; set;}
    int idDificultad {get; set;}
    string enunciado {get; set;}
    string foto {get; set;}
}

public Pregunta(int idPreg, int idCat, int idDif, string enun, string fto)
{
    idPregunta = idPreg;
    idCategoria = idCat;
    idDificultad = idDif;
    enunciado = enun;
    foto = fto;
}

public class Dificultad 
{
    int idDificultad {get; set;}
    string nombre {get; set;}
}

public Dificultad(int idDif, int nom)
{
    idDificultad = idDif;
    nombre = nom
}

public class Respuesta 
{
    int idRespuesta {get; set;}
    int idPregunta {get; set;}
    int opcion {get; set;}
    string contenido {get; set;}
    string foto {get; set;}   
    bool correcta {get; set;}
}

public Respuesta(int idRta, int idPreg, int opc, string cont, string fto, bool correct)
{
    idRespuesta = idRta;
    idPregunta = idPreg;
    opcion = opc;
    contenido = cont;
    foto = fto;
    correcta = correct;

}

public Respuesta()
{

}

public list<Categoria> ObtenerCategorias()
{
    List<Categoria> listaCategorias = new List<Categoria>;
    string sql = "Select * from Categoria;";
    using(SqlConnection db = new SqlConnection(_connectionString))
    {
        listaCategorias = db.Query<Categoria>(sql).ToList();
    }
    return listaCategorias;
} 

public List<Dificultad> ObtenerDificultades()
{
    List<Dificultad> listaDificultades = new List<Dificultad>;
    string sql = "Select * from Dificultad;";
    using(SqlConnection db = new SqlConnection(_connectionString))
    {
        listaDificultades = db.Query<Dificultad>(sql).ToList();
    }
    return listaDificultades;
}

public List<Preguntas> ObtenerPreguntas(int dificultad, int categoria)
{
    List<Dificultad> listaPreguntas = new List<Pregunta>;
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
        string sql = "SELECT * FROM Pregunta WHERE categoria = @pCategoria;"
        
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            listaPreguntas = db.Query<Pregunta>(sql, new {pCategoria = categoria}).ToList();
        }
    }
    else if (dificultad != -1 && categoria == 1)
    {
        string sql = "SELECT * FROM Pregunta WHERE dificultad = @pDificultad;"
        
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            listaPreguntas = db.Query<Pregunta>(sql, new {pDificultad = dificultad}).ToList();
        }
    }
    else if (dificultad != -1 && categoria != -1)
    {
        string sql = "SELECT * FROM Pregunta WHERE categoria = @pCategoria AND dificultad = @pDificultad;"
        
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            listaPreguntas = db.Query<Pregunta>(sql, new {pCategoria = categoria, pDificultad = dificultad}).ToList();
        }
    }
    return listaPreguntas;
}

public static List<Respuesta> ObtenerRespuestas(List<Pregunta> preguntas)
{
    List<Respuesta> listaRespuestas = new List<Respuesta>;
    foreach (Pregunta pregunta in preguntas)
    {
        string sql = "SELECT * FROM Respuesta INNER JOIN Pregunta ON Pregunta.idPregunta = Respuesta.idPregunta WHERE idPregunta = @pIdPregunta"
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
    string sql = "SELECT * FROM Respuesta INNER JOIN Pregunta ON Pregunta.idPregunta = Respuesta.idPregunta WHERE Respuesta.correcta = 1 AND Pregunta.IdPregunta = @pIdPregunta"
    using(SqlConnection db = new SqlConnection(_connectionString))
        {
            correcta = db.QueryFirstOrDefault<Respuesta>(sql, new {@pIdPregunta = idPregunta});
        }
    return correcta;
}
