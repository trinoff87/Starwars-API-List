//
//  ViewController.m
//  Starwars API
//
//  Created by Walter Gonzalez Domenzain on 08/11/17.
//  Copyright © 2017 Boletomovil. All rights reserved.
//

#import "Home.h"

@interface Home ()
@property (strong, nonatomic) NSMutableArray *people;

@end

int indexPerson = 0;

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _people = [[NSMutableArray alloc] init];
    [self getPeople];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//********************************************************************************************
#pragma mark                            Data methods
//********************************************************************************************
- (void)getPeople{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [WebServices getPeople:^(NSMutableArray<SWObject> *people) {
        
        if(people){
            [_people removeAllObjects];
            [_people addObjectsFromArray:people];
            
            SWObject *person = [people objectAtIndex:indexPerson];
            NSString *name = person.name;
            
            NSLog(@"print name : %@", name);
            self.lblName.text = name;
            self.lblName.adjustsFontSizeToFitWidth = YES;
            indexPerson++;
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
}

//********************************************************************************************
#pragma mark                            Action methods
//********************************************************************************************
- (IBAction)btnUpdatePressed:(id)sender {
    [self getPeople];
}






@end
