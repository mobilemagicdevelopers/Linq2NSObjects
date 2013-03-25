//
//  Iterator.h
//  Linq2NSObjects
//
//  Created by Douglas Patrick Caldwell on 3/24/13.
//  Copyright (c) 2013 Mobile Magic Developers, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Linq2NSObjectsTypes.h"

@interface Iterator : NSEnumerator
{
    @protected
    NSEnumerator *_source;
}
-initWithSource:(NSEnumerator *)source;
@end
