public inherited sharing class MailWrapper {
    public Id mailID {public get; private set;}
    public String name {public get; private set;}
    public String address {public get; private set;}
    public Datetime dateShipped {public get; private set;}
    public String shipStatus {public get; private set;}

    public MailWrapper(Id mailID, String name, String address, Datetime dateShipped, String shipStatus) {
        this.mailID = mailID;
        this.name = name;
        this.address = address;
        this.dateShipped = dateShipped;
        this.shipStatus = shipStatus;
    }


}