<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ex02FutureValue.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chapter 2: Future Value</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            height: 38px;
        }
        .auto-style4 {
            width: 276px;
        }
        .auto-style5 {
            height: 38px;
            width: 276px;
        }
    </style>
</head>
<body>
    <img src="Images/MurachLogo.jpg" alt="Murach Logo" /> 
    <h1>401K Future Value Calculator</h1>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">Monthly Investment</td>
                <td>
                    <asp:DropDownList ID="ddl_Month" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Annual Interest Rate</td>
                <td>
                    <asp:TextBox ID="tb_InterestRate" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Number of Years</td>
                <td class="auto-style3">
                    <asp:TextBox ID="tb_NumYears" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Future Value</td>
                <td>
                    <asp:Label ID="lb_FutureValue" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Button ID="Button1" runat="server" Text="Calculate" OnClick="btnCalculate_Click" />
                </td>
                <td>
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" Text="Clear" OnClick="btnClear_Click" />
                </td>
            </tr>
        </table>
    
    </div>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="tb_InterestRate" ErrorMessage="Interest rate is required" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tb_InterestRate" Display="Dynamic" ErrorMessage="Interest rate must range from 1 to 20" MinimumValue="1" MaximumValue="20" Type="Double" ForeColor="Red"></asp:RangeValidator>
        <p>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_NumYears" ErrorMessage="Number of years is required" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="tb_NumYears" Display="Dynamic" ErrorMessage="Number of years must range from 1 to 45" MinimumValue="1" MaximumValue="45" Type="Double" ForeColor="Red"></asp:RangeValidator>
        </p>
    </form>
</body>
</html>
