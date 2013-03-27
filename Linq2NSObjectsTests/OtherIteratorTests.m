//
//  OtherIteratorTests.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/27/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "OtherIteratorTests.h"
#import "RangeIterator.h"
#import "Linq2NSObjects.h"

@implementation OtherIteratorTests

-(void)testConcat
{
    int start = 2, count = 17;
    id rangeIterator = [RangeIterator withStart:start andCount:count];

    int start2 = 4, count2 = 6;
    id rangeIterator2 = [RangeIterator withStart:start2 andCount:count2];
    
    id emptyEnumerator = [[NSArray array] objectEnumerator];
    
    NSArray *concat = [[rangeIterator concat:emptyEnumerator, rangeIterator2, emptyEnumerator, nil] toArray];
    for (int i = 0; i < count; i++)
    {
        int actual = ((NSNumber *)[concat objectAtIndex:i]).integerValue;
        int expected = start + i;
        
        STAssertEquals(actual, expected, @"ConcatIterator invalid for first range.");
    }
    
    for (int i = 0; i < count2; i++)
    {
        int actual = ((NSNumber *)[concat objectAtIndex:i + count]).integerValue;
        int expected = start2 + i;
        
        STAssertEquals(actual, expected, @"ConcatIterator invalid for second range.");
    }
    
    STAssertEquals(concat.count, (uint)(count + count2), @"ConcatIterator return invalid length.");
}

@end
