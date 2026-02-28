public class SistemaAlertas {
  public static void main(String[] args)
  {
	  EmailNotificacion email = new EmailNotificacion("Bienvenido", "user@email.com");
	  email.enviar();
	  email.registrarLog();

	  SMSNotificacion sms = new SMSNotificacion("Tu codigo es 1234", "+522721647930");
	  sms.enviar();
	  sms.registrarLog();
  }


}
