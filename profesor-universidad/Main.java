import java.util.ArrayList;
import java.util.List;

/**
 * Class Main
 */
public class Main {

  //
  // Fields
  //

  public static void main(String[] args){
	  Profesor p1 = new Profesor("Parada", "Metodologia");
	  Profesor p2 = new Profesor("Yara", "Estructura");

	  List<Profesor> listaProfesores = new ArrayList<>();
	  listaProfesores.add(p1);
	  listaProfesores.add(p2);

	  Universidad universidad = new Universidad("Negocios y Tecnologias", listaProfesores);

	  universidad.mostrarProfesores();
  }

}
