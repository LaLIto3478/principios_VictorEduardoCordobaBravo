
/**
 * Class Avion
 */
public class Avion {

  //
  // Fields
  //

  public String aerolinea;
  public String capacidad;
  protected String velocidad;
  private String cantidadDeMotores;
  
  //
  // Constructors
  //
  public Avion(String aerolinea1, String cantidadDeMotores1, String velocidad1, String capacidad1)
  {
	  this.aerolinea = aerolinea1;
	  this.capacidad = capacidad1;
	  this.cantidadDeMotores = cantidadDeMotores1;
	  this.velocidad = velocidad1;

	  System.out.println("Construyo un avion");
  }
  //
  // Methods
  //


  //
  // Accessor methods
  //

  /**
   * Set the value of aerolinea
   * @param newVar the new value of aerolinea
   */
  public void setAerolinea (String newVar) {
    aerolinea = newVar;
  }

  /**
   * Get the value of aerolinea
   * @return the value of aerolinea
   */
  public String getAerolinea () {
    return aerolinea;
  }

  /**
   * Set the value of capacidad
   * @param newVar the new value of capacidad
   */
  public void setCapacidad (String newVar) {
    capacidad = newVar;
  }

  /**
   * Get the value of capacidad
   * @return the value of capacidad
   */
  public String getCapacidad () {
    return capacidad;
  }

  /**
   * Set the value of velocidad
   * @param newVar the new value of velocidad
   */
  public void setVelocidad (String newVar) {
    velocidad = newVar;
  }

  /**
   * Get the value of velocidad
   * @return the value of velocidad
   */
  public String getVelocidad () {
    return velocidad;
  }

  /**
   * Set the value of cantidadDeMotores
   * @param newVar the new value of cantidadDeMotores
   */
  public void setCantidadDeMotores (String newVar) {
    cantidadDeMotores = newVar;
  }

  /**
   * Get the value of cantidadDeMotores
   * @return the value of cantidadDeMotores
   */
  public String getCantidadDeMotores () {
    return cantidadDeMotores;
  }

  //
  // Other methods
  //

  /**
   * @param        aerolinea1
   * @param        cantidadDeMotores1
   * @param        velocidad1
   * @param        capacidad1
   */


  /**
   */
  public void acelerar()
  {
	  System.out.println("El avion acelero");
  }


  /**
   */
  public void elevarse()
  {
	  System.out.println("El avion se elevo");
  }

}
