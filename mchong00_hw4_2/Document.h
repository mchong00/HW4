//
//  Document.h
//  mchong00_hw4_2
//
//  Created by Michael Chong on 2/14/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TodoList.h"

@interface Document : NSDocument

@property (strong) TodoList *doclist;




@end

