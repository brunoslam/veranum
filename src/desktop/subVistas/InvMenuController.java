package desktop.subVistas;

import java.awt.*;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import java.time.LocalDate;
import java.util.Date;
import java.util.ListIterator;
import java.util.ResourceBundle;

import ConexionDB.ConexionDB;
import Modelo.InsumoCocina;
import Modelo.MenuDiario;
import Modelo.UsoStock;
import Modelo.ServicioExtra;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.*;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.input.MouseEvent;


/**
 * Created by Palma Avila on 29-11-2015.
 */
public class InvMenuController implements Initializable {
    private int idMenu, idInsumo, cantidadInsumoParaMenu;
    private String nombreMenu, tipoMenu;
    private LocalDate fechaMenu;

    @FXML TextField txtNombreMenu;
    @FXML TextField txtTipoMenu;
    @FXML ComboBox<Integer> cmbCantidadInsumo;

    private ObservableList<InsumoCocina> listaInsumo = FXCollections.observableArrayList();
    @FXML private TableView<InsumoCocina> tblInsumo = new TableView<>();

    private ObservableList<UsoStock> listaMenu = FXCollections.observableArrayList();
    @FXML private TableView<UsoStock> tblMenu = new TableView<>();


    @FXML TableColumn<InsumoCocina, String> colInsumo;
    @FXML TableColumn<InsumoCocina, Integer> colCantidadInsumo;

    @FXML TableColumn<UsoStock, String> colInsumoMenu;
    @FXML TableColumn<UsoStock, Integer> colCantidad;

    @FXML Label lblItemInsumo;
    @FXML Label lblCantInsumo;

    public void initialize(URL url, ResourceBundle rb){
        colInsumo.setCellValueFactory(new PropertyValueFactory<InsumoCocina, String>("nombreInsumo"));
        colCantidadInsumo.setCellValueFactory(new PropertyValueFactory<InsumoCocina, Integer>("cantidadInsumo"));

        colInsumoMenu.setCellValueFactory(new PropertyValueFactory<UsoStock, String>("nombreInsumo"));
        colCantidad.setCellValueFactory(new PropertyValueFactory<UsoStock, Integer>("cantidad"));

        listarInsumo();
    }

    public void listarInsumo(){
        Connection con= ConexionDB.GetConnection();
        listaInsumo.clear();
        try {
            Statement st;
            ResultSet rs = null;

            String sql = "exec InsumoListar;";
            rs=con.createStatement().executeQuery(sql);

            while   (rs.next()){

                listaInsumo.add(
                        new InsumoCocina(
                                rs.getString(1),
                                rs.getInt(2),
                                rs.getString(3),
                                rs.getInt(4),
                                rs.getInt(5),
                                rs.getDate(6)
                        )
                );
            }

            tblInsumo.setItems(listaInsumo);
        }catch (Exception ex) {
            //  System.out.println(ex.getMessage());

            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error Dialog");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText(ex.getMessage());

            alert.showAndWait();
            con=null;
        }
    }
    InsumoCocina insumoItem = null;
    public void clickTabla(MouseEvent t) {
        cmbCantidadInsumo.getSelectionModel().clearSelection();
        cmbCantidadInsumo.getItems().clear();
        insumoItem = tblInsumo.getSelectionModel().getSelectedItem();
        lblItemInsumo.setText(insumoItem.getNombreInsumo());
        lblCantInsumo.setText(Integer.toString(insumoItem.getCantidadInsumo()));
        int cantidad =  insumoItem.getCantidadInsumo();
        for(int i = 1; i <= cantidad; i++){
            cmbCantidadInsumo.getItems().addAll(i);
        }
    }

    public void agregarAlMenu(){
        int cantidadinsumo;
        if(cmbCantidadInsumo.getValue() != null){
            cantidadinsumo = cmbCantidadInsumo.getValue();
        }else{
            cantidadinsumo = 0;
        }

        if(cantidadinsumo > 0){
            int id = insumoItem.getIdInsumo();
            String nombre =  insumoItem.getNombreInsumo();
            //int cantidad = insumoItem.getCantidadInsumo();
            int cantidad = cmbCantidadInsumo.getSelectionModel().getSelectedItem();
            UsoStock usoStock = new UsoStock(nombreMenu, id, nombre, cantidad );
            //listaInsumo.set()

            listaMenu.add(usoStock);
            tblMenu.setItems(listaMenu);
        }else{
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error al ingresar insumo al menú");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText("Debe seleccionar un insumo y seleccionar la cantidad antes de agregar al menú ");
            alert.showAndWait();
        }

    }

    UsoStock usoStockEliminar = null;
    public void clickTablaMenu(MouseEvent t){
        usoStockEliminar = tblMenu.getSelectionModel().getSelectedItem();
    }

