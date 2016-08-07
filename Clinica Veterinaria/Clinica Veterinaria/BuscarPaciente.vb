Public Class BuscarPaciente

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim consulta As New Consulta
        consulta.MdiParent = Me.MdiParent
        consulta.Show()


    End Sub
End Class