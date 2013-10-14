//
//  LCSoapDelegate.h
//  LCSoapWebservice
//
//  Created by leo.chang on 13/10/14.
//  Copyright (c) 2013年 Good-idea Consulgint Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kSoapBody @"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\"><soap12:Body><%@ xmlns=\"%@\">%@</%@></soap12:Body></soap12:Envelope>"

@class LCSoapDelegate;
@protocol soapWebserviceDelegate <NSObject>

- (void)soapWebservice:(LCSoapDelegate*)soap didFinishConnectToWebservice:(NSMutableData*)webData;
- (void)soapWebservice:(LCSoapDelegate*)soap didFailConnectToWebservice:(NSError*)error;

@end

@interface LCSoapDelegate : NSObject
{
    NSString *soapBody;
    NSMutableData *webData;
    NSURLConnection *webConn;
}
/*
 soap delegate
 */
@property (assign) id<soapWebserviceDelegate> delegate;
/*
 you can use this to check which result is.
 */
@property (nonatomic, assign) NSInteger tag;
/**
 xmlns : the xml namespace is you donot change the xmlns , then default is http://tmpurl/
 */
- (id)initWithXmlns:(NSString*)xmlns soapMethod:(NSString*)method params:(NSDictionary*)params;
/**
 start connecting to the soap webservice host
 url : soap webservice host
 */
- (void)startConnectingWithUrl:(NSURL*)url;
/**
 canel the process
 */
- (void)cancelTheDelegate;

@end
