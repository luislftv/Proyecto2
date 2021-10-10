using Formulario.Views;
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
    public partial class Principal : Form
    {
        public Principal()
        {
            InitializeComponent();
        }

        private void crearParticipanteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            pAdicionar pAdicionar = new pAdicionar();
            pAdicionar.Show();
        }

        private void jugadorToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void consultarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            pConcultar pConcultar = new pConcultar();
            pConcultar.Show();
        }

        private void actualizarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            pActualizar pActualizar = new pActualizar();
            pActualizar.Show();
        }

        private void eliminarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            pEliminar pEliminar = new pEliminar();
            pEliminar.Show();
        }

        private void listarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            pListar pListar = new pListar();
            pListar.Show();
        }

        private void adicionarToolStripMenuItem_Click(object sender, EventArgs e)
        {
            parAdicionar parAdicionar = new parAdicionar();
            parAdicionar.Show();
        }

        private void eliminarToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            parEliminar parEliminar = new parEliminar();
            parEliminar.Show();
        }

        private void graficoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            pGrafico pGrafico = new pGrafico();
            pGrafico.Show();
        }

        private void consultarToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            parConsultar parConsultar = new parConsultar();
            parConsultar.Show();
        }

        private void actualizarToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            parAtualziar parAtualziar = new parAtualziar();
            parAtualziar.Show();
        }

        private void listarToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            parListar parListar = new parListar();
            parListar.Show();
        }

        private void graficoToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            parGrafico parGrafico = new parGrafico();
            parGrafico.Show();
        }

        private void salirToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}
