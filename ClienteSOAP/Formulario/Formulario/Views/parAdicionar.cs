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
    public partial class parAdicionar : Form
    {
        public parAdicionar()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                participante p = new participante();

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

        private void button2_Click(object sender, EventArgs e)
        {
            // mesa p = new mesa();

            try
            {
                ServiceMesa.SWmesaClient servicio = new ServiceMesa.SWmesaClient();



                ServiceMesa.mesa[] filtrar = servicio.listarMesas();

                DataTable dt;

                dt = new DataTable();
                dt.Columns.Add("Id Mesa");
                dt.Columns.Add("Localidad");
                dt.Columns.Add("Nombre Lugar");
                dataGridView2.DataSource = dt;

                for (int i = 0; i < filtrar.Length; i++)
                {
                    DataRow row = dt.NewRow();

                    row["Id Mesa"] = filtrar[i].idMesa;
                    row["Localidad"] = filtrar[i].localidad;
                    row["Nombre Lugar"] = filtrar[i].idMesa;

                    dt.Rows.Add(row);
                }
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                SWPartido.SWPartidoClient servicio = new SWPartido.SWPartidoClient();

                SWPartido.partido partido = new SWPartido.partido();

                SWPartido.mesa mesatem = new SWPartido.mesa();
                mesatem.idMesa = Convert.ToInt32(textBox1.Text);
                partido.mesa = mesatem;

                SWPartido.participante par1 = new SWPartido.participante();
                par1.id = Convert.ToInt32(textBox2.Text);
                partido.participante = par1;


                SWPartido.participante par2 = new SWPartido.participante();
                par2.id = Convert.ToInt32(textBox3.Text);
                partido.participante1 = par2;

                partido.ganador = Convert.ToInt32(textBox4.Text);
                partido.ronda = Convert.ToInt32(textBox5.Text);
                partido.fechaProgramada = dateTimePicker1.Value;
                partido.fechaProgramadaSpecified = true;
                partido.horaInicio = dateTimePicker2.Value;
                partido.horaInicioSpecified = true;
                partido.horaFin = dateTimePicker3.Value;
                partido.horaFinSpecified = true;
                partido.torneo = textBox9.Text;



                servicio.crearPartido(partido.mesa.idMesa, partido.participante.id, partido.participante1.id, partido.ganador, partido.ronda, partido.fechaProgramada, partido.horaInicio, partido.horaFin, partido.torneo);
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }

        }
    }
}
