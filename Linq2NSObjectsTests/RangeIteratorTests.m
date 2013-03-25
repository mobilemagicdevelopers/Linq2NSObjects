//
//  RangeIteratorTests.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/24/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "RangeIteratorTests.h"
#import "RangeIterator.h"

@implementation RangeIteratorTests

-(void)testCreateRangeIterator
{
    id rangeIterator = [RangeIterator withStart:2 andCount:17];
    STAssertNotNil(rangeIterator, @"Unable to create iterator.");
}

-(void)testCanMoveNextRangeIterator
{
    int start = 2, count = 17;
    id rangeIterator = [RangeIterator withStart:start andCount:count];
    
    int numberCount = 0;
    NSNumber *number;
    while (number = (NSNumber *)[rangeIterator nextObject])
        STAssertEquals(start + numberCount++, number.integerValue, @"RangeIterator value incorrect.");
    
    STAssertEquals(count, numberCount, @"RangeIterator count incorrect.");
}

-(void)testCanGetAllInRangeIterator
{
    int start = 2, count = 17;
    id rangeIterator = [RangeIterator withStart:start andCount:count];
    NSArray *range = [rangeIterator allObjects];
    STAssertEquals(range.count, (uint)count, @"Range array count incorrect.");
    
    for (int index = 0; index < count; index++)
        STAssertEquals(((NSNumber *)[range objectAtIndex:index]).integerValue, index + start, @"Element at index %i does not match.", index);
}

-(void)testCanFastEnumeratorRangeIterator
{
    int start = 2, count = 17;
    id rangeIterator = [RangeIterator withStart:start andCount:count];

    int numberCount = 0;
    for (NSNumber *number in rangeIterator)
        STAssertEquals(start + numberCount++, number.integerValue, @"RangeIterator value incorrect.");

    STAssertEquals(count, numberCount, @"RangeIterator count incorrect.");
}

@end
