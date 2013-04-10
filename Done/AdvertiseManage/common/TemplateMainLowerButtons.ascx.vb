
Namespace common
    Partial Class TemplateMainLowerButtons
        Inherits UserControl

        Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
            copyrightlabel.Text = Resources.Resource.Copyright.ToString + " © " + Date.Now.Year.ToString
        End Sub
    End Class
End Namespace