public class Pregunta
{
    public int idPregunta {get; set;}
    public int idCategoria {get; set;}
    public int idDificultad {get; set;}
    public string enunciado {get; set;}
    public string foto {get; set;}


public Pregunta(int idPreg, int idCat, int idDif, string enun, string fto)
{
    idPregunta = idPreg;
    idCategoria = idCat;
    idDificultad = idDif;
    enunciado = enun;
    foto = fto;
}

public Pregunta(){}

}