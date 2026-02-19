

/**
 * Class CuentaBancaria
 */
public class CuentaBancaria {

  //
  // Fields
  //

  private double saldo;
  
  //
  // Constructors
  //
  public CuentaBancaria (double saldo) {
 	if(this.saldo == 0){
		System.out.println("Saldo inicial = " + saldo);
	}
	this.saldo = saldo;
 	
  };
  
  //
  // Methods
  //


  //
  // Accessor methods
  //

  /**
   * Set the value of saldo
   * @param newVar the new value of saldo
   */
  public void setSaldo (double newVar) {
    saldo = newVar;
  }

  /**
   * Get the value of saldo
   * @return the value of saldo
   */
  public double getSaldo () {
    return saldo;
  }

  public void depositar(double saldo)
  {
	  System.out.println("deposito = " + saldo);
	  this.saldo += saldo;
  }


  /**
   * @param        saldo
   */
  public void retirar(double retiro)
  {
	  System.out.println("retirando " + retiro);
	  if(this.saldo >= retiro){
	  	this.saldo -= retiro;
		System.out.println("retiro = " + retiro);
		System.out.println("saldo actual: " + this.saldo);
		return;
	  }
	  System.out.println("Saldo insuficiente");
	  
  }


}
