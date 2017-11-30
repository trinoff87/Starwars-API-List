//
//  ViewController.h
//  Starwars API
//
//  Created by Walter Gonzalez Domenzain on 08/11/17.
//  Copyright © 2017 Boletomovil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServices.h"
#import "Constants.h"

@interface DetailController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameValue;
@property (nonatomic, strong) SWObject * character;
@property (weak, nonatomic) IBOutlet UILabel *heightValue;
@property (weak, nonatomic) IBOutlet UILabel *massValue;
@property (weak, nonatomic) IBOutlet UILabel *hairColorValue;
@property (weak, nonatomic) IBOutlet UILabel *skinColorValue;
@property (weak, nonatomic) IBOutlet UILabel *eyeColorValue;
@property (weak, nonatomic) IBOutlet UILabel *genderValue;

@end

