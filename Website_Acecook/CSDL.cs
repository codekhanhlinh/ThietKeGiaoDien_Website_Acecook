using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Website_Acecook
{
    public class CSDL
    {
        public CSDL()
        {

        }
        public string chuoiketnoi = ConfigurationManager.ConnectionStrings["conn"].ConnectionString.ToString();
        public SqlConnection getConnection()
        {
            SqlConnection conn = new SqlConnection(chuoiketnoi);
            conn.Open();
            return conn;
        }

        public DataTable GetData(string sql)
        {
            SqlConnection cnn = new SqlConnection(chuoiketnoi);
            try
            {
                SqlDataAdapter sqlDa = new SqlDataAdapter(sql, cnn);
                DataTable dt = new DataTable();
                sqlDa.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Excute(string sql)
        {
            SqlConnection cnn = new SqlConnection(chuoiketnoi);
            cnn.Open();
            SqlCommand cmd = new SqlCommand(sql, cnn);
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

        public string GetValue(string sql)
        {
            using (SqlConnection sqlCon = new SqlConnection(chuoiketnoi))
            {
                sqlCon.Open();
                SqlCommand cmd = new SqlCommand(sql, sqlCon);
                string val = cmd.ExecuteScalar().ToString();
                sqlCon.Close();
                return (val);
            }
        }
        public DataTable GetData(string query, SqlParameter[] parameters)
        {
            string connectionString = "Data Source=LAPTOP-QB932246\\SQLEXPRESS;Initial Catalog=CSDLAcecook;Integrated Security=True;";

            DataTable dataTable = new DataTable();

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        if (parameters != null)
                        {
                            command.Parameters.AddRange(parameters);
                        }

                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            adapter.Fill(dataTable);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Lỗi: " + ex.Message);
            }

            return dataTable;
        }

        public void ExecuteNonQuery(string query, SqlParameter[] parameters)
        {
            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters);
                    }

                    command.ExecuteNonQuery();
                }
            }
        }


    }


}