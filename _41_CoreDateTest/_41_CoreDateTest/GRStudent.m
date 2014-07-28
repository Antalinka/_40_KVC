//
//  GRStudent.m
//  _41_CoreDateTest
//
//  Created by Exo-terminal on 7/25/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRStudent.h"


@implementation GRStudent

@dynamic firstName;
@dynamic lastName;
@dynamic dateOfBirth;
@dynamic score;




-(void)setFirstName:(NSString *)firstName{
    
    [self willChangeValueForKey:@"firstName"];
    [self setPrimitiveValue:firstName forKey:@"firstName"];
    
    [self didChangeValueForKey:@"firstName"];
    
    NSLog(@"setFirstName");
    
}


 - (NSString*) firstName {
 
 NSString* string = nil;
 
 [self willAccessValueForKey:@"firstName"];
 string = [self primitiveValueForKey:@"firstName"];
 [self didAccessValueForKey:@"firstName"];
 
 //NSLog(@"GET FIRST NAME!!!");
 
 return string;
 }




/*-(NSString*)firstName{
    
    NSString* string = nil;
    [self willAccessValueForKey:@"firstName"];
    
    string = [self primitiveValueForKey:@"firstName"];
    [self didAccessValueForKey:@"firstName"];
    
     NSLog(@"getter");
    
    return string;
    
    
}*/

/*-(BOOL)validateLastName:(__autoreleasing id *)value error:(NSError *__autoreleasing *)error{
    
    return YES;
    
}*/


@end
