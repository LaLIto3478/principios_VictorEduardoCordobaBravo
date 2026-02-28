public class Main {
    public static void main(String[] args) {
        ProcesadorPago procesador = new ProcesadorPago();
        MetodoPago pago1 = new PagoTarjeta();
        
        procesador.procesar(pago1);
    }
}
