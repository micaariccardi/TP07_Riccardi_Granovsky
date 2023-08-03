using System.Data.SqlClient;
using Dapper;

class Categoria
{
    int idCategoria {get; set;}
    string nombre{get; set;}
    string foto{get; set;}
}

Categoria(int idCat, string nom, string fto)
{
    idCategoria = idCat;
    nombre = nom;
    foto = fto;
}

class Pregunta
{
    int idPregunta {get; set;}
    int idCategoria {get; set;}
    int idDificultad {get; set;}
    string enunciado {get; set;}
    string foto {get; set;}
}

Pregunta(int idPreg, int idCat, int idDif, string enun, string fto)
{
    idPregunta = idPreg;
    idCategoria = idCat;
    idDificultad = idDif;
    enunciado = enun;
    foto = fto;
}

class Dificultad 
{
    int idDificultad {get; set;}
    string nombre {get; set;}
}

Dificultad(int idDif, int nom)
{
    idDificultad = idDif;
    nombre = nom
}

class Respuesta 
{
    int idRespuesta {get; set;}
    int idPregunta {get; set;}
    int opcion {get; set;}
    string contenido {get; set;}
    string foto {get; set;}   
    bool correcta {get; set;}
}

Respuesta(int idRta, int idPreg, int opc, string cont, string fto, bool correct)
{
    idRespuesta = idRta;
    idPregunta = idPreg;
    opcion = opc;
    contenido = cont;
    foto = fto;
    correcta = correct;

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

static List<Preguntas> ObtenerPreguntas(int dificultad, int categoria)
{
    
}

static List<Respuesta> ObtenerRespuestas(List<Pregunta> preguntas)
{

}