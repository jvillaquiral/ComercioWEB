using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class dspClientes : System.Web.UI.Page
{
    private string strUsuario;
    private string strConexion;
    private string strProceso;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IdUsuarioACWEB"] == null)
            Response.Redirect("dspMensaje.aspx");
        else
            strUsuario = Session["IdUsuarioACWEB"].ToString();
        strConexion = ConfigurationManager.ConnectionStrings["cnxBDPrincipal"].ConnectionString;
        strProceso = "5";
        if (!Page.IsPostBack)
        {
            //Validar acceso a la opci�n
            csCWProcesos_V1_0 objProcesos = new csCWProcesos_V1_0(strConexion, strUsuario, strProceso);
            if (!objProcesos.validarAcceso(1))
                Response.Redirect("dspAccesoInvalido.aspx");
            else
                objProcesos.registrarAuditoria("Visualizando cliente", 2);
        }
    }
    protected void fvwClientes_DataBound(object sender, EventArgs e)
    {
        Label objLabel = (Label)fvwClientes.FindControl("idSexoLabel");
        if (objLabel != null)
        {
            if (objLabel.Text == "0")
                objLabel.Text = "Masculino";
            else
                objLabel.Text = "Femenino";
        }
    }
    protected void btnListado_Click(object sender, EventArgs e)
    {
        Response.Redirect("lstClientes.aspx");
    }
}
