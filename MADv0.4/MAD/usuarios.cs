using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MAD
{
    public partial class usuarios : Form
    {
        public usuarios()
        {
            InitializeComponent();
        }

        private void usuarios_Load(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {

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
                dGridV_RegUsuario.DataSource = enlace.get_User("S");

            }
            else
            {
                MessageBox.Show("Error al registrar usuario.");
            }


        }
    }
}
