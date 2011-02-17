//
//  ConvalotClient.m
//  Convalot
//
//  Created by Mikael Hallendal on 2011-02-17.
//  Copyright 2011 Mikael Hallendal. All rights reserved.
//

#import "ConvalotClient.h"


@implementation ConvalotClient

+ (MHConvoreClient *)sharedClient
{
    static MHConvoreClient *client = nil;
    if (client == nil) {
        client = [[MHConvoreClient alloc] initWithUsername:@"" password:@""];
    }
    
    return client;
}

@end
