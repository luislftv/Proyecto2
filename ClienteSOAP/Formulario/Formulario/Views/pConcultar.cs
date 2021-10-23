using Formulario.SWParticipante;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Formulario
{
    public partial class pConcultar : Form
    {
        public pConcultar()
        {
            InitializeComponent();
        }

        //public static participante p = new participante();
        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                SWParticipanteClient servicio = new SWParticipanteClient();

                //p.id = Convert.ToInt32(textBox1.Text);

                participante par = new participante(); 

                par = servicio.buscarParticipante(Convert.ToInt32(textBox1.Text));
                
                if (par == null)
                {
                    throw new Exception("No existe el participante en la base de datos");
                }
                else
                {
                    MessageBox.Show("Se ha encontrado el participante");
                }

                textBox2.Text = par.apodo;
                dateTimePicker1.Value = par.fechaInscripcion;

                dateTimePicker2.Value = par.fechaCaducidad;
                
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }



        }
    }
}
