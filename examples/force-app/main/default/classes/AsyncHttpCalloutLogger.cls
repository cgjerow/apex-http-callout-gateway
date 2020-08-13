public inherited sharing class AsyncHttpCalloutLogger implements HttpCalloutLogger, Queueable {
    private String message;    
    public void execute(QueueableContext context) {
        System.debug(message);
    }

    public void log(HttpCallout callout) {
        this.message = 'This is what I would log: '+callout;
        System.enqueueJob(this);
    }
}