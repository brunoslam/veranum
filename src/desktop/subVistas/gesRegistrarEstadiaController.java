package desktop.subVistas;

import ConexionDB.ConexionDB;
import Modelo.Cliente;
import Modelo.Habitacion;
import Modelo.Hotel;
import Validadores.NumberTextField;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ListIterator;
import java.util.ResourceBundle;

/**
 * Created by kaos on 05-10-15.
 */
public class gesRegistrarEstadiaController implements Initializable {

    public static int idHotelAct=0;
    public static int cantidadPer=0;
    private static LocalDate fechiniAct;
    private static  LocalDate fechafinAct;
    public static Cliente clienteactual;
    public static Habitacion habitacionactual;
    @FXML
    Button btnSelCliente;

    @FXML
    Button btnSelHabitacion;

    @FXML
    Label lblClienteDatos;

    @FXML
    Label lblHabitacionDatos;

    @FXML
    ComboBox<String> cbSeleHotel;

    @FXML
    DatePicker dateIni =new DatePicker();
    @FXML
    DatePicker datefin =new DatePicker();

    @FXML
    NumberTextField txtCantAdultos;
    @FXML
    NumberTextField txtCantMenores;

    @FXML
    Button btnGuardar;
    @FXML
    Button btnLimpiar;

    @FXML
    Button btnCancelar;

    @FXML
    Label lblError;
    private LocalDate today ;
    private ObservableList<Hotel> hoteles= FXCollections.observableArrayList();



    @Override
    public void  initialize (URL url, ResourceBundle rb){

        hoteles=buscarHoteles();
     //   fechiniAct=LocalDate.now();
     //   fechafinAct=LocalDate.now();
        dateIni.setValue(LocalDate.now());
        datefin.setValue(LocalDate.now());
        today=LocalDate.now();
        llenarComboHotel();

    }


    @FXML
    public void btnCancela(ActionEvent event)throws Exception
    {


        Stage stage = (Stage) btnCancelar.getScene().getWindow();
        stage.close();


    }

    public void llenarComboHotel(){

        ListIterator <Hotel> li =hoteles.listIterator();
        ObservableList<String>  data = FXCollections.observableArrayList();

        while (li.hasNext())
        {   Hotel hotellocal= li.next();
            data.add(hotellocal.getNombreHotel().toString());


        }


        cbSeleHotel.setItems(data);
        cbSeleHotel.getItems().addAll("Seleccione");
        cbSeleHotel.getSelectionModel().select("Seleccione");


    }







    public void estadoEntrada( boolean fechas, boolean hotel, boolean cantidadP, boolean botones){

        if (fechas)
        {
            dateIni.setDisable(false);
            datefin.setDisable(false);
            dateIni.setValue(fechiniAct);
            datefin.setValue(fechafinAct);

        }else
        {
            dateIni.setDisable(true);
            datefin.setDisable(true);
            dateIni.setValue(fechiniAct);
            datefin.setValue(fechafinAct);

        }

        if(hotel)
        {
            cbSeleHotel.setDisable(false);
            llenarComboHotel();
            btnSelHabitacion.setDisable(false);



        }else
        {
            cbSeleHotel.setDisable(true);
            cbSeleHotel.getItems().clear();
            btnSelHabitacion.setDisable(true);
            llenarComboHotel();
            cbSeleHotel.setValue("Seleccione");


        }
        if (cantidadP)
        {
            txtCantAdultos.setDisable(false);
            txtCantMenores.setDisable(false);


        }else{

            txtCantAdultos.setDisable(true);
            txtCantMenores.setDisable(true);
        }

       if (botones){

           btnGuardar.setDisable(false);
           //btnLimpiar.setDisable(false);

       }else{
           btnGuardar.setDisable(true);
           //btnLimpiar.setDisable(true);
       }

    }

    public void limpiarCampos()
    {
        fechiniAct=LocalDate.now();
        fechafinAct=LocalDate.now();
        clienteactual=null;
        habitacionactual=null;
        lblClienteDatos.setText("");
        lblHabitacionDatos.setText("");
        txtCantAdultos.setText("");
        txtCantMenores.setText("");
        dateIni.setValue(LocalDate.now());
        datefin.setValue(LocalDate.now());
        estadoEntrada(false,false,false,false);
        lblError.setText("");


    }



    public int recuperarIdHotel(String hotelNom)
    {
        int idHotel=0;

        ListIterator <Hotel> li =hoteles.listIterator();


        while (li.hasNext())

        {   Hotel hotellocal= li.next();

            if( hotellocal.getNombreHotel().equals(hotelNom)){

            idHotel=hotellocal.getIdHotel();
        }



        }


        return idHotel;

    }


