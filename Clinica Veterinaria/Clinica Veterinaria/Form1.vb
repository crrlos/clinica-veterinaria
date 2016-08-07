Public Class Form1

    Private Sub RegistrarPacienteToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RegistrarPacienteToolStripMenuItem.Click
        Dim registroPacientes As New RegistroPacientes
        registroPacientes.MdiParent = Me
        registroPacientes.Show()




    End Sub

    Private Sub AgregarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles AgregarToolStripMenuItem.Click
        Dim registrarCliente As New RegistrarPropietario
        registrarCliente.MdiParent = Me
        registrarCliente.Show()



    End Sub

    Private Sub BuscarPacienteToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles BuscarPacienteToolStripMenuItem.Click
        Dim buscarPaciente As New BuscarPaciente
        buscarPaciente.MdiParent = Me
        buscarPaciente.Show()


    End Sub
End Class
