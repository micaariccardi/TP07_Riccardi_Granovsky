public class Categoria
{
    public int idCategoria {get; set;}
    public string nombre{get; set;}
    public string foto{get; set;}
 
public Categoria(int idCat, string nom, string fto)
{
    idCategoria = idCat;
    nombre = nom;
    foto = fto;
}

public Categoria(){}

}