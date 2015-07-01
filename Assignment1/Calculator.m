//
//  Calculator.m
//  Assignment1
//
//  Created by Lauren Koulias on 6/6/15.
//  COP 4656
//

#import "Calculator.h"

@interface Calculator ()
@property NSString* operationUserHasPressed;
@property BOOL finishedWithOperand;
@property BOOL shouldResetDisplay;
@end

@implementation Calculator

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.operationUserHasPressed = [[NSString alloc] init];
    self.comp = [[Compute alloc] init];
}

-(IBAction) digitPressed: (UIButton *) sender
{
    if(self.shouldResetDisplay || [_display.text isEqual: @"0"])
    {
        _display.text = @"";
        self.shouldResetDisplay = NO;
    }
    
    // Update display
    _display.text = [NSString stringWithFormat:@"%@%@", _display.text, sender.currentTitle];
}

-(void)storeDigit
{
    
    //obtain number entered by user
    float numberEntered = [_display.text floatValue];
    
    // Push operand to stack
    [self.comp pushOperand: numberEntered];
}

-(IBAction) operationPressed: (UIButton *) sender
{
    //obtain operation entered by user
    self.operationUserHasPressed = sender.currentTitle;
        
    // Store the last digit
    [self storeDigit];
        
    // Let the display know it can now reset
    self.shouldResetDisplay = YES;
}

-(IBAction)negatePressed:(id)sender
{
    //convert string to float then negate
    float numberEntered = [_display.text floatValue];
    numberEntered = -numberEntered;
    
    //display correct places after decimal place
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setUsesSignificantDigits:YES];
    [formatter setMinimumSignificantDigits:1];
    
    //convert back to string
    NSNumber *myNumber = [NSNumber numberWithFloat:numberEntered];
    NSString *myString = [formatter stringFromNumber:myNumber];
    _display.text = [NSString stringWithFormat:@"%@", myString];
}

-(IBAction)clearPressed:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"Are you sure to clear the display?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Yes",nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    // If Yes pressed
    if(buttonIndex == 1){
        _display.text = @"0";
    }
}

-(IBAction) equalToSignPresed: (UIButton *) sender
{
    //obtain results of computaion
    float result = 0;
    [self.comp pushOperand: [_display.text floatValue]];
    result = [self.comp performOperation: self.operationUserHasPressed];
    
    // Store the result as our first operand
    [self.comp pushOperand:result];
    
    //to display correct places after decimal place
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setUsesSignificantDigits:YES];
    [formatter setMinimumSignificantDigits:1];
    
    //converting back to a string from a float
    NSNumber *myNumber = [NSNumber numberWithFloat: result];
    NSString *myString = [formatter stringFromNumber: myNumber];
    _display.text = [NSString stringWithFormat:@"%@", myString];
    
    self.shouldResetDisplay = YES;
}

@end
