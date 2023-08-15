public class Pregunta
{
    int idPregunta {get; set;}
    int idCategoria {get; set;}
    int idDificultad {get; set;}
    string enunciado {get; set;}
    string foto {get; set;}


public Pregunta(int idPreg, int idCat, int idDif, string enun, string fto)
{
    idPregunta = idPreg;
    idCategoria = idCat;
    idDificultad = idDif;
    enunciado = enun;
    foto = fto;
}

}