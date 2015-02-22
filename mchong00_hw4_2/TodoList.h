//
//  TodoList.h
//  NSTableView
//
//  Created by Michael Chong on 2/6/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TodoList.h"
#import "TodoItem.h"

@interface TodoList : NSObject <NSCoding>

@property (strong, nonatomic) NSMutableArray *array;

+(instancetype)todoList;
-(NSArray*)itemTitles;
-(NSUInteger)itemCount;
-(NSString *)getObjectTitleAtPosition:(NSUInteger)row;
-(BOOL)canAddItemWithTitle:(NSString *)item;
-(void)addItemWithTitle:(NSString*)title;
-(void)changeItem:(NSString *)string atPosition:(NSUInteger)row;
-(void)encodeWithCoder:(NSCoder *)aCoder;
-(id)initWithCoder:(NSCoder *)aDecoder;

@end
