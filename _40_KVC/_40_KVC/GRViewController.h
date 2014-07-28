//
//  GRViewController.h
//  _40_KVC
//
//  Created by Exo-terminal on 7/25/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRViewController : UITableViewController
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFieldCollection;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;
@property (weak, nonatomic) IBOutlet UISwitch *genderSwitch;

- (IBAction)actionGrade:(UISwitch *)sender;
- (IBAction)resetAction:(UIButton *)sender;
@end
