

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
	  Avion myAvion = new Avion("MX", "8", "200km/h", "80 personas");
	  myAvion.acelerar();
	  myAvion.elevarse();
  }


}
