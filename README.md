# Apex Http Callout Gateway
HTTP gateway / callout abstractions for Apex, with some basic examples.   


The key classes here are `HttpCallout`, `HttpCalloutLogger`, and `HttpGateway`. They are supported by `HttpMethod`, `HttpUtility`, and `HttpException`.

#### HttpCallout
A representation of the full HttpCallout cycle, from request through sending and result. Its current implementation is a wrapper around `HttpRequest` and `HttpResponse` with some bonus functionality such as the ability to specify which response status codes designate a successful callout, quality of life support for uri parameters, and capturing the exact datetime the callout was sent. 

#### HttpCalloutLogger
This is a very straightforward interface to support the various logging strategies. By default the `HttpGateway` uses the `NullHttpCalloutLogger`, which does absolutely nothing! However, this interface lets you support all sorts of logging strategies, some examples are included in (you guessed it) the examples folder. Common strategies may include Debug logging, logging to a Log SObject, asynchronous logging, etc.

#### HttpGateway
This abstract class is where you can include logic that your team wants to execute on **every** callout. My implementation just calls the `HttpCallout.send()` and logs the callout response with whatever logging strategy is provided. It also throws an exception if the callout failed, because exceptions are better than result status objects.
