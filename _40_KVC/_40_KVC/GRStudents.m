//
//  GRStudents.m
//  _40_KVC
//
//  Created by Exo-terminal on 7/25/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRStudents.h"

@implementation GRStudents

-(BOOL)validateFirstName:(inout __autoreleasing id *)ioValue error:(out NSError *__autoreleasing *)outError{
    
    NSString* string = *ioValue;
    
    NSCharacterSet* validationSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    NSArray* componets = [string componentsSeparatedByCharactersInSet:validationSet];
    
    if ([componets count] > 1) {
        return NO;
        
    }else{
        
        return YES;
    }
}

-(BOOL)validateLastName:(inout __autoreleasing id *)ioValue error:(out NSError *__autoreleasing *)outError{
    
    NSString* string = *ioValue;
    
    NSCharacterSet* validationSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    NSArray* componets = [string componentsSeparatedByCharactersInSet:validationSet];
    
    if ([componets count] > 1) {
        return NO;
        
    }else{
        
        return YES;
    }
}

-(BOOL)validateGrade:(inout __autoreleasing id *)ioValue error:(out NSError *__autoreleasing *)outError{
    
    NSString* string = *ioValue;
    
    NSCharacterSet* validationSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray* componets = [string componentsSeparatedByCharactersInSet:validationSet];
    
    if ([componets count] > 1) {
        return NO;
        
    }else{
        
        return YES;
    }
}

-(BOOL)validateDateOfBirth:(inout __autoreleasing id *)ioValue error:(out NSError *__autoreleasing *)outError{
    
    NSString* string = *ioValue;
    
    NSCharacterSet* validationSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray* componets = [string componentsSeparatedByCharactersInSet:validationSet];
    
    if ([componets count] > 1) {
        return NO;
        
    }else{
        
        return YES;
    }
}

#pragma mark - Change

-(void)changeFirstName:(NSString*)firstName{
    
    [self willChangeValueForKey:@"firstName"];
    _firstName = firstName;
    [self didChangeValueForKey:@"firstName"];
}
-(void)changeLastName:(NSString*)lastName{
    
    [self willChangeValueForKey:@"lastName"];
    _lastName = lastName;
    [self didChangeValueForKey:@"lastName"];
    
}
-(void)changeGender:(GRGrade)gender{
    
    [self willChangeValueForKey:@"gender"];
    _gender = gender;
    [self didChangeValueForKey:@"gender"];
    
}
-(void)changeDateOfBirth:(NSInteger)dateOfBirth{
    
    [self willChangeValueForKey:@"dateOfBirth"];
    _dateOfBirth = dateOfBirth;
    [self didChangeValueForKey:@"dateOfBirth"];
    
}
-(void)changeGrade:(NSInteger)grade{
    
    [self willChangeValueForKey:@"grade"];
    _grade = grade;
    [self didChangeValueForKey:@"grade"];
    
}



@end
