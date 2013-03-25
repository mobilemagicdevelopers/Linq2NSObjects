//
//  SkipWhileIterator.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/25/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "SkipWhileIterator.h"

@interface SkipWhileIterator () {
    @private
    BOOL finishedSkipping;
}
@end

@implementation SkipWhileIterator

-(id)nextObject
{
    id result = [_source nextObject];
    
    while (!finishedSkipping && result && _predicate(result))
        result = [_source nextObject];
    
    finishedSkipping = YES;
    return result;
}

@end
