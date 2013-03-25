//
//  WhereIterator.m
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/24/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import "WhereIterator.h"

@implementation WhereIterator

-(id)nextObject
{
    id result = [_source nextObject];

    while (result && !_predicate(result))
        result = [_source nextObject];
    
    return result;
}

@end
