//
//  ViewController.h
//  mchong00_hw4_2
//
//  Created by Michael Chong on 2/14/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TodoList.h"

@interface ViewController : NSViewController <NSTableViewDelegate, NSTableViewDataSource, NSTextFieldDelegate, NSTextViewDelegate>

@property (weak) IBOutlet NSTableView *theTableView;
@property (weak) IBOutlet NSTextField *inputTextField;
@property (weak) IBOutlet NSTextField *bodyTextField;
@property (weak) IBOutlet NSButton *addButton;
@property (weak) IBOutlet NSButton *removeButton;
@property (strong) TodoList *list;
@property NSUInteger row;
@property NSIndexSet *selectedMultiRow;

@end

