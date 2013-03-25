//
//  RangeIterator.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/24/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "RangeIterator.h"

@interface RangeIterator() {
    @private
    int _current, _count;
}

-(id)initWithStart:(int)start andCount:(int)count;
@end

@implementation RangeIterator

-(id)initWithStart:(int)start andCount:(int)count
{
    if (self = [super init])
    {
        _current = start;
        _count = count;
    }
    
    return self;
}

-(id)nextObject
{
    if (_count-- > 0)
        return [NSNumber numberWithInt:_current++];
    
    return nil;
}

+(RangeIterator *)withStart:(int)start andCount:(int)count
{
    return [[RangeIterator alloc] initWithStart:start andCount:count];
}

@end
