Imports System.Data
Imports System.Data.OleDb
Imports System.Data.SqlClient
Public Class ConsultasDB
    Dim conexion As OleDbConnection
    Dim command As OleDbCommand
    Dim reader As OleDbDataReader
    Dim cadena As String = "Provider=sqloledb;Data Source =.\sqlexpress; Initial Catalog =clinica; User Id=admin3;Password=admin"
    Dim query As String

    Private Function conectar()
        Try
            conexion = New OleDbConnection(cadena)
            conexion.Open()
            Return True
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        Return False
    End Function

    Private Function desconectar()
        If conexion.State = ConnectionState.Open Then
            conexion.Close()
        End If
        Return True
    End Function


    Public Function listaDepartamentos() As List(Of String)
        Dim departamentos As New List(Of String)
        Try
            If conectar() Then
                command = New OleDbCommand("select * from departamentos")
                command.Connection = conexion
                reader = command.ExecuteReader
                While reader.Read
                    departamentos.Add(reader("departamento"))
                End While
                desconectar()
            End If
        Catch ex As Exception

        End Try
        Return departamentos
    End Function
    Public Function listaMunicipios(ByRef departamento) As List(Of String)
        Dim municipios As New List(Of String)
        Dim query As String = "select municipio from municipios m, departamentos d where d.departamento = '" + "departamento' and d.iddepartamento = m.iddepartamento"
        Try
            If conectar() Then
                command = New OleDbCommand("select * from municipios ")
                command.Connection = conexion
                reader = command.ExecuteReader
                While reader.Read
                    municipios.Add(reader("municipio"))
                End While
                desconectar()
            End If
        Catch ex As Exception

        End Try
        Return municipios
    End Function

    Public Function listaPropietarios(ByRef criterio As String) As List(Of Propietarios)
        Dim lista As New List(Of Propietarios)

        Dim query As String = "select * from propietarios where nombre like '" + criterio + "%'"

        Try
            If conectar() Then
                command = New OleDbCommand(query)
                command.Connection = conexion
                reader = command.ExecuteReader
                While reader.Read
                    lista.Add(New Propietarios(reader("idpropietario"), reader("nombre"), reader("telefono"), reader("direccion")))
                End While

                desconectar()
            End If
        Catch ex As Exception

        End Try
        Return lista
    End Function

    Public Function guardarPropietario(ByRef nombre, ByRef telefono, ByRef direccion) As Boolean
        Dim query As String = "insert into propietarios values('" + nombre + "','" + telefono + "','" + direccion + "')"
        Try
            If conectar() Then
                command = New OleDbCommand(query)
                command.Connection = conexion
                command.ExecuteNonQuery()
            End If

            Return True

        Catch ex As Exception
            Return False
        End Try

    End Function
    Public Function eliminarPropietario(ByRef id As Integer) As Boolean
        Dim query As String = "delete from propietarios where idpropietario = " + id.ToString

        Try
            If conectar() Then
                command = New OleDbCommand(query)
                command.Connection = conexion
                command.ExecuteNonQuery()
                desconectar()
            End If
            Return True
        Catch ex As Exception
            MsgBox(ex.Message)
            Return False
        End Try
    End Function
    Public Function actualizarPropietario(ByRef id, ByRef nombre, ByRef telefono, ByRef direccion) As Boolean
        Dim query As String = "update propietarios set nombre = '" + nombre.ToString + "',telefono = '" + telefono.ToString + "', direccion = '" + direccion.ToString + "' where idpropietario = " + id.ToString

        Try
            If conectar() Then
                command = New OleDbCommand(query)
                command.Connection = conexion
                command.ExecuteNonQuery()
                desconectar()
            End If
            Return True
        Catch ex As Exception
            MsgBox(ex.Message)
            Return False
        End Try
    End Function



End Class
