public class EmailNotificacion {
  public void EmailNotificacion(String mensaje, String destinatario)
  {
	  super(mensaje, destinatario);
  }

  @Override
  public void enviar()
  {
	  System.out.println("Enviando email a " + destinatario + ":" + mensaje);
  }

  @Override
  public void registrarLog(){
  	System.out.println("Creando log...");
  }


}
