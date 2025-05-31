namespace MAD
{
    partial class usuarios
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(usuarios));
            this.dGridV_RegUsuario = new System.Windows.Forms.DataGridView();
            this.tB_RegistradoPor = new System.Windows.Forms.TextBox();
            this.b_elimUsu = new System.Windows.Forms.Button();
            this.b_editUsu = new System.Windows.Forms.Button();
            this.b_regUsu = new System.Windows.Forms.Button();
            this.dTP_fNacReg = new System.Windows.Forms.DateTimePicker();
            this.tB_numNomina = new System.Windows.Forms.TextBox();
            this.tB_tCasaReg = new System.Windows.Forms.TextBox();
            this.tB_tCelReg = new System.Windows.Forms.TextBox();
            this.tB_CorreoReg = new System.Windows.Forms.TextBox();
            this.tB_ContraReg = new System.Windows.Forms.TextBox();
            this.tB_tUsuarioReg = new System.Windows.Forms.TextBox();
            this.tB_AmReg = new System.Windows.Forms.TextBox();
            this.tB_ApReg = new System.Windows.Forms.TextBox();
            this.tB_NombresReg = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dGridV_RegUsuario)).BeginInit();
            this.SuspendLayout();
            // 
            // dGridV_RegUsuario
            // 
            this.dGridV_RegUsuario.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dGridV_RegUsuario.Location = new System.Drawing.Point(289, 13);
            this.dGridV_RegUsuario.Margin = new System.Windows.Forms.Padding(4);
            this.dGridV_RegUsuario.Name = "dGridV_RegUsuario";
            this.dGridV_RegUsuario.RowHeadersWidth = 51;
            this.dGridV_RegUsuario.Size = new System.Drawing.Size(791, 458);
            this.dGridV_RegUsuario.TabIndex = 51;
            // 
            // tB_RegistradoPor
            // 
            this.tB_RegistradoPor.Font = new System.Drawing.Font("Microsoft YaHei", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tB_RegistradoPor.Location = new System.Drawing.Point(13, 446);
            this.tB_RegistradoPor.Margin = new System.Windows.Forms.Padding(4);
            this.tB_RegistradoPor.Name = "tB_RegistradoPor";
            this.tB_RegistradoPor.ReadOnly = true;
            this.tB_RegistradoPor.Size = new System.Drawing.Size(248, 25);
            this.tB_RegistradoPor.TabIndex = 50;
            // 
            // b_elimUsu
            // 
            this.b_elimUsu.BackgroundImage = global::MAD.Properties.Resources.Boton;
            this.b_elimUsu.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.b_elimUsu.Font = new System.Drawing.Font("Microsoft YaHei", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.b_elimUsu.Location = new System.Drawing.Point(409, 479);
            this.b_elimUsu.Margin = new System.Windows.Forms.Padding(4);
            this.b_elimUsu.Name = "b_elimUsu";
            this.b_elimUsu.Size = new System.Drawing.Size(123, 43);
            this.b_elimUsu.TabIndex = 48;
            this.b_elimUsu.Text = "Eliminar";
            this.b_elimUsu.UseVisualStyleBackColor = true;
            this.b_elimUsu.Click += new System.EventHandler(this.button3_Click);
            // 
            // b_editUsu
            // 
            this.b_editUsu.BackgroundImage = global::MAD.Properties.Resources.Boton;
            this.b_editUsu.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.b_editUsu.Font = new System.Drawing.Font("Microsoft YaHei", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.b_editUsu.Location = new System.Drawing.Point(289, 479);
            this.b_editUsu.Margin = new System.Windows.Forms.Padding(4);
            this.b_editUsu.Name = "b_editUsu";
            this.b_editUsu.Size = new System.Drawing.Size(117, 43);
            this.b_editUsu.TabIndex = 47;
            this.b_editUsu.Text = "Editar";
            this.b_editUsu.UseVisualStyleBackColor = true;
            // 
            // b_regUsu
            // 
            this.b_regUsu.BackgroundImage = global::MAD.Properties.Resources.Boton;
            this.b_regUsu.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.b_regUsu.Font = new System.Drawing.Font("Microsoft YaHei", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.b_regUsu.Location = new System.Drawing.Point(61, 479);
            this.b_regUsu.Margin = new System.Windows.Forms.Padding(4);
            this.b_regUsu.Name = "b_regUsu";
            this.b_regUsu.Size = new System.Drawing.Size(112, 43);
            this.b_regUsu.TabIndex = 46;
            this.b_regUsu.Text = "Registrar";
            this.b_regUsu.UseVisualStyleBackColor = true;
            this.b_regUsu.Click += new System.EventHandler(this.b_regUsu_Click);
            // 
            // dTP_fNacReg
            // 
            this.dTP_fNacReg.CalendarFont = new System.Drawing.Font("Microsoft YaHei", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dTP_fNacReg.Location = new System.Drawing.Point(13, 412);
            this.dTP_fNacReg.Margin = new System.Windows.Forms.Padding(4);
            this.dTP_fNacReg.Name = "dTP_fNacReg";
            this.dTP_fNacReg.Size = new System.Drawing.Size(248, 22);
            this.dTP_fNacReg.TabIndex = 45;
            // 
            // tB_numNomina
            // 
            this.tB_numNomina.Font = new System.Drawing.Font("Microsoft YaHei", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tB_numNomina.Location = new System.Drawing.Point(13, 368);
            this.tB_numNomina.Margin = new System.Windows.Forms.Padding(4);
            this.tB_numNomina.Name = "tB_numNomina";
            this.tB_numNomina.Size = new System.Drawing.Size(248, 25);
            this.tB_numNomina.TabIndex = 43;
            // 
            // tB_tCasaReg
            // 
            this.tB_tCasaReg.Font = new System.Drawing.Font("Microsoft YaHei", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tB_tCasaReg.Location = new System.Drawing.Point(13, 335);
            this.tB_tCasaReg.Margin = new System.Windows.Forms.Padding(4);
            this.tB_tCasaReg.Name = "tB_tCasaReg";
            this.tB_tCasaReg.Size = new System.Drawing.Size(248, 25);
            this.tB_tCasaReg.TabIndex = 41;
            // 
            // tB_tCelReg
            // 
            this.tB_tCelReg.Font = new System.Drawing.Font("Microsoft YaHei", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tB_tCelReg.Location = new System.Drawing.Point(13, 291);
            this.tB_tCelReg.Margin = new System.Windows.Forms.Padding(4);
            this.tB_tCelReg.Name = "tB_tCelReg";
            this.tB_tCelReg.Size = new System.Drawing.Size(248, 25);
            this.tB_tCelReg.TabIndex = 39;
            // 
            // tB_CorreoReg
            // 
            this.tB_CorreoReg.Font = new System.Drawing.Font("Microsoft YaHei", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tB_CorreoReg.Location = new System.Drawing.Point(13, 258);
            this.tB_CorreoReg.Margin = new System.Windows.Forms.Padding(4);
            this.tB_CorreoReg.Name = "tB_CorreoReg";
            this.tB_CorreoReg.Size = new System.Drawing.Size(248, 25);
            this.tB_CorreoReg.TabIndex = 37;
            this.tB_CorreoReg.TextChanged += new System.EventHandler(this.tB_CorreoReg_TextChanged);
            // 
            // tB_ContraReg
            // 
            this.tB_ContraReg.Font = new System.Drawing.Font("Microsoft YaHei", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tB_ContraReg.Location = new System.Drawing.Point(13, 213);
            this.tB_ContraReg.Margin = new System.Windows.Forms.Padding(4);
            this.tB_ContraReg.Name = "tB_ContraReg";
            this.tB_ContraReg.Size = new System.Drawing.Size(248, 25);
            this.tB_ContraReg.TabIndex = 35;
            // 
            // tB_tUsuarioReg
            // 
            this.tB_tUsuarioReg.Font = new System.Drawing.Font("Microsoft YaHei", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tB_tUsuarioReg.Location = new System.Drawing.Point(13, 180);
            this.tB_tUsuarioReg.Margin = new System.Windows.Forms.Padding(4);
            this.tB_tUsuarioReg.Name = "tB_tUsuarioReg";
            this.tB_tUsuarioReg.Size = new System.Drawing.Size(248, 25);
            this.tB_tUsuarioReg.TabIndex = 33;
            // 
            // tB_AmReg
            // 
            this.tB_AmReg.Font = new System.Drawing.Font("Microsoft YaHei", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tB_AmReg.Location = new System.Drawing.Point(13, 141);
            this.tB_AmReg.Margin = new System.Windows.Forms.Padding(4);
            this.tB_AmReg.Name = "tB_AmReg";
            this.tB_AmReg.Size = new System.Drawing.Size(248, 25);
            this.tB_AmReg.TabIndex = 31;
            // 
            // tB_ApReg
            // 
            this.tB_ApReg.Font = new System.Drawing.Font("Microsoft YaHei", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tB_ApReg.Location = new System.Drawing.Point(13, 99);
            this.tB_ApReg.Margin = new System.Windows.Forms.Padding(4);
            this.tB_ApReg.Name = "tB_ApReg";
            this.tB_ApReg.Size = new System.Drawing.Size(248, 25);
            this.tB_ApReg.TabIndex = 29;
            // 
            // tB_NombresReg
            // 
            this.tB_NombresReg.Font = new System.Drawing.Font("Microsoft YaHei", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tB_NombresReg.Location = new System.Drawing.Point(13, 66);
            this.tB_NombresReg.Margin = new System.Windows.Forms.Padding(4);
            this.tB_NombresReg.Name = "tB_NombresReg";
            this.tB_NombresReg.Size = new System.Drawing.Size(248, 25);
            this.tB_NombresReg.TabIndex = 27;
            // 
            // usuarios
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(1132, 553);
            this.Controls.Add(this.dGridV_RegUsuario);
            this.Controls.Add(this.tB_RegistradoPor);
            this.Controls.Add(this.b_elimUsu);
            this.Controls.Add(this.b_editUsu);
            this.Controls.Add(this.b_regUsu);
            this.Controls.Add(this.dTP_fNacReg);
            this.Controls.Add(this.tB_numNomina);
            this.Controls.Add(this.tB_tCasaReg);
            this.Controls.Add(this.tB_tCelReg);
            this.Controls.Add(this.tB_CorreoReg);
            this.Controls.Add(this.tB_ContraReg);
            this.Controls.Add(this.tB_tUsuarioReg);
            this.Controls.Add(this.tB_AmReg);
            this.Controls.Add(this.tB_ApReg);
            this.Controls.Add(this.tB_NombresReg);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Margin = new System.Windows.Forms.Padding(4);
            this.MaximizeBox = false;
            this.Name = "usuarios";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Usuarios";
            this.Load += new System.EventHandler(this.usuarios_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dGridV_RegUsuario)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dGridV_RegUsuario;
        private System.Windows.Forms.TextBox tB_RegistradoPor;
        private System.Windows.Forms.Button b_elimUsu;
        private System.Windows.Forms.Button b_editUsu;
        private System.Windows.Forms.Button b_regUsu;
        private System.Windows.Forms.DateTimePicker dTP_fNacReg;
        private System.Windows.Forms.TextBox tB_numNomina;
        private System.Windows.Forms.TextBox tB_tCasaReg;
        private System.Windows.Forms.TextBox tB_tCelReg;
        private System.Windows.Forms.TextBox tB_CorreoReg;
        private System.Windows.Forms.TextBox tB_ContraReg;
        private System.Windows.Forms.TextBox tB_tUsuarioReg;
        private System.Windows.Forms.TextBox tB_AmReg;
        private System.Windows.Forms.TextBox tB_ApReg;
        private System.Windows.Forms.TextBox tB_NombresReg;
    }
}