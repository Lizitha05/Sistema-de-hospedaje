using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MAD.Resources
{
    public partial class menuPrincipal : Form
    {
        public menuPrincipal()
        {
            InitializeComponent();
            this.FormClosed += menuPrincipal_FormClosed; // asigna el evento
        }

        private void menuPrincipal_Load(object sender, EventArgs e)
        {

        }

        //---------------------OPCIONES DEL MENU-------------------------------------//
        private void registroToolStripMenuItem_Click(object sender, EventArgs e)
        {
            usuarios Registro = new usuarios();
            Registro.Show();
            this.Hide();

        }


        //---------------------CERRAR VENTANA-------------------------------------//
        private void menuPrincipal_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

    }
}
