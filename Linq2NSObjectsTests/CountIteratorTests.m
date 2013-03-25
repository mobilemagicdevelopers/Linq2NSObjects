//
//  CountIteratorTests.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/25/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "CountIteratorTests.h"
#import "RangeIterator.h"
#import "NSEnumerator+Linq2NSObjects.h"

@implementation CountIteratorTests

-(void)testSkipIterator
{
    int start = 2, count = 17, skip = 5;
    id rangeIterator = [RangeIterator withStart:start andCount:count];

    start += skip;
    for (NSNumber *number in [rangeIterator skip:skip])
        STAssertEquals(number.integerValue, start++, @"SkipIterator failed.");
}

-(void)testTakeIterator
{
    int start = 2, count = 17, take = 5;
    id rangeIterator = [RangeIterator withStart:start andCount:count];
    
    STAssertEquals([rangeIterator take:take].allObjects.count, (uint)take, @"TakeIterator failed.");
}

@end
