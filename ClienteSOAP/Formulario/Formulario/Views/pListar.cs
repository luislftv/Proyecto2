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
    public partial class pListar : Form
    {
        public static participante p = new participante();
        public pListar()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                SWParticipanteClient servicio = new SWParticipanteClient();

                p.apodo = textBox1.Text;

                participante[] filtrar = servicio.filtrarParticipantePorApodo(p.apodo);

                DataTable dt;

                dt = new DataTable();
                dt.Columns.Add("Id");
                dt.Columns.Add("Apodo");
                dt.Columns.Add("Fecha Inscripción");
                dt.Columns.Add("Fecha Expiración");
                dataGridView1.DataSource = dt;

                for (int i = 0; i < filtrar.Length; i++)
                {
                    DataRow row = dt.NewRow();

                    row["Id"] = filtrar[i].id;
                    row["Apodo"] = filtrar[i].apodo;
                    row["Fecha Inscripción"] = filtrar[i].fechaInscripcion;
                    row["Fecha Expiración"] = filtrar[i].fechaCaducidad;

                    dt.Rows.Add(row);
                }
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

                p.apodo = textBox1.Text;

                participante[] filtrar = servicio.listarParticipantes();

                DataTable dt;

                dt = new DataTable();
                dt.Columns.Add("Id");
                dt.Columns.Add("Apodo");
                dt.Columns.Add("Fecha Inscripción");
                dt.Columns.Add("Fecha Expiración");
                dataGridView1.DataSource = dt;

                for (int i = 0; i < filtrar.Length; i++)
                {
                    DataRow row = dt.NewRow();

                    row["Id"] = filtrar[i].id;
                    row["Apodo"] = filtrar[i].apodo;
                    row["Fecha Inscripción"] = filtrar[i].fechaInscripcion;
                    row["Fecha Expiración"] = filtrar[i].fechaCaducidad;

                    dt.Rows.Add(row);
                }
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }

        }
    }
}
