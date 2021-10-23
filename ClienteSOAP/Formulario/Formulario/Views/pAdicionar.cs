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
    public partial class pAdicionar : Form
    {
        public pAdicionar()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                SWParticipanteClient servicio = new SWParticipanteClient();

                participante participante = new participante();

                participante.id = Convert.ToInt32(textBox1.Text);
                participante.apodo = textBox2.Text;
                participante.fechaInscripcion = dateTimePicker1.Value;
                participante.fechaInscripcionSpecified = true;
                participante.fechaCaducidad = dateTimePicker2.Value;
                participante.fechaCaducidadSpecified = true;

                int res;

                res = servicio.crearParticipante(participante.id, participante.apodo, participante.fechaInscripcion, participante.fechaCaducidad);
                
                if (res == 0)
                {
                    MessageBox.Show("Se ha agregado con exito el participante");
                }
                else
                {
                    MessageBox.Show("No se puede agregar este participante");
                }

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }



        }
    }
}
