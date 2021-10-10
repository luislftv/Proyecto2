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
    public partial class pActualizar : Form
    {
        public static participante p = new participante();
        public pActualizar()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                SWParticipanteClient servicio = new SWParticipanteClient();

                p.id = Convert.ToInt32(textBox1.Text);

                p = servicio.buscarParticipante(Convert.ToInt32(textBox1.Text));

                textBox2.Text = p.apodo;
                dateTimePicker1.Value = p.fechaInscripcion;

                dateTimePicker2.Value = p.fechaCaducidad;
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }

        } 

        private void button2_Click(object sender, EventArgs e)
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

                servicio.actualizarParticipante(participante.id,participante.apodo,participante.fechaInscripcion,participante.fechaCaducidad);
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }
        }

        private void pActualizar_Load(object sender, EventArgs e)
        {

        }
    }
}
