//
//  GRStudents.h
//  _40_KVC
//
//  Created by Exo-terminal on 7/25/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    GRGradeMale,
    GRGradeFemale,
} GRGrade;

@interface GRStudents : NSObject

@property(strong, nonatomic)NSString* firstName;
@property(strong, nonatomic)NSString* lastName;
@property(assign, nonatomic)GRGrade gender;
@property(assign, nonatomic)NSInteger dateOfBirth;
@property(assign, nonatomic)NSInteger grade;

-(void)changeFirstName:(NSString*)firstName;
-(void)changeLastName:(NSString*)lastName;
-(void)changeGender:(GRGrade)gender;
-(void)changeDateOfBirth:(NSInteger)dateOfBirth;
-(void)changeGrade:(NSInteger)grade;

@end
