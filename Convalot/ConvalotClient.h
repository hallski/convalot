//
//  ConvalotClient.h
//  Convalot
//
//  Created by Mikael Hallendal on 2011-02-17.
//  Copyright 2011 Mikael Hallendal. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MHConvoreClient.h"

@class MHConvoreClient;

@interface ConvalotClient : NSObject {
@private
    
}

+ (MHConvoreClient *)sharedClient;

@end
