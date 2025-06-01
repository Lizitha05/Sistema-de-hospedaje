/*
Autor: Alejandro Villarreal

LMAD

PARA EL PROYECTO ES OBLIGATORIO EL USO DE ESTA CLASE, 
EN EL SENTIDO DE QUE LOS DATOS DE CONEXION AL SERVIDOR ESTAN DEFINIDOS EN EL App.Config
Y NO TENER ESOS DATOS EN CODIGO DURO DEL PROYECTO.

NO SE PERMITE HARDCODE.

LOS MÉTODOS QUE SE DEFINEN EN ESTA CLASE SON EJEMPLOS, PARA QUE SE BASEN Y USTEDES HAGAN LOS SUYOS PROPIOS
Y DEFINAN Y PROGRAMEN TODOS LOS MÉTODOS QUE SEAN NECESARIOS PARA SU PROYECTO.

*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration; //es necesario agregarlo desde el explorador
using System.Windows.Forms;



/*
Se tiene que cambiar el namespace para el que usen en su proyecto
-Hace referencia al nombre del proyecto de visual
*/
namespace MAD
{
    //Obtener los datos del usuario que inicio sesion
    public class Sesion
    {
        public static string UsuarioCorreo {  get; set; }
        public static string UsuarioNombre {  get; set; }
        public static string TipoUsuario {  get; set; }
        public static int IdUsuario { get; set; }
    }
    public class EnlaceDB
    {
        static private string _aux { set; get; }
        static private SqlConnection _conexion;
        static private SqlDataAdapter _adaptador = new SqlDataAdapter();
        static private SqlCommand _comandosql = new SqlCommand();
        static private DataTable _tabla = new DataTable();
        static private DataSet _DS = new DataSet();

        public DataTable obtenertabla
        {
            get
            {
                return _tabla;
            }
        }

        private static void conectar()
        {
            /*
			Para que funcione el ConfigurationManager
			en la sección de "Referencias" de su proyecto, en el "Solution Explorer"
			dar clic al botón derecho del mouse y dar clic a "Add Reference"
			Luego elegir la opción System.Configuration
			
			tal como lo vimos en clase.
			*/
            string cnn = ConfigurationManager.ConnectionStrings["Hoteles"].ToString(); 
			// Cambiar Grupo01 por el que ustedes hayan definido en el App.Confif
            _conexion = new SqlConnection(cnn);
            _conexion.Open();
        }
        private static void desconectar()
        {
            _conexion.Close();
        }

