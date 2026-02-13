

/**
 * Class EjecutaObjetos
 */
public class EjecutaObjetos {

  //
  // Fields
  //

  
  //
  // Constructors
  //
  public EjecutaObjetos () { };
  
  //
  // Methods
  //


  //
  // Accessor methods
  //

  //
  // Other methods
  //

  /**
   * @param        args
   */
  public static void main(String[] args)
  {
	  Pelota myPelota1 = new Pelota("redonda", "azul", "plastico", "playa");
	  myPelota1.botar();
	  myPelota1.desinflar();
  
	  Pelota myPelota2 = new Pelota("redonda", "roja", "caucho", "fuchibol");
	  myPelota2.botar();
	  myPelota2.desinflar();
  }


}
