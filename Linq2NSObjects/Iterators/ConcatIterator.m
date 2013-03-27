//
//  ConcatIterator.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/27/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "ConcatIterator.h"

@interface ConcatIterator () {
    @private
    NSArray *_enumerators;
    uint _currentIndex;
    NSEnumerator *_currentEnumerator;
}
@end

@implementation ConcatIterator
-(id)initWithSource:(NSEnumerator *)source andEnumerators:(NSArray *)enumerators
{
    if (self = [super initWithSource:source])
    {
        _enumerators = enumerators;
        _currentEnumerator = _source;
        _currentIndex = -1;
    }
    
    return self;
}

-(id)nextObject
{
    id result = [_currentEnumerator nextObject];
    
    while (!result && ++_currentIndex < _enumerators.count)
    {
        _currentEnumerator = [_enumerators objectAtIndex:_currentIndex];
        result = [_currentEnumerator nextObject];
    }
    
    return result;
}

@end
