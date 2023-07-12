using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class InscriptionForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            inEmail.Text = String.Empty;
            inPassword.Text = string.Empty;
            inPasswordConfirm.Text = string.Empty;

            inName.Text = string.Empty;
            inAge.Text = string.Empty;
            inAddress.Text = string.Empty;
            inPostalCode.Text = string.Empty;

            rdAmerican.Checked = false;
            rdMaster.Checked = false;
            rdVisa.Checked = false;

            inCardNumber.Text = string.Empty;
            inExpiryDate.Text = string.Empty;
            inKey.Text = string.Empty;
            inAmount.Text = string.Empty;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {            
            const String ITEMEXISTERROR = "Customer already exists!";
            String Name = inName.Text;
            Double Amount = Convert.ToDouble(inAmount.Text);
            ListItem Item = new ListItem();

            Item.Text = Name + ";" + Amount;
            Item.Value = Amount.ToString();

            if (!listCustomer.Items.Contains(Item))
            {
                lbError.Text = String.Empty;

                listCustomer.Items.Insert(0, Item);
                lbTotalAmount.Text = (Convert.ToDouble(lbTotalAmount.Text) + Amount)
                    .ToString();
                lbNumberCustomers.Text = (Convert.ToInt32(lbNumberCustomers.Text) + 1)
                    .ToString();
            }
            else
            {
                lbError.Text = ITEMEXISTERROR;
            }
            
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            ListItem SelectedItem = listCustomer.SelectedItem;
            double Amount = Convert.ToDouble(SelectedItem.Value);

            lbNumberCustomers.Text = (Convert.ToInt32(lbNumberCustomers.Text) - 1)
                .ToString();
            lbTotalAmount.Text = (Convert.ToDouble(lbTotalAmount.Text) - Amount)
                .ToString();
            listCustomer.Items.Remove(SelectedItem);
        }

        protected void btnUp_Click(object sender, EventArgs e)
        {
            int ItemIndex = listCustomer.SelectedIndex;
            ListItem SelectedItem = listCustomer.SelectedItem;

            if(ItemIndex > 0)
            {
                listCustomer.Items.Remove(SelectedItem);
                listCustomer.Items.Insert(ItemIndex - 1, SelectedItem);
                listCustomer.SelectedIndex = ItemIndex - 1;
            }
        }

        protected void btnDown_Click(object sender, EventArgs e)
        {
            int ItemIndex = listCustomer.SelectedIndex;
            int LastItemIndex = listCustomer.Items.Count - 1;
            ListItem SelectedItem = listCustomer.SelectedItem;

            if (ItemIndex < LastItemIndex)
            {                
                listCustomer.Items.Remove(SelectedItem);
                listCustomer.Items.Insert(ItemIndex + 1, SelectedItem);
                listCustomer.SelectedIndex = ItemIndex + 1;
            }
        }

        protected void valExpiryDate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string Pattern = @"^(0?[1-9]|1[0-2])\/\d{4}$";
            string InputDate = args.Value;
            DateTime ExpiryDate;

            Regex re = new Regex(Pattern);

            //Validates the format pattern
            //Makes sure that the ExpiryDate < Current Date            
            args.IsValid = re.IsMatch(InputDate) &&
                DateTime.TryParse(InputDate, out ExpiryDate) &&
                ExpiryDate > DateTime.Today;             
        }

        protected void btnValidate_Click(object sender, EventArgs e)
        {
            Page.Validate();
        }

        protected void valCardNumber_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string InputCardNumber = args.Value.Replace(" ", "");
            Regex re;

            const string PatternMasterCard = @"^5[1-5]\d{14}$";
            const string PatterVisaCard = @"^4\d{12}(\d{3})?$";
            const string PatternAmericanExpress = @"^3[47]\d{13}$";

            if (rdMaster.Checked)
            {
                re = new Regex(PatternMasterCard);
            }else if (rdVisa.Checked)
            {
                re = new Regex(PatterVisaCard);
            }
            else if(rdAmerican.Checked)
            {                
                re = new Regex(PatternAmericanExpress);
            }
            else
            {
                args.IsValid = false;
                return;
            }

            args.IsValid = re.IsMatch(InputCardNumber);   

        }
    }
}