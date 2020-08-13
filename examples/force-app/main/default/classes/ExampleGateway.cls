public inherited sharing class ExampleGateway {

    public void getPosts() {
        System.debug(new GetShibe().send());
    }

    public void getPosts(Integer count) {
        GetShibe api = new GetShibe();
        api.setParam('count',String.valueOf(count));
        System.debug(api.send().body());
    }

    private virtual class ShibeGateway extends HttpGateway {
        public ShibeGateway(HttpMethod method, String endpoint) {
            // can set up all auth & other endpoint specific junk here, one and done.
            super(method, 'http://shibe.online/api'+endpoint, new AsyncHttpCalloutLogger());
        }
    }

    private virtual class ShibeApi extends ShibeGateway {
        public ShibeApi(HttpMethod method) {
            super(method,'/shibes');
        }
    }

    private virtual class GetShibe extends ShibeApi {
        public GetShibe(){
            super(HttpMethod.GET);
        }
    }

}
