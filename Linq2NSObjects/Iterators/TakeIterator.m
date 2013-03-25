//
//  TakeIterator.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/25/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "TakeIterator.h"

@implementation TakeIterator

-(id)nextObject
{
    if (_count-- > 0)
        return [_source nextObject];
    
    return nil;
}

@end
