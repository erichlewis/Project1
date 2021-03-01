public with sharing class HomePage_CC {



    public HomePage_CC() {
        //something may go here
    }

    //list for mail
    public List<MailWrapper> mailList {
        get{
            if(mailList == null){
                mailList = new List<MailWrapper>();
                List<Mail__c> tempList = [SELECT Id, Name, Full_address__c, createdDate, delivery_status__c FROM Mail__c ORDER BY createdDate DESC LIMIT 5];
                for(Mail__c mail : tempList){
                    mailList.add(new MailWrapper(mail.Id, mail.name, mail.Full_address__c, mail.createdDate, mail.delivery_status__c));
                }
                return mailList;
            } else {
                return mailList;
            }
        }
        
        set;
    }

    public List<TicketWrapper> ticketList {
        get{
            if(ticketList == null){
                ticketList = new List<TicketWrapper>();
                List<Case> tempList = [SELECT Id, CaseNumber, lastModifiedDate, LastModifiedBy.Name FROM Case ORDER BY lastModifiedDate DESC LIMIT 5];
                for(Case caseIter : tempList){
                    ticketList.add(new TicketWrapper(caseIter.Id, caseIter.CaseNumber, caseIter.lastModifiedBy.Name, caseIter.lastModifiedDate));
                }
                return ticketList;
            } else {
                return ticketList;
            }
        }
        set;
    }
}
