/* With External Data Sources, if you want to have a subtitle on the cell,
you need to make sure you do not have a forIndexPath set when Instantiating the UITableViewCell.*/

//  RecipesTableViewDataSource.m
//  Recipe App
//
//  Created by Skyler Tanner on 7/8/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipesTableViewDataSource.h"
#import "RecipeDetailViewController.h"

static NSString *cellID = @"cellID";

@implementation RecipesTableViewDataSource
//
//- (void)regTableView:(UITableView *)tableView {
//    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
//}

#pragma mark - TABLE VIEW DATA SOURCE ORDER:

//number 1
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [RARecipes count];
}
//number 2
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [RARecipes titleAtIndex:indexPath.row];
    cell.detailTextLabel.text = [RARecipes descriptionAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[RecipesTableViewDataSource imagesArray][indexPath.row]];
    
    return cell;
}

+(NSArray *)imagesArray
{
    return @[@"herbgarlicport_360.png",@"glazedsalmon_360.png",@"pumpkinpie_360.png",@"chickenJumb.png",@"chocolatecake_360.png"];
}

@end
