

/**
 * Class Television
 */
public class Television {

  //
  // Fields
  //

  public String forma;
  public String calidadVideo;
  protected String marca;
  private String tamaño;
  
  //
  // Constructors
  //
  public Television () { };
  
  //
  // Methods
  //


  //
  // Accessor methods
  //

  /**
   * Set the value of forma
   * @param newVar the new value of forma
   */
  public void setForma (String newVar) {
    forma = newVar;
  }

  /**
   * Get the value of forma
   * @return the value of forma
   */
  public String getForma () {
    return forma;
  }

  /**
   * Set the value of calidadVideo
   * @param newVar the new value of calidadVideo
   */
  public void setCalidadVideo (String newVar) {
    calidadVideo = newVar;
  }

  /**
   * Get the value of calidadVideo
   * @return the value of calidadVideo
   */
  public String getCalidadVideo () {
    return calidadVideo;
  }

  /**
   * Set the value of marca
   * @param newVar the new value of marca
   */
  public void setMarca (String newVar) {
    marca = newVar;
  }

  /**
   * Get the value of marca
   * @return the value of marca
   */
  public String getMarca () {
    return marca;
  }

  /**
   * Set the value of tama_o
   * @param newVar the new value of tama_o
   */
  public void setTamaño (String newVar) {
    tamaño = newVar;
  }

  /**
   * Get the value of tama_o
   * @return the value of tama_o
   */
  public String getTamaño () {
    return tamaño;
  }

  //
  // Other methods
  //

  /**
   * @param        forma1
   * @param        tama_o1
   * @param        calidadVideo1
   * @param        marca1
   */
  public Television(String forma1, String tamaño1, String calidadVideo1, String marca1)
  {
  	this.forma = forma1;
	this.tamaño = tamaño1;
	this.calidadVideo = calidadVideo1;
	this.marca = marca1;

	System.out.println("Construyó una televisión");
  }


  /**
   */
  public void apagada()
  {
	  System.out.println("Television apagada");
  }


  /**
   */
  public void prendida()
  {
	  System.out.println("Television prendida");
  }


  /**
   * @param        forma1
   */


}
