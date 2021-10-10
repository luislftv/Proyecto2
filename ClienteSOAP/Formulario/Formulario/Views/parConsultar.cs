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
    public partial class parConsultar : Form
    {
        public parConsultar()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                SWPartido.SWPartidoClient servicio = new SWPartido.SWPartidoClient();

                SWPartido.partido partido = new SWPartido.partido();
                SWPartido.mesa mesa = new SWPartido.mesa();
                SWPartido.participante partici1 = new SWPartido.participante();
                SWPartido.participante partici2 = new SWPartido.participante();
                mesa.idMesa = Convert.ToInt32(textBox1.Text);
                partici1.id = Convert.ToInt32(textBox2.Text);
                partici2.id = Convert.ToInt32(textBox3.Text);

                partido.mesa = mesa;
                partido.participante = partici1;
                partido.participante1 = partici2;

                SWPartido.partido[] partidoE = new SWPartido.partido[1];
                partidoE = servicio.listarPorId(mesa.idMesa, partici1.id, partici2.id);


                textBox1.Text = Convert.ToString(partidoE[0].mesa.idMesa);
                textBox2.Text = Convert.ToString(partidoE[0].participante.id);
                textBox3.Text = Convert.ToString(partidoE[0].participante1.id);

                textBox4.Text = partidoE[0].ganador.ToString();
                textBox5.Text = partidoE[0].ronda.ToString();

                dateTimePicker1.Value = partidoE[0].fechaProgramada;
                dateTimePicker2.Value = partidoE[0].horaInicio;
                dateTimePicker3.Value = partidoE[0].horaFin;

                textBox9.Text = partidoE[0].torneo;
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }
        }
    }
}