    @FXML
    public void seleccionarHabitacion (ActionEvent event) throws Exception {

        idHotelAct = recuperarIdHotel(cbSeleHotel.getValue().toString());
        fechiniAct = dateIni.getValue();
        fechafinAct = datefin.getValue();

        if(dateIni.getValue()==null || datefin.getValue()==null)
        {
            System.out.println("Debe seleccionar ambas fechas");
            lblError.setText("Debe seleccionar ambas fechas");

        }if (fechiniAct.isAfter(fechafinAct)){
            System.out.println("Fecha Fin no puede ser anterior a Inicio");
            lblError.setText("Fecha Fin no puede ser anterior a Inicio");
        }else
        if (fechiniAct.isBefore(today)) {

            System.out.println("Fecha inicio es anterior");
            lblError.setText("La fecha de Inicio es Erronea");


        }
        else if((cbSeleHotel.getSelectionModel().getSelectedItem().equals("")) || ( (cbSeleHotel.getSelectionModel().getSelectedItem().equals("Seleccione")))){

            System.out.println("Debe seleccionar un Hotel");
            lblError.setText("Debe seleccionar  un Hotel");

        }

        else {


            gesRegistroEstadiaListaHabitacionController.setFechiniAct(fechiniAct);
            gesRegistroEstadiaListaHabitacionController.setfechafinAct(fechafinAct);



                    ((Node) event.getSource()).getScene().getWindow().hide();
            Stage dialogAPPLICATION_MODAL = new Stage();
            dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);//se inicia stage como modal para bloquear acceso a principal

            Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/gesRegistroEstadiaListaHabitacion.fxml"));

            Scene sceneAPPLICATION_MODAL = new Scene(parent);

            dialogAPPLICATION_MODAL.setTitle("Seleccion de Clientes ");
            dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
            dialogAPPLICATION_MODAL.show();

        }
    }


    @FXML
    public void seleccionarCliente (ActionEvent event) throws Exception
    {

        fechiniAct = dateIni.getValue();
        fechafinAct = datefin.getValue();
        gesRegistroEstadialistaClientesController.setFechiniAct(fechiniAct);
        gesRegistroEstadialistaClientesController.setfechafinAct(fechafinAct);

        ((Node) event.getSource()).getScene().getWindow().hide();
        Stage dialogAPPLICATION_MODAL = new Stage();
        dialogAPPLICATION_MODAL.initModality(Modality.APPLICATION_MODAL);//se inicia stage como modal para bloquear acceso a principal

        Parent parent = FXMLLoader.load(getClass().getResource("/desktop/subVistas/gesRegistroEstadialistaClientes.fxml"));

        Scene sceneAPPLICATION_MODAL = new Scene(parent);

        dialogAPPLICATION_MODAL.setTitle("Seleccion de Clientes ");
        dialogAPPLICATION_MODAL.setScene(sceneAPPLICATION_MODAL);
        dialogAPPLICATION_MODAL.show();
    }


    @FXML
    public void setClienteSelec(Cliente clienteSelec) {

        this.clienteactual = clienteSelec;
        lblClienteDatos.setText(clienteactual.getNombre()+" "+ clienteactual.getApPaterno()+" "+ clienteactual.getApMaterno() );
    }

    public void setHabitacionSelec(Habitacion habitacionSelec) {

        habitacionactual =habitacionSelec;

        lblHabitacionDatos.setText(habitacionactual.getNumeroreal() + " Precio: " + habitacionactual.getPrecio());

        this.habitacionactual = habitacionSelec;
    }

    public  static void  setFechiniAct(LocalDate fechini) {


        fechiniAct = fechini;
    }

    public  static void setfechafinAct(LocalDate fechfin) {


        fechafinAct = fechfin;
    }


    public ObservableList<Hotel> buscarHoteles (){



        Connection con= ConexionDB.GetConnection();

        try {



            Statement st;
            ResultSet rs = null;

            String sql = "exec HotelListar;";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){

                hoteles.add(
                        new Hotel(
                                rs.getInt(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getString(4),
                                rs.getString(5),
                                rs.getInt(6),
                                rs.getInt(7),
                                rs.getInt(8)

                        )
                );


            }




        }catch (Exception ex) {
            //  System.out.println(ex.getMessage());

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error Dialog");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText(ex.getMessage());

            alert.showAndWait();
            con=null;

        }






        return hoteles;
    }




    public int recuperarCantidadPersonas (int tipoHabitacion){


        int cantidad=0;


        Connection con= ConexionDB.GetConnection();

        try {



            Statement st;
            ResultSet rs = null;

            String sql = "select CapacidadPersonas from TipoHabitacion where  IdTipoHabitacion="+tipoHabitacion+ ";";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){

                cantidad= rs.getInt(1);


            }




        }catch (Exception ex) {
            //  System.out.println(ex.getMessage());

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error Dialog");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText(ex.getMessage());

            alert.showAndWait();
            con=null;

        }


        return cantidad;
    }


    @FXML
    public void guardarReserva (ActionEvent event)throws Exception
    {


        if ((txtCantAdultos.getText().equals("")) || (txtCantMenores.getText().equals(""))){

            System.out.println("Debe indicar cantidad de personas");
            lblError.setText("Debe indicar cantidad de personas");

        }else{
        cantidadPer=recuperarCantidadPersonas(habitacionactual.getIdtipodehabitacion());
        int cantidadIngresada=Integer.parseInt(txtCantAdultos.getText())+Integer.parseInt(txtCantMenores.getText());


        if (clienteactual==null) {

            System.out.println("Debe seleccionar un Cliente");
            lblError.setText("Debe seleccionar  un Cliente");


        }else if(habitacionactual==null)
        {

            System.out.println("Debe seleccionar una Habitacion");
            lblError.setText("Debe seleccionar  una Habitacion");

        }else if((cantidadIngresada<=0) || (cantidadIngresada>cantidadPer)){

            System.out.println("La cantidad ingresada debe ser mayor a 0 y menor o igual a "+cantidadPer);
            lblError.setText("La cantidad ingresada debe ser mayor a 0 y menor o igual a "+cantidadPer);


        } else {


            inserReserva(clienteactual.getIdCliente(), habitacionactual.getIdhotel(), habitacionactual.getIdhabitacion(),
                    fechiniAct, fechafinAct, cantidadIngresada, Integer.parseInt(txtCantAdultos.getText()),Integer.parseInt(txtCantMenores.getText()),"Reservado");

            inserFechasDisponiblesweb(habitacionactual.getIdhotel(),habitacionactual.getIdhabitacion(),fechiniAct,fechafinAct);
            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Dialogo de Información");
            alert.setHeaderText("Registro de reserva");
            alert.setContentText("La reserva se ha registrado correctamente");

            alert.showAndWait();
            limpiarCampos();

        }
        }
    }



    public void inserFechasDisponiblesweb(int idHotel, int idHabitacion, LocalDate fechainicio, LocalDate fechafin){

        Connection miConexion= ConexionDB.GetConnection();

        Statement st=null;
        ResultSet rs = null;


        //se utiliza para las consultas o procedimientos que no retornan datos.
        PreparedStatement ps = null;




        try {

            st = miConexion.createStatement();
            String sql = "exec FechasDisponiblesInsertar @IdHotel="+idHotel+",@IdHabitacion="+idHabitacion+"," +
                    "@FechaInicio='"+fechainicio.toString()+"', @FechaFin='"+fechafin.toString()+"';";
            ps = miConexion.prepareCall(sql);
            ps.execute();




        } catch (Exception ex) {
            //  System.out.println(ex.getMessage());

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error Dialog");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText(ex.getMessage());

            alert.showAndWait();
            miConexion = null;

        } finally {
            limpiarCampos();
            if (ps != null) try {
                ps.close();
            } catch (Exception e) {
            }
            if (st != null) try {
                st.close();
            } catch (Exception e) {
            }
            if (miConexion != null) try {
                miConexion.close();
            } catch (Exception e) {
            }
        }//fin try conexion




    }





    public void inserReserva(int idcliente, int idhotel, int idhabitacion, LocalDate fechaini, LocalDate fechafin,
                             int cantpersonas,int cantadultos, int cantmenores,String estadoreserva)
    {

        Connection miConexion= ConexionDB.GetConnection();

        Statement st=null;
        ResultSet rs = null;


        //se utiliza para las consultas o procedimientos que no retornan datos.
        PreparedStatement ps = null;




        try {

            st = miConexion.createStatement();
            String sql = "exec ReservaCrear2 @IdCliente="+idcliente+"  ,@IdHotel="+idhotel+
                    "  ,@IdHabitacion="+idhabitacion+
                    "  ,@FechaInicioReserva='"+fechaini.toString()+
                    "'  ,@FechaFinReserva='"+fechafin.toString()+
                    "'  ,@CantPersonas="+cantpersonas+
                    "   ,@Cant_adultos="+cantadultos+
                    "   ,@Cant_menores="+cantmenores+
                    "   ,@estadoReserva='"+estadoreserva+
                    "'  , @TotalCancelado=0;";
            ps = miConexion.prepareCall(sql);
            ps.execute();




        } catch (Exception ex) {
            //  System.out.println(ex.getMessage());

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error Dialog");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText(ex.getMessage());

            alert.showAndWait();
            miConexion = null;

        } finally {
            if (ps != null) try {
                ps.close();
            } catch (Exception e) {
            }
            if (st != null) try {
                st.close();
            } catch (Exception e) {
            }
            if (miConexion != null) try {
                miConexion.close();
            } catch (Exception e) {
            }
        }//fin try conexion




    }



}
