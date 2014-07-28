//
//  GRAppDelegate.m
//  _40_2_KVC
//
//  Created by Exo-terminal on 7/25/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRAppDelegate.h"
#import "GRStudent.h"

@interface GRAppDelegate()
@property(strong, nonatomic)NSArray* students;

@end

@implementation GRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    /*GRStudent* student1 = [GRStudent randomStudent];
    GRStudent* student2 = [GRStudent randomStudent];
    GRStudent* student3 = [GRStudent randomStudent];
    GRStudent* student4 = [GRStudent randomStudent];
    GRStudent* student5 = [GRStudent randomStudent];*/
    
    NSMutableArray* allStudents = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 100; i++) {
        
        GRStudent* student1 = [GRStudent randomStudent];
        [allStudents addObject:student1];
        
    }
    
    for (int i = 0; i < [allStudents count]; i++) {
        
        GRStudent* newStudent = [allStudents objectAtIndex:i];
        GRStudent* nextStudent = nil;
        
        if ((i + 1) < [allStudents count]) {
            
          nextStudent = [allStudents objectAtIndex:i + 1];
        }else{
            
          nextStudent = [allStudents firstObject];
        }
        
        newStudent.myFriend = nextStudent;
        
    }
    self.students = [NSArray arrayWithArray:allStudents];
    
    NSArray* firstNameArray = [self.students valueForKeyPath:@"firstName"];
    NSArray* dateArray = [self.students valueForKeyPath:@"dateOfBirth"];
    
    NSDate* earlyDate = [dateArray firstObject];
    NSDate* latestDate = [dateArray lastObject];
    
    for (NSDate* date in dateArray) {
        
        earlyDate = [earlyDate earlierDate:date];
        latestDate = [latestDate laterDate:date];

    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterFullStyle];
    NSString *dateString1 = [dateFormatter stringFromDate:earlyDate];
    NSString *dateString2 = [dateFormatter stringFromDate:latestDate];
    
    
    NSLog(@"самые ранний - %@, поздний - %@",dateString1,dateString2);
    
    
//    NSLog(@"%@",firstNameArray);
    
    
//    GRStudent* newStudent = [self.students firstObject];
    
//    [self changeFriend:newStudent];
   
    return YES;
}


-(void)changeFriend:(GRStudent*)student{
    
    GRStudent* friend = student.myFriend;
    
    int random = arc4random()%[self.students count];
    
    student.myFriend = [self.students objectAtIndex:random];
    
//    NSLog(@"%@ student is friend %@",friend.firstName, student.firstName);
    
    [self changeFriend:friend];
}



#pragma mark - Observer

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context{
    
    NSLog(@"\nobserveValueForKeyPath keyPath: - %@\n object - %@\n change - %@\n",keyPath,object,change);
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
