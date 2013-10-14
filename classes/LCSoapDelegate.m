//
//  LCSoapDelegate.m
//  LCSoapWebservice
//
//  Created by leo.chang on 13/10/14.
//  Copyright (c) 2013年 Good-idea Consulgint Inc. All rights reserved.
//

#import "LCSoapDelegate.h"

@implementation LCSoapDelegate

- (id)initWithXmlns:(NSString*)xmlns soapMethod:(NSString*)method params:(NSDictionary*)params
{
    if (self = [super init])
    {
        //<platform>%@</platform><uid>%@</uid><pwd>%@</pwd><sys_key>%@</sys_key><token>%@</token>
        NSMutableString *soapParam = [NSMutableString stringWithCapacity:0];
        NSArray *paramKeys = [params allKeys];
        for (NSString *key in paramKeys)
        {
            [soapParam appendFormat:@"<%@>%@</%@>", key, [params valueForKey:key], key];
        }
        soapBody = [NSString stringWithFormat:kSoapBody, method, xmlns, soapParam, method];
    }
    return self;
}

- (void)startConnectingWithUrl:(NSURL*)url
{
    NSLog(@"%@",soapBody);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSString *requestSoapMsgLength = [NSString stringWithFormat:@"%d",[soapBody length]];
    [request addValue:@"application/soap+xml" forHTTPHeaderField:@"Content-Type"];
    [request addValue:requestSoapMsgLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[soapBody dataUsingEncoding:NSUTF8StringEncoding]];
    webConn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (webConn)
    {
        webData = [NSMutableData data];
    }
}

- (void)cancelTheDelegate
{
    [webConn cancel];
    webData = nil;
    webConn = nil;
}

#pragma mark - NSURLConnection delegate

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength:0];
}
- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    //request 產生錯誤時
    //NSLog(@"%@",error);
    webData = nil;
    webConn = nil;
    [self.delegate soapWebservice:self didFailConnectToWebservice:error];
}
- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    //finish request
    NSLog(@"result:%@", [[NSString alloc] initWithData:webData encoding:NSUTF8StringEncoding]);
    [self.delegate soapWebservice:self didFinishConnectToWebservice:webData];
}

@end
