LCSoapWebservice
==============================================================
I think soap webservice for iOS is rarely to discuss ,

so decide to share this solutions.

It is very easy to use!

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
==============================================================
The MIT License (MIT)

Copyright (c) [2013] [Leo Chang]

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
