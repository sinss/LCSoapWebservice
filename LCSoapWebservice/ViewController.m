//
//  ViewController.m
//  LCSoapWebservice
//
//  Created by leo.chang on 13/10/14.
//  Copyright (c) 2013年 Good-idea Consulgint Inc. All rights reserved.
//

#import "ViewController.h"
#import "LCSoapDelegate.h"

@interface ViewController () <soapWebserviceDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Go:(id)sender
{
    NSString *xmlns = @"http://tmpurl/";
    NSString *method = @"CAL001";
    NSURL *url = [NSURL URLWithString:@"http://www.mli.com.tw/mob/calwebservice.asmx"];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"",@"identity",
                            @"",@"planValue",
                            @"",@"customerValue",
                            nil];
    LCSoapDelegate *soap = [[LCSoapDelegate alloc] initWithXmlns:xmlns soapMethod:method params:params];
    [soap setDelegate:self];
    [soap setTag:0];
    [soap startConnectingWithUrl:url];
}

- (void)soapWebservice:(LCSoapDelegate*)soap didFinishConnectToWebservice:(NSMutableData*)webData
{
    [self showAlertWithMessage:[[NSString alloc] initWithData:webData encoding:NSUTF8StringEncoding] title:@"success"];
}

- (void)soapWebservice:(LCSoapDelegate*)soap didFailConnectToWebservice:(NSError*)error
{
    [self showAlertWithMessage:[error localizedFailureReason] title:@"fail"];
}

- (void)showAlertWithMessage:(NSString*)message title:(NSString*)title
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
}

@end
