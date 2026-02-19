import java.util.Scanner;

/**
 * Class Main
 */
public class Main {

  //
  // Fields
  //

  
  //
  // Constructors
  //
  public Main () { };
  
  //
  // Methods
  //


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
	  Scanner in = new Scanner(System.in);
	  double saldo = in.nextDouble();
	  CuentaBancaria account = new CuentaBancaria(saldo);
	  double deposito = in.nextDouble();
	  account.depositar(deposito);
	  double retiro = in.nextDouble();
	  account.retirar(retiro);
	  retiro = in.nextDouble();
	  account.retirar(retiro);
  }


}
