//
//  Document.m
//  asdf
//
//  Created by Michael Chong on 2/14/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import "Document.h"
#import "ViewController.h"
#import "TodoItem.h"
#import "TodoList.h"

@interface Document ()

@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
        //self.doclist = [[TodoList alloc] init];
        self.doclist = [TodoList todoList];
    }
    return self;
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace {
    return YES;
}

- (void)makeWindowControllers {
     //Override to return the Storyboard file name of the document.
    
//  [self addWindowController:[[NSStoryboard storyboardWithName:@"Main" bundle:nil] instantiateControllerWithIdentifier:@"Document Window Controller"]];
    
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    NSWindowController *wc = [sb instantiateControllerWithIdentifier:@"Document Window Controller"];
    [self addWindowController:wc];
    
   ViewController *vc = (ViewController *)wc.contentViewController;
   vc.list = self.doclist;

    
}

//saving
- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    NSData* data = [NSKeyedArchiver archivedDataWithRootObject:self.doclist];
    
    return data;
}

//loading
- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    id object = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    if ([object isKindOfClass:[TodoList class]])
    {
        self.doclist = object;
        return YES;
    }
    else {
        return NO;
    }
}

@end
