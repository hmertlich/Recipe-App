//
//  RAViewController.m
//  Recipe App
//
//  Created by Skyler Tanner on 7/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RAViewController.h"
#import "RecipesTableViewDataSource.h"
#import "RecipeDetailViewController.h"
#import "RARecipes.h"

@interface RAViewController () 

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) RecipesTableViewDataSource *dataSource;

@end

@implementation RAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = [UIColor blueColor];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.dataSource = [RecipesTableViewDataSource new];
    
//    [self.dataSource regTableView:self.tableView];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self.dataSource;
    
    [self.view addSubview:self.tableView];
 
    self.title =@"Recipes App";
    
 
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    RecipeDetailViewController *recipeDetailViewController = [RecipeDetailViewController new];
    recipeDetailViewController.recipeIndex = indexPath.row;
    [self.navigationController pushViewController:recipeDetailViewController animated:YES];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
