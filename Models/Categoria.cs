public class Categoria
{
    int idCategoria {get; set;}
    string nombre{get; set;}
    string foto{get; set;}
 
public Categoria(int idCat, string nom, string fto)
{
    idCategoria = idCat;
    nombre = nom;
    foto = fto;
}

}