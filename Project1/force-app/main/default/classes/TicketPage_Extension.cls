public inherited sharing class TicketPage_Extension {
    private final Case caseRef;
    public TicketPage_Extension(ApexPages.StandardController stdController) {
        this.caseRef = (Case)stdController.getRecord();
    }

    public void quicksave(){
        upsert caseRef;
    }
}