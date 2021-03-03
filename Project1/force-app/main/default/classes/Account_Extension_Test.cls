@isTest(SeeAllData='True')
public class Account_Extension_Test {

    @isTest
    public static void test1(){
        Account temp = [SELECT ID, Name, AccountNumber, OwnerId, Site FROM Account LIMIT 1];
        Account_Extension ref = new Account_Extension();
        System.AssertEquals(temp, ref.acct);
    }
}