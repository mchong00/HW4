//
//  TodoItem.h
//  NSTableView
//
//  Created by Michael Chong on 2/6/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>

@interface TodoItem : NSObject <NSCoding>

@property (copy) NSString *title;

+(instancetype)todoItemWithTitle:(NSString*)title;

@end
