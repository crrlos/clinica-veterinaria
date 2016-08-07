
Public Class RegistrarPropietario
   
    Dim consultadb As New ConsultasDB
    Dim op As Integer
    Dim id As Integer


    Private Sub RegistrarCliente_Load(sender As Object, e As EventArgs) Handles MyBase.Load
       End Sub



    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles btnGuardar.Click
        If op = 1 Then
            If consultadb.actualizarPropietario(id, txtNombre.Text, txtTelefono.Text, txtDireccion.Text) Then
                MsgBox("Registro Actualizado")
                txtNombre.Clear()
                txtTelefono.Clear()
                txtDireccion.Clear()
                GroupBox1.Enabled = False
                btnAgregar.Enabled = True
                btnEditar.Enabled = True
                btnEliminar.Enabled = True
                btnCancel.Enabled = True
                txtBuscar.Enabled = True
            End If

        Else
            If consultadb.guardarPropietario(txtNombre.Text, txtTelefono.Text, txtDireccion.Text) Then
                MsgBox("Registro Guardado")
                txtNombre.Clear()
                txtTelefono.Clear()
                txtDireccion.Clear()
                GroupBox1.Enabled = False
                btnAgregar.Enabled = True
                btnEditar.Enabled = True
                btnEliminar.Enabled = True
                btnCancel.Enabled = True
                txtBuscar.Enabled = True
            End If
        End If



    End Sub

    Private Sub txtBuscar_TextChanged(sender As Object, e As EventArgs) Handles txtBuscar.TextChanged
        DataGridView1.DataSource = consultadb.listaPropietarios(txtBuscar.Text)
        


    End Sub

    Private Sub btnAgregar_Click(sender As Object, e As EventArgs) Handles btnAgregar.Click
        GroupBox1.Enabled = True
        btnAgregar.Enabled = False
        btnEditar.Enabled = False
        btnEliminar.Enabled = False
        btnCancel.Enabled = False
        txtBuscar.Enabled = False


    End Sub

    Private Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        txtNombre.Clear()
        txtTelefono.Clear()
        txtDireccion.Clear()
        GroupBox1.Enabled = False
        btnAgregar.Enabled = True
        btnEditar.Enabled = True
        btnEliminar.Enabled = True
        btnCancel.Enabled = True
        txtBuscar.Enabled = True
    End Sub

    Private Sub btnEliminar_Click(sender As Object, e As EventArgs) Handles btnEliminar.Click

        If MessageBox.Show("¿Desea eliminar este registro?", "Alert", MessageBoxButtons.YesNo) = Windows.Forms.DialogResult.Yes Then
            Try
                If consultadb.eliminarPropietario((DataGridView1.CurrentRow.Cells(3).Value)) Then
                    MsgBox("Registro eliminado")
                Else
                    MsgBox("No se pudo borrar el registro")

                End If
            Catch ex As Exception

            End Try
        End If

           

                

    End Sub

    Private Sub btnEditar_Click(sender As Object, e As EventArgs) Handles btnEditar.Click
        If DataGridView1.CurrentRow.Selected Then
            txtNombre.Text = DataGridView1.CurrentRow.Cells(0).Value
            txtTelefono.Text = DataGridView1.CurrentRow.Cells(1).Value
            txtDireccion.Text = DataGridView1.CurrentRow.Cells(2).Value
            op = 1
            id = DataGridView1.CurrentRow.Cells(3).Value
            GroupBox1.Enabled = True
            btnAgregar.Enabled = False
            btnEditar.Enabled = False
            btnEliminar.Enabled = False
            btnCancel.Enabled = False
            txtBuscar.Enabled = False

        End If
    End Sub

    Private Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Me.Close()
    End Sub
End Class