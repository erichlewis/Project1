public inherited sharing class Account_Extension {
    public Account acct {
        get{   
            //this is bad, but user should only have one parent due to sharing defaults for accounts; in theory
            acct = [SELECT ID, Name, AccountNumber, OwnerId, Site FROM Account LIMIT 1];
            return acct;
        }
        set;
    }
    
    public Account_Extension(ApexPages.StandardController stdController) {
        this.acct = (Account)stdController.getRecord();
    }
}
