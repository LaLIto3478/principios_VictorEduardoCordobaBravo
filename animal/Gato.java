public class Gato extends Animal implements Sonido {
  
  public Gato(String nombre)
  {
	  super(nombre);
  }


  /**
   */
  public void mover()
  {
	  System.out.println("El gato se mueve");
  }


  /**
   */
  public void hacerSonido()
  {
	  System.out.println("Miau!");
  }


}
