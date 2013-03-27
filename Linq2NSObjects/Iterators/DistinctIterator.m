//
//  DistinctIterator.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/27/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "DistinctIterator.h"

@interface DistinctIterator () {
    @private
    NSMutableSet *_returnedValues;
}
@end

@implementation DistinctIterator

-(id)initWithSource:(NSEnumerator *)source
{
    if (self = [super initWithSource:source])
        _returnedValues = [NSMutableSet set];
    
    return self;
}

-(id)nextObject
{
    id result = [_source nextObject];
    
    while (result && [_returnedValues containsObject:result])
        result = [_source nextObject];

    if (result)
        [_returnedValues addObject:result];
    
    return result;
}

@end
