import java.util.Scanner;

public class Main {

  //
  // Fields
  //

  
  //
  // Constructors
  //
  public Main () { };
  
  public static void main(String args [])
  {
	  // Estudiantes
	  Estudiante student1 = new Estudiante("Victor",19,"H", 2700, 80,"Ingenieria de Software");
	  Estudiante student2 = new Estudiante("Serrano",19,"H", 2132, 50,"Ingenieria de Software");
	  
	  // Docentes
	  Docente professor1 = new Docente("Parada", 52,"H", 10, 25000, "Arquitecto de Software");
	  Docente professor2 = new Docente("Mancilla",50,"H", 20, 25000, "Investigador");
	  Docente professor3  = new Docente("Yara", 52,"M", 30, 40000,"Coordinadora");

	  // Mostrar datos
	  student1.datosAlumno();
	  student2.datosAlumno();
	  professor1.datosDocente();
	  professor2.datosDocente();
	  professor3.datosDocente();
  }


}
