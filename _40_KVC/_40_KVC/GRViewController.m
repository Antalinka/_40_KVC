//
//  GRViewController.m
//  _40_KVC
//
//  Created by Exo-terminal on 7/25/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRViewController.h"
#import "GRStudents.h"

@interface GRViewController () <UITextFieldDelegate>
@property(strong, nonatomic)GRStudents* student;

@end

@implementation GRViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.student = [[GRStudents alloc]init];
    
    [self.student changeGender:GRGradeMale];
    
    [self.student addObserver:self
                   forKeyPath:@"firstName"
                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:NULL];

    [self.student addObserver:self
                   forKeyPath:@"lastName"
                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:NULL];
    [self.student addObserver:self
                   forKeyPath:@"gender"
                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:NULL];
    
    [self.student addObserver:self
                   forKeyPath:@"dateOfBirth"
                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:NULL];
    [self.student addObserver:self
                   forKeyPath:@"grade"
                      options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:NULL];
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    BOOL isTrue = NO;
    
    if ([textField isEqual:[self.textFieldCollection objectAtIndex:0]]) {
        
        NSError* error = nil;
        NSString* firstName = [NSString stringWithFormat:@"%@%@",textField.text,string];
        
        isTrue = [self.student validateValue:&firstName forKey:@"firstName" error:&error];
        
        if (isTrue) {
            
            [self.student changeFirstName:firstName];
        }
        
    }else if([textField isEqual:[self.textFieldCollection objectAtIndex:1]]){
        
        NSError* error = nil;
        NSString* lastName = [NSString stringWithFormat:@"%@%@",textField.text,string];
        
        isTrue = [self.student validateValue:&lastName forKey:@"lastName" error:&error];
        
        if (isTrue) {
            [self.student changeLastName:lastName];
        }
        
    }else if([textField isEqual:[self.textFieldCollection objectAtIndex:2]]){
        
        NSError* error = nil;
        NSString* dateOfBirth = [NSString stringWithFormat:@"%@%@",textField.text,string];
        
        
        if ([dateOfBirth length] > 10) {
            return  NO;
        }
        
        isTrue = [self.student validateValue:&dateOfBirth forKey:@"dateOfBirth" error:&error];
        
        if (isTrue) {
            
            [self.student changeDateOfBirth:(NSInteger)dateOfBirth];
        }

        
    }else if([textField isEqual:[self.textFieldCollection objectAtIndex:3]]){
        
        NSError* error = nil;
        NSString* grade = [NSString stringWithFormat:@"%@%@",textField.text,string];
        
        if (grade.length > 2) {
            return NO;
        }
        
        isTrue = [self.student validateValue:&grade forKey:@"grade" error:&error];
        
        if (isTrue) {
            
            [self.student changeGrade:(NSInteger)grade];
            
        }
    }
    
     return isTrue;
}

#pragma mark - Action

- (IBAction)actionGrade:(UISwitch *)sender {
    
    if ([sender isOn]) {
        [self.student changeGender:GRGradeMale];
        self.gradeLabel.text = @"male";
    }else{
        
        [self.student changeGender:GRGradeFemale];
        self.gradeLabel.text = @"female";
    }
    
}
#pragma mark - Observer

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context{
    
    NSLog(@"\nobserveValueForKeyPath keyPath: - %@\n object - %@\n change - %@\n",keyPath,object,change);
    
}

- (IBAction)resetAction:(UIButton *)sender {
    
    self.student.firstName = nil;
    self.student.lastName = nil;
    self.student.dateOfBirth = 0;
    self.student.grade = 0;
    [self.student changeGender:GRGradeMale];
    
    for (UITextField* textField in self.textFieldCollection) {
        textField.text = nil;
    }
    
    self.
    self.gradeLabel.text = @"male";
    self.genderSwitch.on = YES;
    
    
}
@end
