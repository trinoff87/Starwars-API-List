//
//  ListControllerViewController.m
//  Starwars API
//
//  Created by Jose Trinidad Fajardo Flores on 11/14/17.
//  Copyright © 2017 Boletomovil. All rights reserved.
//

#import "ListViewController.h"
#import "CellMainTable.h"
#import "DetailController.h"

@interface ListViewController ()
@property NSMutableArray *charNames;
@property NSMutableArray *charNumbers;
@property SWObject *selectedPerson;
@property NSString *selectedNumber;
@property (strong, nonatomic) NSMutableArray *people;
@end

int indexCharacter = 0;

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _people = [[NSMutableArray alloc] init];
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
    [self getPeople];
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
            for(id obj in people){
                SWObject *person = (SWObject*)obj;
                NSString *name = person.name;
                NSLog(@"print name : %@", name);
                [self.charNames addObject: person.name];
                [self.charNumbers addObject: [NSString stringWithFormat:@"%d", indexCharacter]];
                indexCharacter++;
                [self.tblMain reloadData];
                [_people addObject:people];
            }
            [self.charNames addObject: nil];
            [self.charNumbers addObject: nil];
            [_people addObject:nil];
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
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
    cell.lblCharNumber.text = self.charNumbers[indexPath.row];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedPerson = _people[indexPath.row];
    [self performSegueWithIdentifier:@"segueID" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailController *detailController = segue.destinationViewController;
    detailController.character = self.selectedPerson;
}

@end
