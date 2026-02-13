

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
	 Television myTV = new Television("Cuadrada", "55in", "4k", "LG");
	 myTV.apagada();
	 myTV.prendida();
	
	 Television myTV2 = new Television("Curva", "65in", "2k", "Samsung");
	 myTV2.apagada();
	 myTV2.prendida();
  }

}
