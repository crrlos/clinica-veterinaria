Public Class Propietarios
    Private _id As Integer
    Private _nombre As String
    Private _telefono As String
    Private _direccion As String

    Public Sub New(ByRef id, ByRef nombre, ByRef telefono, ByRef direccion)
        _id = id
        _nombre = nombre
        _telefono = telefono
        _direccion = direccion

    End Sub
    Public Sub New()

    End Sub


    Public Property Nombre As String
        Get
            Return _nombre
        End Get
        Set(value As String)
            _nombre = value

        End Set
    End Property
    Public Property Telefono As String
        Get
            Return _telefono
        End Get
        Set(value As String)
            _telefono = value

        End Set
    End Property
    Public Property Direccion As String
        Get
            Return _direccion
        End Get
        Set(value As String)
            _direccion = value

        End Set
    End Property

    Public Property Id As Integer
        Get
            Return _id
        End Get
        Set(value As Integer)
            _id = value
        End Set
    End Property

End Class
