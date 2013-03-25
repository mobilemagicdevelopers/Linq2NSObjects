//
//  TakeWhileIterator.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/25/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "TakeWhileIterator.h"

@implementation TakeWhileIterator

-(id)nextObject
{
    id result = [_source nextObject];

    if (result && _predicate(result))
        return result;
    
    return nil;
}

@end
