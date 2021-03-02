public inherited sharing class TicketWrapper {
    public Id ticketId {public get; private set;}
    public String ticketName {public get; private set;}
    public String lastModifiedBy {public get; private set;}
    public DateTime lastModifiedDate {public get; private set;}

    public TicketWrapper(Id ticketId, String ticketName, String lastModifiedBy, DateTime lastModifiedDate) {
        this.ticketId = ticketId;
        this.ticketName = ticketName;
        this.lastModifiedBy = lastModifiedBy;
        this.lastModifiedDate = lastModifiedDate;
    }
}