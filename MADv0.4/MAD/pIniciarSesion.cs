using MAD.Resources;
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
    public partial class pIniciarSesion : Form
    {
        public pIniciarSesion()
        {
            InitializeComponent();
        }

        private void pIniciarSesion_Load(object sender, EventArgs e)
        {
        }

        private void b_IniciarSesion_Click(object sender, EventArgs e)
        {
            //Declaramos variables para almacenar el correo y la contraseña
            string UsuarioCorreo = tb_CorreoUsuario.Text;
            string UsuarioContraseña = tb_ContraseñaUsuario.Text.Trim();
            //Declaramos un ciclo para saber si no esta vacia
            if (string.IsNullOrEmpty(UsuarioCorreo) || string.IsNullOrEmpty(UsuarioContraseña))
            {
                MessageBox.Show("Por favor, ingresa ambos campos.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;

            }
            //Buscamos si existe en la base de datos
            EnlaceDB enlace = new EnlaceDB();

            bool validarCredencial = enlace.Autentificar(UsuarioCorreo, UsuarioContraseña);

            if (validarCredencial)
            {
                MessageBox.Show("Bienvenido, acceso concedido", "Iniciar sesion", MessageBoxButtons.OK, MessageBoxIcon.Information);

                string nombre = Sesion.UsuarioNombre;
                //Aquí puedes abrir el siguiente formulario y cerrar el login si deseas:
                menuPrincipal menu = new menuPrincipal();
                menu.Show();
                this.Hide();
                //this.Close(); // Cierra el login completamente
                            

            }
            else
            {
                MessageBox.Show("Usuario o contraseña incorrectos", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        //private void b_Registrarce_Click(object sender, EventArgs e)
        //{
           
        //    usuarios pRegistroInicio = new usuarios();
        //    pRegistroInicio.ShowDialog();
            
        //}
    }
}
