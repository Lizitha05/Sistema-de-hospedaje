using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Text;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MAD.Resources;

namespace MAD
{
    public partial class usuarios : Form
    {

        private void LimpiarCampos()
        {
            tB_NombresReg.Clear();
            tB_ApReg.Clear();
            tB_AmReg.Clear();
            tB_tUsuarioReg.Clear();
            tB_ContraReg.Clear();
            tB_CorreoReg.Clear();
            tB_tCelReg.Clear();
            tB_tCasaReg.Clear();
            tB_numNomina.Clear();
            dTP_fNacReg.Value = DateTime.Today;
            tB_RegistradoPor.Text = Sesion.UsuarioNombre; // Vuelve a cargar el usuario que está logueado
            idUsuarioSeleccionado = -1;
            b_regUsu.Enabled = true;
        }

        private int idUsuarioSeleccionado = -1;
        public usuarios()
        {
            InitializeComponent();
            this.FormClosed += usuarios_FormClosed;
        }
        private void usuarios_FormClosed(object sender, FormClosedEventArgs e)
        {
            menuPrincipal menu = new menuPrincipal();
            menu.Show();
        }
        private void usuarios_Load(object sender, EventArgs e)
        {
            tB_RegistradoPor.Text = Sesion.UsuarioNombre;
            EnlaceDB enlace = new EnlaceDB();
            dGridV_RegUsuario.DataSource = enlace.Get_UsuariosActivos();
            //DataTable tablaUsuarios = enlace.get_User("S");
            LimpiarCampos();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (idUsuarioSeleccionado == -1)
            {
                MessageBox.Show("Selecciona un usuario para eliminar.");
                return;
            }

            DialogResult result = MessageBox.Show("¿Estás seguro de que quieres desactivar este usuario?", "Confirmación", MessageBoxButtons.YesNo);
            if (result == DialogResult.Yes)
            {
                EnlaceDB enlace = new EnlaceDB();
                string opc = "D";

                // Puedes pasar strings vacíos para los demás parámetros si tu SP no los requiere
                bool eliminado = enlace.Add_Users(opc, "", "", "", "", "", "", "", DateTime.Now, "", "", "", DateTime.Now, DateTime.Now.TimeOfDay, idUsuarioSeleccionado);

                if (eliminado)
                {
                    MessageBox.Show("Usuario desactivado.");
                    dGridV_RegUsuario.DataSource = enlace.get_User("S");
                }
                else
                {
                    MessageBox.Show("Error al desactivar usuario.");
                }
                LimpiarCampos();
            }
        }

        private void tB_CorreoReg_TextChanged(object sender, EventArgs e)
        {

        }

        //Registrar
        private void b_regUsu_Click(object sender, EventArgs e)

        {
            // Recolectar datos del formulario...
            string opc = "I";
            string tipoUsuario = tB_tUsuarioReg.Text;
            string correo = tB_CorreoReg.Text;
            string contra = tB_ContraReg.Text;
            string nombres = tB_NombresReg.Text;
            string apellidoP = tB_ApReg.Text;
            string apellidoM = tB_AmReg.Text;
            string numeroNomina = tB_numNomina.Text;  
            DateTime fechaNac = dTP_fNacReg.Value;
            string tel1 = tB_tCelReg.Text;
            string tel2 = tB_tCasaReg.Text;
            string usuarioRegistro = tB_RegistradoPor.Text;
            DateTime fechaReg = DateTime.Now;
            TimeSpan horaReg = DateTime.Now.TimeOfDay;

            EnlaceDB enlace = new EnlaceDB();
            bool Registro = enlace.Add_Users(opc, tipoUsuario, correo, contra,
            nombres, apellidoP, apellidoM, numeroNomina, fechaNac, tel1,
            tel2, usuarioRegistro, fechaReg, horaReg);

            if (Registro)
            {
                MessageBox.Show("Usuario registrado con éxito.");
                dGridV_RegUsuario.DataSource = enlace.Get_UsuariosActivos();


            }
            else
            {
                MessageBox.Show("Error al registrar usuario.");
            }
                LimpiarCampos();

        }

        private void tB_RegistradoPor_TextChanged(object sender, EventArgs e)
        {

        }

        private void dGridV_RegUsuario_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow fila = dGridV_RegUsuario.Rows[e.RowIndex];

                // Cargar todos los campos requeridos
                tB_NombresReg.Text = fila.Cells["nombres"].Value.ToString();
                tB_ApReg.Text = fila.Cells["apellidoPaterno"].Value.ToString();
                tB_AmReg.Text = fila.Cells["apellidoMaterno"].Value.ToString();
                tB_tUsuarioReg.Text = fila.Cells["tipoUsuario"].Value.ToString();
                tB_ContraReg.Text = fila.Cells["contra"].Value.ToString();
                tB_CorreoReg.Text = fila.Cells["correo"].Value.ToString();
                tB_tCelReg.Text = fila.Cells["telefono1"].Value.ToString();
                tB_tCasaReg.Text = fila.Cells["telefono2"].Value?.ToString() ?? ""; // puede ser NULL
                tB_numNomina.Text = fila.Cells["numeroNomina"].Value.ToString();
                dTP_fNacReg.Value = Convert.ToDateTime(fila.Cells["fechaNacimiento"].Value);
                tB_RegistradoPor.Text = fila.Cells["usuarioRegistro"].Value.ToString();

                // Guardar el ID del usuario para edición/eliminación
                idUsuarioSeleccionado = Convert.ToInt32(fila.Cells["idUsuario"].Value);
                b_regUsu.Enabled = false;
            }
        }

        private void b_editUsu_Click(object sender, EventArgs e)
        {
            if (idUsuarioSeleccionado == -1)
            {
                MessageBox.Show("Selecciona un usuario para editar.");
                return;
            }

            string opc = "U";
            string tipoUsuario = tB_tUsuarioReg.Text;
            string correo = tB_CorreoReg.Text;
            string contra = tB_ContraReg.Text;
            string nombres = tB_NombresReg.Text;
            string apellidoP = tB_ApReg.Text;
            string apellidoM = tB_AmReg.Text;
            string numeroNomina = tB_numNomina.Text;
            DateTime fechaNac = dTP_fNacReg.Value;
            string tel1 = tB_tCelReg.Text;
            string tel2 = tB_tCasaReg.Text;
            string usuarioRegistro = tB_RegistradoPor.Text;
            DateTime fechaReg = DateTime.Now;
            TimeSpan horaReg = DateTime.Now.TimeOfDay;

            EnlaceDB enlace = new EnlaceDB();
            bool actualizado = enlace.Add_Users(opc, tipoUsuario, correo, contra,
                nombres, apellidoP, apellidoM, numeroNomina, fechaNac, tel1,
                tel2, usuarioRegistro, fechaReg, horaReg, idUsuarioSeleccionado); // Nueva sobrecarga

            if (actualizado)
            {
                MessageBox.Show("Usuario actualizado.");
                dGridV_RegUsuario.DataSource = enlace.Get_UsuariosActivos();
            }
            else
            {
                MessageBox.Show("Error al actualizar usuario.");
            }
                LimpiarCampos();
        }
    }
}
