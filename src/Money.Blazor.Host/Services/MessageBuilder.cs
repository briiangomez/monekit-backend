using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Money.Services
{
    public class MessageBuilder
    {
        public string CurrencyAlreadyExists() => "Such currency already exists.";
        public string CurrencyAlreadyExists(string uniqueCode) => String.Format("A currency with code '{0}' already exists.", uniqueCode);
        public string CurrencyDoesNotExist() => "Such currency doesn't exist.";
        public string CantDeleteDefaultCurrency() => "You can't delete the default currency.";
        public string CantDeleteLastCurrency() => "You can't delete your last currency.";
        public string CurrencyAlreadyAsDefault() => "Selected currency already is a default one.";
        public string CurrencyExchangeRateDoesNotExist() => "Such currency exchange rate doesn't exist.";
        public string CurrencyExchangeRateAlreadyExists() => "Such currency exchange rate already exists.";
        public string OutcomeAlreadyDeleted() => "The outcome is already deleted.";
        public string OutcomeAlreadyHasCategory() => "The outcome already has this category.";

        public string DemoUserCantBeChanged() => "A demo user can't be modified.";
        public string PasswordChangeFailed(string error) => error.Replace(Environment.NewLine, "<br />");
        public string EmailChangeFailed() => "A user email change failed.";

        public string ServerNotResponding() => "The remote server is not responding. Please try it again later.";
        public string InternalServerError() => "The remote server responded with unexpected error. Please report this issue back to us.";
    }
}
