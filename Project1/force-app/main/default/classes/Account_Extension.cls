public inherited sharing class Account_Extension {


    public Account acct {
        get{
            //this is bad, but user should only have one parent due to sharing defaults for accounts; in theory
            if(acct == null){
                acct = new Account();
                acct = [SELECT ID, Name, AccountNumber, ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, Phone FROM Account LIMIT 1];
            }
            return acct;
        }
        set;
    }
    
    public Account_Extension(ApexPages.StandardController stdController) {
        //this.acct = (Account)stdController.getRecord();

    }
    public Account_Extension() {

    }

    public Pagereference QuickSave() {
        update acct;
        return null;

    }
}