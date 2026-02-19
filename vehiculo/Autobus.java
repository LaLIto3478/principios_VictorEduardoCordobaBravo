

/**
 * Class Autobus
 */
public class Autobus extends Vehiculo {

  //
  // Fields
  //

  private int numAsientos;
  private int numVentanillas;
  private int numPuertas;
  
  //
  // Constructors
  //
  public Autobus (int numAsientos, int numVentanillas, int numPuertas) {
 	this.numAsientos = numAsientos;
	this.numVentanillas = numVentanillas;
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
   * Set the value of numVentanillas
   * @param newVar the new value of numVentanillas
   */
  public void setNumVentanillas (int newVar) {
    numVentanillas = newVar;
  }

  /**
   * Get the value of numVentanillas
   * @return the value of numVentanillas
   */
  public int getNumVentanillas () {
    return numVentanillas;
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
	  System.out.println("Numero de asientos = " + numAsientos);
	  System.out.println("Numero de puertas = " + numPuertas);
	  System.out.println("Numero de ventilas = " + numVentanillas);
  }


  /**
   */
  public void pruebaDelMotor()
  {
	  System.out.println("El vehiculo funciona");
  }


}
