@isTest
public class HomePace_CC_Test {

    
    
    @isTest(SeeAllData=true)
    public static void Test1(){
        HomePage_CC controller = new HomePage_CC();
        List<MailWrapper> mailTestList = new List<MailWrapper>();
        List<Mail__c> tempList = [SELECT Id, Name, Full_address__c, createdDate, delivery_status__c FROM Mail__c ORDER BY createdDate DESC LIMIT 5];
        for(Mail__c mail : tempList){
            mailTestList.add(new MailWrapper(mail.Id, mail.name, mail.Full_address__c, mail.createdDate, mail.delivery_status__c));
        }
        System.assertEquals(mailTestList.size(), controller.mailList.size());
    }

    @isTest(SeeAllData=true)
    public static void Test2(){
        HomePage_CC controller = new HomePage_CC();
        List<TicketWrapper> ticketTestList = new List<TicketWrapper>();
        List<Case> tempList = [SELECT Id, CaseNumber, lastModifiedDate, LastModifiedBy.Name FROM Case ORDER BY lastModifiedDate DESC LIMIT 5];
                for(Case caseIter : tempList){ ticketTestList.add(new TicketWrapper(caseIter.Id, caseIter.CaseNumber, caseIter.lastModifiedBy.Name, caseIter.lastModifiedDate));
                }
        System.assertEquals(ticketTestList.size(), controller.ticketList.size());
    }
    @isTest(SeeAllData=true)
    public static void Test3(){
        HomePage_CC controller = new HomePage_CC();
       
      

        List<TicketWrapper> ticketTestList = new List<TicketWrapper>();
        List<Case> tempList = [SELECT Id, CaseNumber, lastModifiedDate, LastModifiedBy.Name FROM Case ORDER BY lastModifiedDate DESC LIMIT 5];
        for(Case caseIter : tempList){ 
            controller.ticketList.add(new TicketWrapper(caseIter.Id, caseIter.CaseNumber, caseIter.lastModifiedBy.Name, caseIter.lastModifiedDate));
            ticketTestList.add(new TicketWrapper(caseIter.Id, caseIter.CaseNumber, caseIter.lastModifiedBy.Name, caseIter.lastModifiedDate));
        }
        System.assertEquals(ticketTestList.size(), controller.ticketList.size());

        List<MailWrapper> mailTestList = new List<MailWrapper>();
        List<Mail__c> tempList2 = [SELECT Id, Name, Full_address__c, createdDate, delivery_status__c FROM Mail__c ORDER BY createdDate DESC LIMIT 5];
        for(Mail__c mail : tempList2){
            controller.mailList.add(new MailWrapper(mail.Id, mail.name, mail.Full_address__c, mail.createdDate, mail.delivery_status__c));
            mailTestList.add(new MailWrapper(mail.Id, mail.name, mail.Full_address__c, mail.createdDate, mail.delivery_status__c));
        }
        System.assertEquals(mailTestList.size(), controller.mailList.size());

    }

}