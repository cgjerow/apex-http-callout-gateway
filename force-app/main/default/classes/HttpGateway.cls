public inherited sharing abstract class HttpGateway {
    private final String endpoint;
    private final HttpCalloutLogger logger;
    private HttpCallout callout;
    private Boolean succeeded {
        get { return callout.success(); }
    }
    private Boolean failed {
        get { return callout.failure(); }
    }
    private String calloutFailedException {
        get {
            return String.format( 'Http request for {0} failed with status code {1} and message "{2}"',
                new List<Object>{ callout.endpoint(), callout.statusCode(), callout.status() });
        }
    }



    // maybe we need some api key or something passed in constructor ? 
    public HttpGateway(HttpMethod method, String endpoint, HttpCalloutLogger logger) {
        this(new HttpCallout().setEndpoint(endpoint).setMethod(method), logger);
    }

    public HttpGateway(HttpMethod method, String endpoint) {
        this(method, endpoint, new NullHttpCalloutLogger());
    }

    public HttpGateway(HttpCallout callout) {
        this(callout, new NullHttpCalloutLogger());
    }

    public HttpGateway(HttpCallout callout, HttpCalloutLogger logger) {
        this.callout = callout;
        this.logger = logger;
    }

    public HttpCallout send() {
        logger.log(callout.send());

        if (callout.failure())
            throw new HttpException(calloutFailedException);
        return callout;
    }



    public void setTimeout(Integer timeout) {
        this.callout.setTimeout(timeout);
    }



    public void setBody(String body) {
        this.callout.setBody(body);
    }

    public void setBodyAsBlob(Blob body) {
        this.callout.setBodyAsBlob(body);
    }

    public void setBodyDocument(Dom.Document body) {
        this.callout.setBodyDocument(body);
    }



    public void setParam(String key, String value) {
        this.callout.setParam(key,value);
    }

    public void setHeader(String key, String value)  {
        this.callout.setHeader(key, value);
    }

    protected void addSuccessCodes(Set<Integer> successCodes) {
        this.callout.addSuccessCodes(successCodes);
    }
    protected void addSuccessCode(Integer successCode) {
        this.addSuccessCodes(new Set<Integer>{ successCode });
    }
}