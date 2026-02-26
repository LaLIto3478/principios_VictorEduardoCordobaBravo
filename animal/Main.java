

/**
 * Class Main
 */
public class Main {

  
  public static void main(String args[])
  {
	  Perro perro = new Perro("Serrano");
	  Gato gato = new Gato("Luisa");

	  // Perro
	  perro.mover();
	  perro.hacerSonido();

	  // Gato
	  gato.mover();
	  gato.hacerSonido();
  }


}
