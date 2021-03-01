public with sharing class Mail_Extension {
    private final Mail__c mailRec;

    public Mail_Extension(ApexPages.StandardController stdController) {
        this.mailRec = (Mail__c)stdController.getRecord();
    }

    public Pagereference SubmitApproval() {
        return null;
    }
}
