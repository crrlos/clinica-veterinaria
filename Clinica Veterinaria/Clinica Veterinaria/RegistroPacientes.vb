Public Class RegistroPacientes

    Private Sub Button1_Click(sender As Object, e As EventArgs)
        Dim seleccionarRaza As New SeleccionarRaza
        seleccionarRaza.ShowDialog(Me)



    End Sub

    

    Private Sub Button2_Click_1(sender As Object, e As EventArgs) Handles Button2.Click
        Dim seleccionardueño As New SeleccionarPropietario

        If seleccionardueño.ShowDialog(Me) = System.Windows.Forms.DialogResult.OK Then
            txtDueño.Text = seleccionardueño.Propietario.Nombre
        Else
            MsgBox("no fue ok")
        End If


    End Sub
End Class