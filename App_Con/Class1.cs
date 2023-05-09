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
//using System.Data.OleDb;
//using System.Data.SqlClient;
//using System.Data.OracleClient;
using Oracle.DataAccess.Client;



/// <summary>
/// Summary description for Class1
/// </summary>
public  class Class1 : System.Web.UI.Page
{



    OracleConnection Ora_Connection = new OracleConnection();
    OracleDataAdapter Ora_Da = new OracleDataAdapter();
    OracleCommand Ora_Save = new OracleCommand();


    //OleDbCommand Ac_Save = new OleDbCommand();
    //OleDbConnection Ac_Conn = new OleDbConnection();
    //OleDbDataAdapter Da = new OleDbDataAdapter();

  //  SqlDataAdapter _da = new SqlDataAdapter();
   // SqlConnection _conn = new SqlConnection();
    //SqlCommand _save = new SqlCommand();




    public string str, sql;
    public void Save(string str)
    {

        try
        {
            Ora_Save = new OracleCommand(str, Ora_Connection);
            Ora_Save.ExecuteNonQuery();
                        
        }
        catch (Exception)
        {

            return;
        }
    }
    public string Get_MemberFormate(string member_no)
    {
        string mb_no = "";
        Int32 mb = Convert.ToInt32(member_no);
        switch (mb.ToString().Length)
        {
            case 2: mb_no = "000000" + mb.ToString();
                break;
            case 3: mb_no = "00000" + mb.ToString();
                break;
            case 4: mb_no = "0000" + mb.ToString();
                break;
            case 5: mb_no = "000" + mb.ToString();
                break;
            case 6: mb_no = "00" + mb.ToString();
                break;
            case 7: mb_no = "0" + mb.ToString();
                break;
            default:
                mb_no = member_no;           
                break;
        }

        return mb_no;
    }
    public DataTable SelectQuery(string Str)
    {
        string strr = Str;
        DataTable Dt = new DataTable();
        try
        {
            OracleDataAdapter Da = new OracleDataAdapter(strr, Ora_Connection);
            Da.Fill(Dt);

        }
        catch (Exception)
        { }
        return Dt;
    }
    public DataSet SelectQueryDropdown(string Str)
    {
        string strr = Str;
        DataSet Ds = new DataSet();
        try
        {
            OracleDataAdapter Da = new OracleDataAdapter(strr, Ora_Connection);
            Da.Fill(Ds,"show");


            //SqlDataAdapter Da = new SqlDataAdapter(strr, Conn);
            //Da.Fill(Ds, "show");
            //Da.Fill(

        }
        catch (Exception)
        {

        }
        return Ds;
    }

    public void Ac_DB()
    {

      //string str = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("cvsfile\\slip.accdb") + ";Persist Security Info=False;";
      //  Ac_Conn = new OleDbConnection(str);
      //  Ac_Conn.Open();    
    }

    //public DataTable SelectQuery(string str)
    //{

    //    DataTable dt = new DataTable();
    //    OleDbDataAdapter Da = new OleDbDataAdapter(str, Ac_Conn);
    //    Da.Fill(dt);
    //    return dt;    
    //}
    public string Get_txtMM(string strx)
    {
        string str = strx.ToString();
        string xRe = "";
        string yy = str.Substring(0, 4);
        string mm = str.Substring(4, 2);
        switch (mm)
        {
            case "01": xRe = "���Ҥ�"; break;
            case "02": xRe = "����Ҿѹ��"; break;
            case "03": xRe = "�չҤ�"; break;
            case "04": xRe = "����¹"; break;
            case "05": xRe = "����Ҥ�"; break;
            case "06": xRe = "�Զع�¹"; break;
            case "07": xRe = "�á�Ҥ�"; break;
            case "08": xRe = "�ԧ�Ҥ�"; break;
            case "09": xRe = "�ѹ��¹"; break;
            case "10": xRe = "���Ҥ�"; break;
            case "11": xRe = "��Ȩԡ�¹"; break;
            case "12": xRe = "�ѹ�Ҥ�"; break;
            default:
                break;
        }

     //   return xRe + " �� " + yy;
        return xRe;
    }

    public  string ThaiBaht(string txt)
    {
        string bahtTxt, n, bahtTH = "";
        double amount;
        try { amount = Convert.ToDouble(txt); }
        catch { amount = 0; }
        bahtTxt = amount.ToString("####.00");
        string[] num = { "�ٹ��", "˹��", "�ͧ", "���", "���", "���", "ˡ", "��", "Ỵ", "���", "�Ժ" };
        string[] rank = { "", "�Ժ", "����", "�ѹ", "����", "�ʹ", "��ҹ" };
        string[] temp = bahtTxt.Split('.');
        string intVal = temp[0];
        string decVal = temp[1];
        if (Convert.ToDouble(bahtTxt) == 0)
            bahtTH = "�ٹ��ҷ��ǹ";
        else
        {
            for (int i = 0; i < intVal.Length; i++)
            {
                n = intVal.Substring(i, 1);
                if (n != "0")
                {
                    if ((i == (intVal.Length - 1)) && (n == "1"))
                        bahtTH += "���";
                    else if ((i == (intVal.Length - 2)) && (n == "2"))
                        bahtTH += "���";
                    else if ((i == (intVal.Length - 2)) && (n == "1"))
                        bahtTH += "";
                    else
                        bahtTH += num[Convert.ToInt32(n)];
                    bahtTH += rank[(intVal.Length - i) - 1];
                }
            }
            bahtTH += "�ҷ";
            if (decVal == "00")
                bahtTH += "��ǹ";
            else
            {
                for (int i = 0; i < decVal.Length; i++)
                {
                    n = decVal.Substring(i, 1);
                    if (n != "0")
                    {
                        if ((i == decVal.Length - 1) && (n == "1"))
                            bahtTH += "���";
                        else if ((i == (decVal.Length - 2)) && (n == "2"))
                            bahtTH += "���";
                        else if ((i == (decVal.Length - 2)) && (n == "1"))
                            bahtTH += "";
                        else
                            bahtTH += num[Convert.ToInt32(n)];
                        bahtTH += rank[(decVal.Length - i) - 1];
                    }
                }
                bahtTH += "ʵҧ��";
            }
        }
        return bahtTH;
    }

