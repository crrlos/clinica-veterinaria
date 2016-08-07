Public Class SeleccionarPropietario
    Dim consultadb As New ConsultasDB
    Public _propietario As New Propietarios
    Public ReadOnly Property Propietario As Propietarios
        Get
            Return _propietario
        End Get
    End Property

    Private Sub SeleccionarDueño_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        DataGridView1.ColumnCount = 4
        DataGridView1.AutoGenerateColumns = False
        DataGridView1.Columns(0).DataPropertyName = "Nombre"
        DataGridView1.Columns(1).DataPropertyName = "Telefono"
        DataGridView1.Columns(2).DataPropertyName = "Direccion"
        DataGridView1.Columns(3).DataPropertyName = "Id"

        DataGridView1.Columns(0).Name = "Nombre"
        DataGridView1.Columns(1).Name = "Telefono"
        DataGridView1.Columns(2).Name = "Direccion"
        DataGridView1.Columns(3).Name = "Id"

        DataGridView1.Columns(0).Width = 300
        DataGridView1.Columns(1).Width = 100
        DataGridView1.Columns(2).Width = 300
        DataGridView1.Columns(3).Width = 50

    End Sub

    Private Sub TextBox1_TextChanged(sender As Object, e As EventArgs) Handles txtNombre.TextChanged
        DataGridView1.DataSource = consultadb.listaPropietarios(txtNombre.Text)
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If DataGridView1.SelectedRows.Count > 0 Then
            Propietario.Nombre = DataGridView1.CurrentRow.Cells(0).Value.ToString
            
            DialogResult = DialogResult.OK
            Me.Close()
        Else
            MsgBox("no ha seleccionad nada")
        End If
    End Sub
End Class