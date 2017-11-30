//
//  ViewController.m
//  Starwars API
//
//  Created by Walter Gonzalez Domenzain on 08/11/17.
//  Copyright © 2017 Boletomovil. All rights reserved.
//

#import "DetailController.h"

@interface DetailController ()

@end

int indexPerson = 0;

@implementation DetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameValue.text = self.character.name;
    self.heightValue.text = self.character.height;
    self.massValue.text = self.character.mass;
    self.hairColorValue.text = self.character.hair_color;
    self.skinColorValue.text = self.character.skin_color;
    self.eyeColorValue.text = self.character.eye_color;
    self.genderValue.text = self.character.gender;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnBackPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
