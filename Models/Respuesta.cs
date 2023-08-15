public class Respuesta 
{
    int idRespuesta {get; set;}
    int idPregunta {get; set;}
    int opcion {get; set;}
    string contenido {get; set;}
    string foto {get; set;}   
    bool correcta {get; set;}


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