    public void eliminarDelMenu() {
        if(usoStockEliminar != null){
            String nombre = usoStockEliminar.getNombreInsumo(), nombreHotel= "";
            int id = usoStockEliminar.getIdInsumo();
            int cantidad = 0, cantidadIdeal = 0;
            Date fecha = null;

//        ListIterator <InsumoCocina> li =listaInsumo.listIterator();
//        while (li.hasNext())
//        {
//
//            InsumoCocina  insumoLocal= li.next();
//            if(insumoLocal.getNombreInsumo() == nombre){
//                nombreHotel = insumoLocal.getNombreHotel();
//                cantidad = insumoLocal.getCantidadInsumo();
//                cantidadIdeal = insumoLocal.getCantidadInsumoIdeal();
//                fecha = insumoLocal.getFecha();
//                break;
//            }
//        }

            ///InsumoCocina insumo = new InsumoCocina(nombreHotel, id, nombre, cantidad, cantidadIdeal, fecha);

            //listaInsumo.add(insumo);
            int index = tblMenu.getSelectionModel().getSelectedIndex();
            listaMenu.remove(index);
            usoStockEliminar = null;
        }else{
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Ha ocurrido un error");
            alert.setContentText("Debe seleccionar un elemento antes de eliminar de la lista.");
            alert.showAndWait();
        }

    }

    public void recorrerListaMenu(){

        for (UsoStock uso : listaMenu ){


            idInsumo = uso.getIdInsumo();
            String insumo = uso.getNombreInsumo();
            cantidadInsumoParaMenu = uso.getCantidad();
            String nomMenu = uso.getNombreMenu();

        }


    }

    public void insertarMenu(ActionEvent event)throws Exception{

        nombreMenu = txtNombreMenu.getText();
        System.out.println(nombreMenu);
        tipoMenu = txtTipoMenu.getText();
       // fechaMenu = LocalDate.now();
        if(validarCampos() == true){

            Connection miConexion= ConexionDB.GetConnection();

            Statement st;
            //se utiliza para las consultas o procedimientos que no retornan datos.
            PreparedStatement ps = null;
            st=miConexion.createStatement();

            try{


                //String sql = "exec ServicioCrear  @NombreServicio='"+nombreServicio+"', @Precio='" + precioServicio + "' ;";


                String sql = "exec MenuCrear @NombreMenu='"+nombreMenu+"', @TipoMenu='"+tipoMenu+"';";

                ps=miConexion.prepareCall(sql);
                ps.execute();


                for (UsoStock uso : listaMenu ){
                    idInsumo = uso.getIdInsumo();
                    String insumo = uso.getNombreInsumo();
                    cantidadInsumoParaMenu = uso.getCantidad();
                    String nomMenu = uso.getNombreMenu();

                    sql = "exec UsoStockCrear @IdInsumo="+idInsumo+", @Cantidad="+cantidadInsumoParaMenu+";";
                    ps=miConexion.prepareCall(sql);
                    ps.execute();
                }

                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Registro de Menú");
                alert.setHeaderText("Ingreso de Menú");
                alert.setContentText("El menú se ha registrado exitosamente");

                alert.showAndWait();

                //listarServicios();
                //limpiarCampos();



            }catch (Exception ex) {
                //  System.out.println(ex.getMessage());

                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Error Dialog");
                alert.setHeaderText("Ha ocurrido un error");
                alert.setContentText(ex.getMessage());

                alert.showAndWait();
                miConexion=null;

            }

            finally {
                if (ps != null) try { ps.close(); } catch(Exception e) {}
                if (st != null) try { st.close(); } catch(Exception e) {}
                if (miConexion != null) try { miConexion.close(); } catch(Exception e) {}
                //limpiarFormulario();
            }

        }
    }

    public Boolean validarCampos(){
        boolean formvalido;
        nombreMenu = txtNombreMenu.getText();
        tipoMenu = txtTipoMenu.getText();

        if(nombreMenu == "" || tipoMenu == "" || nombreMenu == null || tipoMenu == null){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error al guardar menú ");
            alert.setHeaderText("Ha ocurrido un error al guardar");
            alert.setContentText("Debe ingresar nombre y tipo de menú");

            alert.showAndWait();
            formvalido = false;
        }else{
            formvalido = true;
        }
        if(listaMenu.isEmpty() == true){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error al guardar menú ");
            alert.setHeaderText("Ha ocurrido un error al guardar");
            alert.setContentText("Debe ingresar un elemento a la lista menú");

            alert.showAndWait();
            formvalido = false;

        }else{
            formvalido = true;
        }

        return formvalido;
    }
}