    //public void SaveCounter(string MemID)
    //{
    //    string Cur_MM = Convert.ToString(((DateTime.Now.Year) + 543) + DateTime.Now.Date.ToString("MM"));
    //    string sql = "select  ddate from xCounter where  ddate='" + Cur_MM + "'";
    //    DataTable dt = SelectQuery(sql);
    //    if (dt.Rows.Count <= 0)
    //    {
    //        sql = "insert into xCounter values('" + Cur_MM + "',0)";
    //       // Ac_Save = new OleDbCommand(sql, Ac_Conn);
    //       // Ac_Save.ExecuteNonQuery();

    //        _save = new SqlCommand(sql,_conn);
    //        _save.ExecuteNonQuery();

    //    }

    //    sql = "update xCounter set xcount=xcount+1 where ddate='" + Cur_MM + "'";
    //    //Ac_Save = new OleDbCommand(sql, Ac_Conn);
    //   // Ac_Save.ExecuteNonQuery();
    //    _save = new SqlCommand(sql, _conn);
    //    _save.ExecuteNonQuery();

    //    DateTime dts = DateTime.Now;
    //    string dtx = String.Format("{0:dd/MM/yyyy HH:mm:ss}", dts);
    //    sql = "update MBMEMBMASTER set xCount=xCount+1,xUpdate='"+ dtx +"' where member_no='" + MemID + "' ";
    //    //Ac_Save = new OleDbCommand(sql, Ac_Conn);
    //    //Ac_Save.ExecuteNonQuery();

    //    _save = new SqlCommand(sql, _conn);
    //    _save.ExecuteNonQuery();



    //}
    public void SaveACC(string str)
    {
        //try
        //{
        //    Ac_Save = new OleDbCommand(str, Ac_Conn);
        //    Ac_Save.ExecuteNonQuery();
        //}
        //catch (Exception)
        //{

        //    return;
        //}
    }
   
    public String GetDb()
    {
        string Strconn = "";

        try
        {
            //  string str = "Data Source=scotdat;User Id=tch_lampang;Password=tch_lampang;Pooling=False;";

            //string str = "Data Source=192.168.7.221/gcoop;Persist Security Info=True;User ID=iscolap;Password=iscolap;Unicode=True;";

            Strconn = "Data Source=192.168.7.221/gcoop;Persist Security Info=True;User ID=iscgcmt;Password=iscgcmt;";

            Ora_Connection = new OracleConnection(Strconn);
            
            Ora_Connection.Open();
        }
        catch (Exception ex)
        {

            //Form1.msg = "�Դ��Ҵ !! Connect �ҹ������ Oracle  �����";
         //   MessageBox.Show("�Դ�ѭ�����Ǿ���ͧ " + ex.ToString());
           // return;
        }

        return Strconn;


        //if (Session["Username"].ToString() == "")
        //{
       // //    Response.Redirect("");
       //// if (db == null)
       // {
       //     db = "172.16.13.127";
       // }

        //switch (db.ToUpper())
        //{
        //    case "LOCAL":
        //        //  Strconn = "server='comcenter13'; UID='sa';PWD='lphpdc'; Database='OlderPerson';timeout=120;pooling=false";
        //        Strconn = "server='172.16.0.3'; UID='sa';PWD='lphpdc'; Database='OlderPerson';timeout=120;pooling=false";
        //        break;
        //    case "BLADE5":
        //        Strconn = "Server='172.16.13.127';Database=SSBHospital;UID=sa;PWD=lphpdc";
        //        break;
        //    case "FRONT-OFFICE":
        //        Strconn = "Server='172.16.13.84';Database=SSBHospital;UID=sa;PWD=lphpdc";
        //        break;
        //    case "PAYROLL":
        //        Strconn = "Server='172.16.13.127';Database=SSBPayroll;UID=sa;PWD=lphpdc";
        //        break;

        //    default:
        //        break;
        //}

    //string  Strconn = @"server='SCOSERVER_BACK\WEB_LPTCOOP'; UID='sa';PWD='lptcoop'; Database='Ecoop';timeout=120;pooling=false";

    //    string Strconn = @"server='adminesso'; UID='sa';PWD='lptcoop'; Database='Ecoop';timeout=120;pooling=false";

    //   // string Strconn = "server='192.168.2.200/lptcoop'; UID='sa';PWD='lptcoop'; Database='Ecoop';";
    //try
    //{
    //    _conn = new SqlConnection(Strconn);
    //    _conn.Open();
    //}
    //catch (Exception ex)
    //{
    //    _conn.Close();
    //    Msgbox.Show(ex.ToString());
    //}
        //return Strconn;
    }

    

    public string Get_MM_format(int M)
    {
        string xReturn = "";
        switch (M.ToString().Length)
        {
            case 1: xReturn = "0" + M.ToString(); break;
            case 2: xReturn = M.ToString(); break;
            default:
                break;
        }
        return xReturn;
    }
}
