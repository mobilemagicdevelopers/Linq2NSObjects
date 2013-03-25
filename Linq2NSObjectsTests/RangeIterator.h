//
//  RangeIterator.h
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/24/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Iterator.h"

@interface RangeIterator : NSEnumerator
+(RangeIterator *)withStart:(int)start andCount:(int)count;
@end
