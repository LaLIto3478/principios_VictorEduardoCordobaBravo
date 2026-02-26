abstract public class Animal {

  //
  // Fields
  //

  protected String nombre;
 
  public void setNombre (String newVar) {
    nombre = newVar;
  }

  /**
   * Get the value of nombre
   * @return the value of nombre
   */
  public String getNombre () {
    return nombre;
  }

  //
  // Other methods
  //

  /**
   * @param        nombre
   */
  public Animal(String nombre)
  {
	  this.nombre = nombre;
  }


  /**
   */
  public void mover()
  {
  }


}
