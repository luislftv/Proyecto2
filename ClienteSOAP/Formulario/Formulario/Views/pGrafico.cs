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
using System.Windows.Forms.DataVisualization.Charting;

namespace Formulario
{
    public partial class pGrafico : Form
    {
        public pGrafico()
        {
            InitializeComponent();
        }
        public static participante p = new participante();
        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void chart1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {

                SWParticipanteClient servicio = new SWParticipanteClient();

                p.id = Convert.ToInt32(textBox1.Text);

                p = servicio.buscarParticipante(p.id);
                int?[] datos = servicio.Estadisticas(p.id);



                String[] series = { "Blancas", "Negras" };
                chart1.Titles.Add("Jugador");

                for (int i = 0; i < series.Length; i++)
                {
                    Series serie = chart1.Series.Add(series[i]);

                    serie.Label = datos[i].ToString();
                    serie.Points.Add(Convert.ToInt32(datos[i]));
                }
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }
            

            
        }
    }
}
