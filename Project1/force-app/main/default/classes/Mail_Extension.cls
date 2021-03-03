public with sharing class Mail_Extension {
    private final Mail__c mailRec;


    private ApexPages.StandardSetController mailSetController;


    public String listView {
        get {
            return listView;
        }
        set;
    }


    public List<SelectOption> getViews() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('ALL', 'All'));
        options.add(new SelectOption('Delivered', 'Shipments Delivered'));
        options.add(new SelectOption('Not Delivered', 'Shipments in Progress'));
        return options;
    }

    public List<Mail__c> testMailList {
        get {
            if(testMailList == null){
                testMailList = [Select ID, Name, Full_Address__c, createdDate, Delivery_Status__c FROM Mail__c];
                
            }
            return testMailList;
        }
        set;
    }



    public String trackingNumber {get; set;}

    public Mail_Extension(ApexPages.StandardController stdController) {
        this.mailRec = (Mail__c)stdController.getRecord();
    }
    public Mail_Extension(ApexPages.StandardSetController stdSetController) {
        this.mailSetController = stdSetController;
        //this.testMailList = (List<Mail__c>)stdSetController.getRecords();
    }

    public void SubmitApproval() {
                //TODO: Prevent rapid Submission
                
            // Create an approval request for the mail object
            Approval.ProcessSubmitRequest req1 = 
                new Approval.ProcessSubmitRequest();
            req1.setComments('Submitting request for approval.');
            req1.setObjectId(mailRec.id);
            
            // Submit on behalf of a specific submitter
            req1.setSubmitterId(UserInfo.getUserID()); 
            
            // Submit the record to specific process and skip the criteria evaluation
            req1.setProcessDefinitionNameOrId('MailApproval');
            req1.setSkipEntryCriteria(false);
            
            // Submit the approval request for the account
            Approval.ProcessResult result = Approval.process(req1);
            
            // Verify the result
            System.assert(result.isSuccess());
            
            //System.assertEquals(
            //    'Pending', result.getInstanceStatus(), 
            //    'Instance Status'+result.getInstanceStatus());
            
        }

        public Pagereference searchMail(){
            testMailList = [Select ID, Name, Full_Address__c, createdDate, Delivery_Status__c FROM Mail__c WHERE Name Like :trackingNumber + '%' ];
            return null;
        }

        public Pagereference filterMail(){
            if(ListView == 'Delivered'){
                testMailList = [Select ID, Name, Full_Address__c, createdDate, Delivery_Status__c FROM Mail__c WHERE Name Like :trackingNumber + '%' AND delivery_status__c = :listView];
            } else if (ListView == 'Not Delivered'){
                testMailList = [Select ID, Name, Full_Address__c, createdDate, Delivery_Status__c FROM Mail__c WHERE Name Like :trackingNumber + '%' AND delivery_status__c != 'Delivered'];
            } else {
                testMailList = [Select ID, Name, Full_Address__c, createdDate, Delivery_Status__c FROM Mail__c WHERE Name Like :trackingNumber + '%' ];
            }
            return null;
        }
}