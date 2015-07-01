//
//  Calculator.h
//  Assignment1
//
//  Created by Lauren Koulias on 6/6/15.
//  COP 4656
//

#import <UIKit/UIKit.h>
#import "Compute.h"

@interface Calculator: UIViewController

@property (nonatomic, strong) Compute *comp;

- (IBAction) digitPressed: (UIButton *) sender;

- (IBAction) operationPressed: (UIButton *) sender;

- (IBAction) equalToSignPresed: (UIButton *) sender;

- (IBAction)clearPressed: (id) sender;

//text display
@property (weak, nonatomic) IBOutlet UILabel *display;

@end