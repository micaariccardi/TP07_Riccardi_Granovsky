public class Respuesta 
{
    public int idRespuesta {get; set;}
    public int idPregunta {get; set;}
    public int opcion {get; set;}
    public string contenido {get; set;}
    public string foto {get; set;}   
    public bool correcta {get; set;}


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

}