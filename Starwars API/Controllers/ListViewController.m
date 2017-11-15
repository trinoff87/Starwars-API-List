//
//  ListControllerViewController.m
//  Starwars API
//
//  Created by Jose Trinidad Fajardo Flores on 11/14/17.
//  Copyright © 2017 Boletomovil. All rights reserved.
//

#import "ListViewController.h"
#import "CellMainTable.h"

@interface ListViewController ()
@property NSMutableArray *charNames;
@property NSMutableArray *charNumbers;
@property NSString *selectedName;
@property NSString *selectedNumber;
@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController {
    self.charNames = [NSMutableArray new];
    self.charNumbers = [NSMutableArray new];
}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.charNames.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    CellMainTable *cell = (CellMainTable *)[tableView dequeueReusableCellWithIdentifier:@"CellMainTable"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"CellMainTable" bundle:nil] forCellReuseIdentifier:@"CellMainTable"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CellMainTable"];
    }
    //Fill cell with info from arrays
    cell.lblCharName.text = self.charNames[indexPath.row];
    cell.lblCharNumber = self.charNumbers[indexPath.row];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedName = self.charNames[indexPath.row];
    self.selectedNumber =  self.charNumbers[indexPath.row];
    [self performSegueWithIdentifier:@"segueID" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //TODO Pass over to home.m
    //CharacterDetail *detailController = segue.destinationViewController;
    //detailController.age = self.selectedAge;
    //detailController.image = self.selectedImg;
}

@end
