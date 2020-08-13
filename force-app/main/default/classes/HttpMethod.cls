// I would have preferred to use an Enum, but reserved keywords are not supported (e.g. DELETE)
public inherited sharing abstract class HttpMethod {
    public static final HttpMethod GET = new GET();
    public static final HttpMethod PATCH = new PATCH();
    public static final HttpMethod POST = new POST();
    public static final HttpMethod DELETEs = new DELETEs();


    override public abstract String toString();

    private class GET extends HttpMethod {
        override public String toString() { return 'GET'; }
    }

    private class PATCH extends HttpMethod {
        override public String toString() { return 'PATCH'; }
    }

    private class POST extends HttpMethod {
        override public String toString() { return 'POST'; }
    }

    private class PUT extends HttpMethod {
        override public String toString() { return 'PUT'; }
    }

    // Delete is a reserved keyword so we need to add some differentiator.
    // I chose a trailing "s" as it doesn't interfere with the readability much and is pronouncable
    private class DELETEs extends HttpMethod {
        override public String toString() { return 'DELETE'; }
    }
}