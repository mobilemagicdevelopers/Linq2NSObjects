//
//  PredicateIteratorTests.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/25/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "PredicateIteratorTests.h"
#import "RangeIterator.h"
#import "NSEnumerator+Linq2NSObjects.h"

@implementation PredicateIteratorTests

-(void)testCanFilterWithWhere
{
    int start = 2, count = 17;
    id rangeIterator = [RangeIterator withStart:start andCount:count];
    Predicate isEven = ^BOOL(NSNumber *element) { return element.integerValue % 2 == 0; };

    for (NSNumber *number in [rangeIterator where:isEven])
        STAssertTrue(isEven(number), @"Value %@ not matching predicate returned.", number);
}

@end
