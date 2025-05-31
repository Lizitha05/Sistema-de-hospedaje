namespace MAD
{
    partial class pIniciarSesion
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(pIniciarSesion));
            this.tb_ContraseñaUsuario = new System.Windows.Forms.TextBox();
            this.tb_CorreoUsuario = new System.Windows.Forms.TextBox();
            this.b_IniciarSesion = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // tb_ContraseñaUsuario
            // 
            this.tb_ContraseñaUsuario.Font = new System.Drawing.Font("Microsoft YaHei", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tb_ContraseñaUsuario.Location = new System.Drawing.Point(362, 336);
            this.tb_ContraseñaUsuario.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.tb_ContraseñaUsuario.Name = "tb_ContraseñaUsuario";
            this.tb_ContraseñaUsuario.Size = new System.Drawing.Size(300, 34);
            this.tb_ContraseñaUsuario.TabIndex = 0;
            // 
            // tb_CorreoUsuario
            // 
            this.tb_CorreoUsuario.Font = new System.Drawing.Font("Microsoft YaHei", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tb_CorreoUsuario.Location = new System.Drawing.Point(362, 233);
            this.tb_CorreoUsuario.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.tb_CorreoUsuario.Name = "tb_CorreoUsuario";
            this.tb_CorreoUsuario.Size = new System.Drawing.Size(300, 34);
            this.tb_CorreoUsuario.TabIndex = 1;
            // 
            // b_IniciarSesion
            // 
            this.b_IniciarSesion.BackgroundImage = global::MAD.Properties.Resources.Boton;
            this.b_IniciarSesion.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.b_IniciarSesion.Font = new System.Drawing.Font("Microsoft YaHei", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.b_IniciarSesion.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.b_IniciarSesion.ImageAlign = System.Drawing.ContentAlignment.TopLeft;
            this.b_IniciarSesion.Location = new System.Drawing.Point(362, 446);
            this.b_IniciarSesion.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.b_IniciarSesion.Name = "b_IniciarSesion";
            this.b_IniciarSesion.Size = new System.Drawing.Size(300, 36);
            this.b_IniciarSesion.TabIndex = 2;
            this.b_IniciarSesion.Text = "Iniciar sesión";
            this.b_IniciarSesion.UseVisualStyleBackColor = true;
            this.b_IniciarSesion.Click += new System.EventHandler(this.b_IniciarSesion_Click);
            // 
            // pIniciarSesion
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(1123, 592);
            this.Controls.Add(this.b_IniciarSesion);
            this.Controls.Add(this.tb_CorreoUsuario);
            this.Controls.Add(this.tb_ContraseñaUsuario);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.MaximizeBox = false;
            this.Name = "pIniciarSesion";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "pIniciarSesion";
            this.Load += new System.EventHandler(this.pIniciarSesion_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox tb_ContraseñaUsuario;
        private System.Windows.Forms.TextBox tb_CorreoUsuario;
        private System.Windows.Forms.Button b_IniciarSesion;
    }
}