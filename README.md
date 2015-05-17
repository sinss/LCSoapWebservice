![Platform](https://img.shields.io/badge/platform-iOS-green.svg)
![License](https://img.shields.io/badge/License-MIT%20License-orange.svg)

LCSoapWebservice
==============================================================
Easy way to communicate with a soap webservice service

how to use :

step 1: copy \classes\ folder to you project

step 2: import LCSoapDelegate.h

step 3: implement protocol

step 4: create your soap parameters ex: 
  NSString *xmlns = @"http://tmpurl/";
  NSString *method = @"SoapMethod"; 
  NSURL *url = [NSURL URLWithString:http://www.tmp.com.asmx]; 
  NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys: 
        @"",@"identity", 
        @"",@"planValue", 
        @"",@"customerValue", 
        nil]; 
  LCSoapDelegate *soap = [[LCSoapDelegate alloc] initWithXmlns:xmlns soapMethod:method params:params]; 
  [soap setDelegate:self]; 
  [soap setTag:0]; 
  [soap startConnectingWithUrl:url];
==============================================================
support : ios6 above
requried : ARC
