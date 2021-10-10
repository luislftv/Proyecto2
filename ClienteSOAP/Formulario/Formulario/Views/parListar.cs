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
    public partial class parListar : Form
    {
        public parListar()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SWPartido.SWPartidoClient servicio = new SWPartido.SWPartidoClient();

           // p.apodo = textBox1.Text;

            SWPartido.partido[] filtrar = servicio.listarTodosLosPartidos();

            DataTable dt;

            dt = new DataTable();
            dt.Columns.Add("Id Mesa");
            dt.Columns.Add("Apodo Participante 1");
            dt.Columns.Add("Apodo Participante 2");
            dt.Columns.Add("Ganador");
            dt.Columns.Add("Ronda");
            dt.Columns.Add("Fecha Programada");
            dt.Columns.Add("Hora Inicio");
            dt.Columns.Add("Hora Fin");
            dt.Columns.Add("Torneo");
            dataGridView1.DataSource = dt;

            for (int i = 0; i < filtrar.Length; i++)
            {
                DataRow row = dt.NewRow();

                row["Id Mesa"] = filtrar[i].partidoPK.mesaId;
                row["Apodo Participante 1"] = filtrar[i].partidoPK.parcipante1;
                row["Apodo Participante 2"] = filtrar[i].partidoPK.parcipante2;
                row["Ganador"] = filtrar[i].ganador;
                row["Ronda"] = filtrar[i].ronda;
                row["Fecha Programada"] = filtrar[i].fechaProgramada;
                row["Hora Inicio"] = filtrar[i].horaInicio;
                row["Hora Fin"] = filtrar[i].horaFin;
                row["Torneo"] = filtrar[i].torneo;

                dt.Rows.Add(row);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SWParticipante.SWParticipanteClient servicio = new SWParticipante.SWParticipanteClient();



            SWParticipante.partido[] filtrar = servicio.listarPartidosDeUnParticipante(Convert.ToInt32(textBox1.Text));

            DataTable dt;

            dt = new DataTable();
            dt.Columns.Add("Id Mesa");
            dt.Columns.Add("Apodo Participante 1");
            dt.Columns.Add("Apodo Participante 2");
            dt.Columns.Add("Ganador");
            dt.Columns.Add("Ronda");
            dt.Columns.Add("Fecha Programada");
            dt.Columns.Add("Hora Inicio");
            dt.Columns.Add("Hora Fin");
            dt.Columns.Add("Torneo");
            dataGridView1.DataSource = dt;

            for (int i = 0; i < filtrar.Length; i++)
            {
                DataRow row = dt.NewRow();

                row["Id Mesa"] = filtrar[i].partidoPK.mesaId;
                row["Apodo Participante 1"] = filtrar[i].partidoPK.parcipante1;
                row["Apodo Participante 2"] = filtrar[i].partidoPK.parcipante2;
                row["Ganador"] = filtrar[i].ganador;
                row["Ronda"] = filtrar[i].ronda;
                row["Fecha Programada"] = filtrar[i].fechaProgramada;
                row["Hora Inicio"] = filtrar[i].horaInicio;
                row["Hora Fin"] = filtrar[i].horaFin;
                row["Torneo"] = filtrar[i].torneo;

                dt.Rows.Add(row);
            }
        }
    }
}
