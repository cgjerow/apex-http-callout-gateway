public inherited sharing class HttpCalloutDebugger implements HttpCalloutLogger {

    public void log(HttpCallout callout) {
        if (callout.success()) logSuccess();
        else logFailure();
    }


    private void logSuccess() {
        System.debug(LoggingLevel.INFO, 'HTTP Callout Success!');
    }

    private void logFailure() {
        System.debug(LoggingLevel.INFO, 'HTTP Callout Failed, oh no!');
    }
}