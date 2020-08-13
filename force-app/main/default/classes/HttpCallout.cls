public inherited sharing class HttpCallout 
{
    private String baseUri = '';
    private final HttpRequest request;
    private HttpResponse response;
    private Datetime requestTime;
    private Set<Integer> successCodes = new Set<Integer>{ 200 };
    private Map<String,String> uriParams = new Map<String,String>();
    private String endpoint {
        get { return this.baseUri + (uriParams.isEmpty() ? '' : HttpUtility.buildQueryString(uriParams)); }
    }


    public HttpCallout() {
        this.request = new HttpRequest();
    }

    public HttpCallout send() {
        this.request.setEndpoint(this.endpoint);

        this.requestTime = Datetime.now();
        this.response = new Http().send(this.request);

        return this;
    }



    public String body () {
        return this.response.getBody();
    }
    public HttpCallout setBody(String body) {
        this.request.setBody(body);
        return this;
    }

    public Blob bodyBlob() {
        return this.response.getBodyAsBlob();
    }
    public HttpCallout setBodyAsBlob(Blob body) {
        this.request.setBodyAsBlob(body);
        return this;
    }

    public Dom.Document bodyDocument() {
        return this.response.getBodyDocument();
    }
    public HttpCallout setBodyDocument(Dom.Document body) {
        this.request.setBodyDocument(body);
        return this;
    }



    public String endpoint() {
        return this.endpoint;
    }
    public HttpCallout setEndpoint(String endpoint) {
        this.baseUri = endpoint;
        return this;
    }



    public HttpCallout setHeader(String key, String value)  {
        this.request.setHeader(key, value);
        return this;
    }



    public HttpCallout setMethod(HttpMethod method) {
        this.request.setMethod(method.toString());
        return this;
    }



    public HttpCallout setParam(String key, String value) {
        this.uriParams.put(key,value);
        return this;
    }



    public Boolean success() {
        return this.successCodes.contains(this.response.getStatusCode());
    }

    public Boolean failure() {
        return !this.success();
    }

    public HttpCallout addSuccessCodes(Set<Integer> successCodes) {
        this.successCodes.addAll(successCodes);
        return this;
    }



    public String status() {
        return this.status();
    }
    public Integer statusCode() {
        return this.response.getStatusCode();
    }



    public Datetime requestTime() {
        return this.requestTime;
    }



    public HttpCallout setTimeout(Integer timeout) {
        this.request.setTimeout(timeout);
        return this;
    }
}
