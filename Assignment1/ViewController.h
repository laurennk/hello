//
//  ViewController.h
//  Assignment1
//
//  Created by Lauren Koulias on 6/5/15.
//  Copyright (c) 2015 LaurenKoulias. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//digits
@property (weak, nonatomic) IBOutletCollection (UIButton) NSArray *digitPressed;

//operations
@property (weak, nonatomic) IBOutletCollection (UIButton) NSArray *operationPressed;

//equal to
@property (weak, nonatomic) IBOutlet UIButton *equalToSignPressed;

@end


@interface Compute: NSObject

@property (nonatomic, strong) NSMutableArray *programStack;

-(void) pushOperand: (float) operand;
-(float) performOperation: (NSString *) operation;
-(float) popOperand;

@end


@interface Calculator: UIViewController

@property (nonatomic, strong) Compute *comp;

-(IBAction) digitPressed: (UIButton *) sender;

@property (nonatomic, weak) NSString *operationUserHasPressed;

@property(strong, nonatomic) IBOutlet UITextView *display;

@end

