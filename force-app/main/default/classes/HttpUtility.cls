public with sharing class HttpUtility  {

    public static String buildQueryString(Map<String,String> params) {
        String uriParams = '?';
        Iterator<String> iterator = params.keySet().iterator();
        while(iterator.hasNext()) {
            String key = iterator.next(); 
            uriParams += key + '=' + params.get(key);
            if (iterator.hasNext())
                uriParams += '&';
        }
        return uriParams;
    }

}