        public DataTable get_Users()
        {
            var msg = "";
            DataTable tabla = new DataTable();
            try
            {
                conectar();
				// Ejemplo de cómo ejecutar un query, 
				// PERO lo correcto es siempre usar SP para cualquier consulta a la base de datos
                string qry = "Select Nombre, email, Fecha_modif from Usuarios where Activo = 0;";
                _comandosql = new SqlCommand(qry, _conexion);
                _comandosql.CommandType = CommandType.Text;
						// Esta opción solo la podrían utilizar si hacen un EXEC al SP concatenando los parámetros.
                _comandosql.CommandTimeout = 1200;

                _adaptador.SelectCommand = _comandosql;
                _adaptador.Fill(tabla);

            }
            catch (SqlException e)
            {
                msg = "Excepción de base de datos: \n";
                msg += e.Message;
                MessageBox.Show(msg, "Warning!", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            }
            finally
            {
                desconectar();
            }

            return tabla;
        }

		// Ejemplo de método para recibir una consulta en forma de tabla
		// Cuando el SP ejecutará un SELECT
        public DataTable get_Deptos(string opc)
        {
            var msg = "";
            DataTable tabla = new DataTable();
            try
            {
                conectar();
                string qry = "SP_GestionDeUsuario";
                _comandosql = new SqlCommand(qry, _conexion);
                _comandosql.CommandType = CommandType.StoredProcedure;
                _comandosql.CommandTimeout = 1200;

                var parametro1 = _comandosql.Parameters.Add("@Opc", SqlDbType.Char, 1);
                parametro1.Value = opc;


                _adaptador.SelectCommand = _comandosql;
                _adaptador.Fill(tabla); 
				// la ejecución del SP espera que regrese datos en formato tabla

            }
            catch (SqlException e)
            {
                msg = "Excepción de base de datos: \n";
                msg += e.Message;
                MessageBox.Show(msg, "Warning!", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            }
            finally
            {
                desconectar();
            }

            return tabla;
        }
		
		// Ejemplo de método para ejecutar un SP que no se espera que regrese información, 
		// solo que ejecute ya sea un INSERT, UPDATE o DELETE
        public bool Add_Deptos(string opc, string depto)
        {
            var msg = "";
            var add = true;
            try
            {
                conectar();
                string qry = "sp_Gestiona_Deptos";
                _comandosql = new SqlCommand(qry, _conexion);
                _comandosql.CommandType = CommandType.StoredProcedure;
                _comandosql.CommandTimeout = 1200;

                var parametro1 = _comandosql.Parameters.Add("@Opc", SqlDbType.Char, 1);
                parametro1.Value = opc;
                var parametro2 = _comandosql.Parameters.Add("@Nombre", SqlDbType.VarChar, 20);
                parametro2.Value = depto;

                _adaptador.InsertCommand = _comandosql;
				// También se tienen las propiedades del adaptador: UpdateCommand  y DeleteCommand
                
                _comandosql.ExecuteNonQuery();

            }
            catch (SqlException e)
            {
                add = false;
                msg = "Excepción de base de datos: \n";
                msg += e.Message;
                MessageBox.Show(msg, "Warning!", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            }
            finally
            {
                desconectar();                
            }

            return add;
        }



        //                  USUARIOS                      //

        //INICIAR SESION * STORE PROCEDURE -> SP_ValidaUser




        public bool Autentificar(string uc, string ps)
        {
            bool isValid = false;
            try
            {
                conectar();
                string qry = "SP_ValidaUser";
                _comandosql = new SqlCommand(qry, _conexion);
                _comandosql.CommandType = CommandType.StoredProcedure;
                _comandosql.CommandTimeout = 9000;

                //Estos son parametros de la BD
                var parametro1 = _comandosql.Parameters.Add("@SP_Correo", SqlDbType.VarChar, 100);
                parametro1.Value = uc;
                var parametro2 = _comandosql.Parameters.Add("@SP_Contraseña", SqlDbType.VarChar, 100);
                parametro2.Value = ps;

                _adaptador.SelectCommand = _comandosql;
                // _tabla.Clear();
                _adaptador.Fill(_tabla);

                if (_tabla.Rows.Count > 0)
                {
                    Sesion.UsuarioNombre = _tabla.Rows[0]["nombres"].ToString();
                    isValid = true;

                }

            }
            catch (SqlException e)
            {
                //MessageBox.Show("Error: " + e.Message);
                isValid = false;
            }
            finally
            {
                desconectar();
            }

            return isValid;
        }


        public DataTable Get_UsuariosActivos()
        {
            DataTable tabla = new DataTable();
            try
            {
                conectar();
                string qry = "SELECT * FROM VW_UsuariosActivos";
                _comandosql = new SqlCommand(qry, _conexion);
                _comandosql.CommandType = CommandType.Text;
                _adaptador.SelectCommand = _comandosql;
                _adaptador.Fill(tabla);
            }
            catch (SqlException e)
            {
                MessageBox.Show("Error al obtener usuarios activos: " + e.Message);
            }
            finally
            {
                desconectar();
            }
            return tabla;
        }


        //INSERT * STORE PROCEDURE -> SP_GestionDeUsuario
        public bool Add_Users(string opc, string tipoUsuario, string correo, string contra,
            string nombres, string apellidoP, string apellidoM, string numeroNomina, DateTime fechaNacimiento,
            string telefono1, string telefono2, string usuarioRegistro, DateTime fechaRegistro, TimeSpan horaRegistro,
            int idUsuario = 0) // Nuevo parámetro, opcional
        {
            var msg = "";
            var add = true;
            try
            {
                conectar();
                string qry = "SP_GestionDeUsuario";
                _comandosql = new SqlCommand(qry, _conexion);
                _comandosql.CommandType = CommandType.StoredProcedure;
                _comandosql.CommandTimeout = 1200;

                // Par. de control y PK para UPDATE / DELETE
                _comandosql.Parameters.Add("@Opc", SqlDbType.Char, 1).Value = opc;
                _comandosql.Parameters.Add("@SP_idUsuario", SqlDbType.Int).Value = idUsuario;

                // Parámetros restantes del usuario
                _comandosql.Parameters.Add("@SP_tipoUsuario", SqlDbType.VarChar, 50).Value = tipoUsuario;
                _comandosql.Parameters.Add("@SP_correo", SqlDbType.VarChar, 100).Value = correo;
                _comandosql.Parameters.Add("@SP_contra", SqlDbType.VarChar, 100).Value = contra;
                _comandosql.Parameters.Add("@SP_nombres", SqlDbType.VarChar, 50).Value = nombres;
                _comandosql.Parameters.Add("@SP_apellidoPaterno", SqlDbType.VarChar, 50).Value = apellidoP;
                _comandosql.Parameters.Add("@SP_apellidoMaterno", SqlDbType.VarChar, 50).Value = apellidoM;
                _comandosql.Parameters.Add("@SP_numeroNomina", SqlDbType.VarChar, 100).Value = numeroNomina;
                _comandosql.Parameters.Add("@SP_fechaNacimiento", SqlDbType.Date).Value = fechaNacimiento;
                _comandosql.Parameters.Add("@SP_telefono1", SqlDbType.VarChar, 10).Value = telefono1;
                _comandosql.Parameters.Add("@SP_telefono2", SqlDbType.VarChar, 10).Value = telefono2;
                _comandosql.Parameters.Add("@SP_usuarioRegistro", SqlDbType.VarChar, 50).Value = usuarioRegistro;
                _comandosql.Parameters.Add("@SP_fechaRegistro", SqlDbType.Date).Value = fechaRegistro;
                _comandosql.Parameters.Add("@SP_horaRegistro", SqlDbType.Time).Value = horaRegistro;

                _comandosql.ExecuteNonQuery();
            }
            catch (SqlException e)
            {
                add = false;
                msg = "Excepción de base de datos: \n" + e.Message;
                MessageBox.Show(msg, "Warning!", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            }
            finally
            {
                desconectar();
            }

            return add;
        }
        //SELECT   * STORE PROCEDURE -> SP_GestionDeUsuario
        public DataTable get_User(string opc)
        {
            var msg = "";
            DataTable tabla = new DataTable();
            try
            {
                conectar();
                string qry = "SP_GestionDeUsuario";
                _comandosql = new SqlCommand(qry, _conexion);
                _comandosql.CommandType = CommandType.StoredProcedure;
                _comandosql.CommandTimeout = 1200;

                var parametro1 = _comandosql.Parameters.Add("@Opc", SqlDbType.Char, 1);
                parametro1.Value = opc;


                _adaptador.SelectCommand = _comandosql;
                _adaptador.Fill(tabla);
                // la ejecución del SP espera que regrese datos en formato tabla

            }
            catch (SqlException e)
            {
                msg = "Excepción de base de datos: \n";
                msg += e.Message;
                MessageBox.Show(msg, "Warning!", MessageBoxButtons.OK, MessageBoxIcon.Stop);
            }
            finally
            {
                desconectar();
            }

            return tabla;
        }





        //-----------------------------------------------//

    }
}
