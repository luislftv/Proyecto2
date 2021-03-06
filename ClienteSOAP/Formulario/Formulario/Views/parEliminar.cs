using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Formulario.Views
{
    public partial class parEliminar : Form
    {
        public parEliminar()
        {
            InitializeComponent();
        }

        private SWPartido.partido part = new SWPartido.partido();
        private void button3_Click(object sender, EventArgs e)
        {
            SWPartido.SWPartidoClient servicio = new SWPartido.SWPartidoClient();

            SWPartido.partido partido = new SWPartido.partido();
            SWPartido.mesa mesa = new SWPartido.mesa();
            SWPartido.participante partici1 = new SWPartido.participante();
            SWPartido.participante partici2 = new SWPartido.participante();
            mesa.idMesa = Convert.ToInt32 (textBox1.Text);
            partici1.id = Convert.ToInt32(textBox2.Text);
            partici2.id = Convert.ToInt32(textBox3.Text);

            partido.mesa = mesa;
            partido.participante = partici1;
            partido.participante1 = partici2;

            SWPartido.partido[] partidoE = new SWPartido.partido[1];
            partidoE = servicio.listarPorId(mesa.idMesa, partici1.id, partici2.id);
            if (partidoE == null)
            {
                throw new Exception("No se encontro el partido deseado");

            }
            else
            {
                MessageBox.Show("Se encontro el partido deseado");
            }

            textBox1.Text = Convert.ToString(partidoE[0].partidoPK.mesaId);
            textBox2.Text = Convert.ToString(partidoE[0].partidoPK.parcipante1);
            textBox3.Text = Convert.ToString(partidoE[0].partidoPK.parcipante2);

            textBox4.Text = partidoE[0].ganador.ToString();
            textBox5.Text = partidoE[0].ronda.ToString();

            dateTimePicker1.Value = partidoE[0].fechaProgramada;
            dateTimePicker2.Value = partidoE[0].horaInicio;
            dateTimePicker3.Value = partidoE[0].horaFin;

            textBox9.Text = partidoE[0].torneo;

            part = partidoE[0];

        }

        private void button1_Click(object sender, EventArgs e)
        {
            SWPartido.partido par = part;
            SWPartido.SWPartidoClient servicio = new SWPartido.SWPartidoClient();
            SWPartido.mesa mesatem = new SWPartido.mesa();
            mesatem.idMesa = Convert.ToInt32(textBox1.Text);
            par.mesa = mesatem;

            SWPartido.participante par1 = new SWPartido.participante();
            par1.id = Convert.ToInt32(textBox2.Text);
            par.participante = par1;


            SWPartido.participante par2 = new SWPartido.participante();
            par2.id = Convert.ToInt32(textBox3.Text);
            par.participante1 = par2;


            int res;
            res = servicio.eliminarPartido(par.mesa.idMesa, par.participante.id, par.participante1.id);
            
            if (res == 1)
            {
                throw new Exception("No se pudo eliminar el partido en la base de datos");
            }
            else
            {
                MessageBox.Show("Se ha eliminado el partido");
            }
        }
    }
}
