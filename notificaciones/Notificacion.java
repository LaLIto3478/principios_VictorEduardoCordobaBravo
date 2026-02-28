

/**
 * Class Notificacion
 */
public class Notificacion {

  //
  // Fields
  //

  protected String mensaje;
  protected String destinatario;
  
  //
  // Constructors
  //
  public Notificacion () { };
  
  //
  // Methods
  //


  //
  // Accessor methods
  //

  /**
   * Set the value of mensaje
   * @param newVar the new value of mensaje
   */
  public void setMensaje (String newVar) {
    mensaje = newVar;
  }

  /**
   * Get the value of mensaje
   * @return the value of mensaje
   */
  public String getMensaje () {
    return mensaje;
  }

  /**
   * Set the value of destinatario
   * @param newVar the new value of destinatario
   */
  public void setDestinatario (String newVar) {
    destinatario = newVar;
  }

  /**
   * Get the value of destinatario
   * @return the value of destinatario
   */
  public String getDestinatario () {
    return destinatario;
  }

  //
  // Other methods
  //

  /**
   * @param        mensaje
   */
  public void Notificacion(String mensaje)
  {
  }


  /**
   */
  public void registrarLog()
  {
  }


}
