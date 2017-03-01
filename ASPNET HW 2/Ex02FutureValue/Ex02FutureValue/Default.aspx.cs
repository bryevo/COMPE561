using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ex02FutureValue
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
                for (int i = 50; i <= 500; i += 50)
                    ddl_Month.Items.Add(i.ToString());
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                int monthlyInvestment =
                    Convert.ToInt32(ddl_Month.SelectedValue);
                decimal yearlyInterestRate =
                    Convert.ToDecimal(tb_InterestRate.Text);
                int years = Convert.ToInt32(tb_NumYears.Text);
                decimal futureValue = this.CalculateFutureValue(
                    monthlyInvestment, yearlyInterestRate, years);
                lb_FutureValue.Text = futureValue.ToString("c");
            }
        }

        protected decimal CalculateFutureValue(int monthlyInvestment,
                        decimal yearlyInterestRate, int years)
        {
            int months = years * 12;
            decimal monthlyInterestRate = yearlyInterestRate / 12 / 100;
            decimal futureValue = 0;
            for (int i = 0; i < months; i++)
            {
                futureValue = (futureValue + monthlyInvestment) *
                                (1 + monthlyInterestRate);
            }
            return futureValue;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ddl_Month.SelectedIndex = 0;
            tb_InterestRate.Text = "";
            tb_NumYears.Text = "";
            lb_FutureValue.Text = "";
        }

    }
}