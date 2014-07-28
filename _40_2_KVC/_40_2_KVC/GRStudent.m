//
//  GRStudent.m
//  _40_2_KVC
//
//  Created by Exo-terminal on 7/25/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRStudent.h"

static NSString* firstName[] = { @"Tran", @"Lenore", @"Bud", @"Fredda", @"Katrice",
    @"Clyde", @"Hildegard", @"Vernell", @"Nellie", @"Rupert",
    @"Billie", @"Tamica", @"Crystle", @"Kandi", @"Caridad",
    @"Vanetta", @"Taylor", @"Pinkie", @"Ben", @"Rosanna",
    @"Eufemia", @"Britteny", @"Ramon", @"Jacque", @"Telma",
    @"Colton", @"Monte", @"Pam", @"Tracy", @"Tresa",
    @"Willard", @"Mireille", @"Roma", @"Elise", @"Trang",
    @"Ty", @"Pierre", @"Floyd", @"Savanna", @"Arvilla",
    @"Whitney", @"Denver", @"Norbert", @"Meghan", @"Tandra",
    @"Jenise", @"Brent", @"Elenor", @"Sha", @"Jessie"
};
static NSString* lastName[] = {
    
    @"Farrah", @"Laviolette", @"Heal", @"Sechrest", @"Roots",
    @"Homan", @"Starns", @"Oldham", @"Yocum", @"Mancia",
    @"Prill", @"Lush", @"Piedra", @"Castenada", @"Warnock",
    @"Vanderlinden", @"Simms", @"Gilroy", @"Brann", @"Bodden",
    @"Lenz", @"Gildersleeve", @"Wimbish", @"Bello", @"Beachy",
    @"Jurado", @"William", @"Beaupre", @"Dyal", @"Doiron",
    @"Plourde", @"Bator", @"Krause", @"Odriscoll", @"Corby",
    @"Waltman", @"Michaud", @"Kobayashi", @"Sherrick", @"Woolfolk",
    @"Holladay", @"Hornback", @"Moler", @"Bowles", @"Libbey",
    @"Spano", @"Folson", @"Arguelles", @"Burke", @"Rook"
    
};

static int namesCount = 50;

@implementation GRStudent

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
-(void)changeDateOfBirth:(NSDate*)dateOfBirth{
    
    [self willChangeValueForKey:@"dateOfBirth"];
    _dateOfBirth = dateOfBirth;
    [self didChangeValueForKey:@"dateOfBirth"];
    
}
-(void)changeGrade:(NSInteger)grade{
    
    [self willChangeValueForKey:@"grade"];
    _grade = grade;
    [self didChangeValueForKey:@"grade"];
    
}

+(GRStudent*)randomStudent{
    
    GRStudent* student = [[GRStudent alloc]init];
    student.firstName = firstName[arc4random() % namesCount];
    
    
    
    student.lastName = lastName[arc4random() % namesCount];
    student.gender = arc4random() % 2;
    student.grade = arc4random() % 100;
    
    
    NSInteger a = arc4random()%(4015*24*60*60)+(6570*24*60*60);
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:-a];

    
    student.dateOfBirth = date;
    
    
    return student;
    
}

@end
