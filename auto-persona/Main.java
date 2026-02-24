
import java.util.*;


/**
 * Class Main
 */
public class Main {


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
	  Auto auto = new Auto("Nissan");
	  Persona persona = new Persona("Victor", auto);
	  System.out.println(persona.mostrarAuto());
  }


}
