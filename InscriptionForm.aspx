<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InscriptionForm.aspx.cs" Inherits="Project.InscriptionForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inscription Form</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: center;
            font-size: x-large;
        }
        .auto-style3 {
            width: 358px;
            text-align: center;
        }
        .auto-style5 {
            width: 355px;
            height: 33px;
        }
        .auto-style6 {
            width: 358px;
            height: 33px;
            text-align: center;
        }
        .auto-style7 {
            height: 33px;
        }
        .auto-style8 {
            height: 31px;
        }
        .auto-style9 {
            text-align: center;
            font-size: x-large;
            height: 45px;
        }
        .auto-style10 {
            margin-left: 0px;
        }
        .auto-style12 {
            height: 31px;
            width: 363px;
        }
        .auto-style14 {
            height: 31px;
            width: 358px;
            text-align: center;
        }
        .auto-style15 {
            width: 363px;
        }
        .auto-style16 {
            width: 355px;
        }
        .auto-style20 {
            width: 221px;
            height: 56px;
        }
        .auto-style21 {
            height: 56px;
        }
        .auto-style22 {
            width: 495px;
        }
        .auto-style23 {
            height: 33px;
            width: 495px;
        }
        .auto-style24 {
            height: 56px;
            width: 495px;
        }
        .auto-style25 {
            width: 418px;
        }
        .auto-style26 {
            width: 221px;
        }
        .auto-style27 {
            width: 221px;
            height: 33px;
        }
        .auto-style28 {
            direction: ltr;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2" colspan="3"><strong>Connection Information</strong></td>
            </tr>
            <tr>
                <td class="auto-style16"><strong>E-mail:</strong></td>
                <td class="auto-style3">
                    <asp:TextBox ID="inEmail" runat="server" Width="200px" CssClass="auto-style10"></asp:TextBox>
                </td>
                <td><strong>
                    <asp:RegularExpressionValidator ID="valEmail" runat="server" ControlToValidate="inEmail" Display="Dynamic" ErrorMessage="Should be of the form email@hote.com" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style5"><strong>Password:</strong></td>
                <td class="auto-style6">
                    <asp:TextBox ID="inPassword" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style7"><strong>
                    <asp:RegularExpressionValidator ID="valPasswordLength" runat="server" ControlToValidate="inPassword" Display="Dynamic" ErrorMessage="Should be at least 8 characters" ForeColor="Red" ValidationExpression=".{8,}"></asp:RegularExpressionValidator>
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style16"><strong>Re-Write Password:</strong></td>
                <td class="auto-style3">
                    <asp:TextBox ID="inPasswordConfirm" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                </td>
                <td><strong>
                    <asp:CompareValidator ID="valPasswordVerification" runat="server" ControlToCompare="inPassword" ControlToValidate="inPasswordConfirm" Display="Dynamic" ErrorMessage="Should have the same value as password" ForeColor="Red"></asp:CompareValidator>
                    </strong></td>
            </tr>
        </table>
        <p>
            &nbsp;</p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style9" colspan="3"><strong>Personal Information</strong></td>
            </tr>
            <tr>
                <td class="auto-style15"><strong>Name:</strong></td>
                <td class="auto-style3">
                    <asp:TextBox ID="inName" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style28"><strong>
                    <asp:RequiredFieldValidator ID="valNameRequired" runat="server" ControlToValidate="inName" Display="Dynamic" ErrorMessage="Obligatory field" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style12"><strong>Age:</strong></td>
                <td class="auto-style14">
                    <asp:TextBox ID="inAge" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style8"><strong>
                    <asp:CompareValidator ID="valAge" runat="server" ControlToValidate="inAge" Display="Dynamic" ErrorMessage="Should be &gt;= 18" ForeColor="Red" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="18"></asp:CompareValidator>
                    <br />
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style12"><strong>Address:</strong></td>
                <td class="auto-style3">
                    <asp:TextBox ID="inAddress" runat="server" TextMode="MultiLine" Width="200px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15"><strong>Postal code:</strong></td>
                <td class="auto-style3">
                    <asp:TextBox ID="inPostalCode" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td><strong>
                    <asp:RegularExpressionValidator ID="valPostalCode" runat="server" ControlToValidate="inPostalCode" Display="Dynamic" ErrorMessage="Should be composed of 5 digits" ForeColor="Red" ValidationExpression="\d{5}"></asp:RegularExpressionValidator>
                    <br />
                    </strong></td>
            </tr>
        </table>
        <p>
            &nbsp;</p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2" colspan="3"><strong>Credit card details</strong></td>
            </tr>
            <tr>
                <td class="auto-style26"><strong>Type of card:</strong></td>
                <td class="auto-style22"><strong>
                    <asp:RadioButton ID="rdMaster" runat="server" GroupName="CardType" Text="Master Card" />
                    <asp:RadioButton ID="rdVisa" runat="server" GroupName="CardType" Text="Visa Card" />
                    <asp:RadioButton ID="rdAmerican" runat="server" GroupName="CardType" Text="American Express" />
                    </strong></td>
                <td><strong></strong></td>
            </tr>
            <tr>
                <td class="auto-style27"><strong>Card number:</strong></td>
                <td class="auto-style23"><strong>
                    <asp:TextBox ID="inCardNumber" runat="server"></asp:TextBox>
                    </strong></td>
                <td class="auto-style7"><strong>
                    <asp:CustomValidator ID="valCardNumber" runat="server" ControlToValidate="inCardNumber" Display="Dynamic" ErrorMessage="please make sure the card number/card provider is chosen correctly" ForeColor="Red" OnServerValidate="valCardNumber_ServerValidate"></asp:CustomValidator>
                    <br />
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style27"><strong>Expiry date:</strong></td>
                <td class="auto-style23"><strong>
                    <asp:TextBox ID="inExpiryDate" runat="server"></asp:TextBox>
                    </strong></td>
                <td class="auto-style7"><strong>
                    <asp:CustomValidator ID="valExpiryDate" runat="server" ClientValidationFunction="ValidateExpiryDate" ControlToValidate="inExpiryDate" Display="Dynamic" ErrorMessage="Should be &gt; than Current date and have MM/YYYY format" ForeColor="Red" OnServerValidate="valExpiryDate_ServerValidate"></asp:CustomValidator>
                    <br />
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style20"><strong>Key:</strong></td>
                <td class="auto-style24"><strong>
                    <asp:TextBox ID="inKey" runat="server"></asp:TextBox>
                    </strong></td>
                <td class="auto-style21"><strong>
                    <asp:RegularExpressionValidator ID="valKey" runat="server" ControlToValidate="inKey" Display="Dynamic" ErrorMessage="Should be an integer of 4 digits" ForeColor="Red" ValidationExpression="\d{4}"></asp:RegularExpressionValidator>
                    <br />
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style26"><strong>Amount:</strong></td>
                <td class="auto-style22"><strong>
                    <asp:TextBox ID="inAmount" runat="server"></asp:TextBox>
                    </strong></td>
                <td><strong>
                    <asp:CompareValidator ID="valAmount" runat="server" ControlToValidate="inAmount" Display="Dynamic" ErrorMessage="Should be a postitive integer" ForeColor="Red" Operator="GreaterThan" Type="Double" ValueToCompare="0"></asp:CompareValidator>
                    <br />
                    </strong></td>
            </tr>
        </table>
        <p>
            &nbsp;</p>
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:Button ID="btnValidate" runat="server" Text="Validate" Width="138px" OnClick="btnValidate_Click" />
                </td>
                <td>
                    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" Width="110px" />
                </td>
                <td>
                    <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" Width="101px" />
                </td>
            </tr>
        </table>
        <p>
            <strong>
            <asp:Label ID="lbError" runat="server" ForeColor="Red"></asp:Label>
            </strong></p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2" colspan="3"><strong>Customers List</strong></td>
            </tr>
            <tr>
                <td class="auto-style25">
                    <asp:ListBox ID="listCustomer" runat="server" Width="341px" ></asp:ListBox>
                </td>
                <td>Nb Customers: <asp:Label ID="lbNumberCustomers" runat="server" Text="0"></asp:Label>
                </td>
                <td>Total amount:
                    <asp:Label ID="lbTotalAmount" runat="server" Text="0"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">
                    <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete" />
                </td>
                <td>
                    <asp:Button ID="btnUp" runat="server" OnClick="btnUp_Click" Text="Up" />
                </td>
                <td>
                    <asp:Button ID="btnDown" runat="server" OnClick="btnDown_Click" Text="Down" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
