

/**
 * Class Automovil
 */
public class Automovil extends Vehiculo {

  //
  // Fields
  //

  private int numAsientos;
  private int numPuertas;
  
  //
  // Constructors
  //
  public Automovil (int numAsientos, int numPuertas) {
 	this.numAsientos = numAsientos;
	this.numPuertas = numPuertas;
  };
  
  //
  // Methods
  //


  //
  // Accessor methods
  //

  /**
   * Set the value of numAsientos
   * @param newVar the new value of numAsientos
   */
  public void setNumAsientos (int newVar) {
    numAsientos = newVar;
  }

  /**
   * Get the value of numAsientos
   * @return the value of numAsientos
   */
  public int getNumAsientos () {
    return numAsientos;
  }

  /**
   * Set the value of numPuertas
   * @param newVar the new value of numPuertas
   */
  public void setNumPuertas (int newVar) {
    numPuertas = newVar;
  }

  /**
   * Get the value of numPuertas
   * @return the value of numPuertas
   */
  public int getNumPuertas () {
    return numPuertas;
  }

  //
  // Other methods
  //

  /**
   */
  public void mostrarDatos()
  {

  }


  /**
   */
  public void pruebaDelMotor()
  {
  }


}
