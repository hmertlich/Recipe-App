//
//  RecipeDetailViewController.m
//  Recipe App
//
//  Created by Skyler Tanner on 7/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RecipeDetailViewController.h"
#import "RARecipes.h"
#import "RecipesTableViewDataSource.h"

static CGFloat margin = 15;
static NSString *imageID;
@interface RecipeDetailViewController ()

//@property (nonatomic, assign) NSInteger recipeIndex;
@property (nonatomic) CGFloat topMargin;

@end

@implementation RecipeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    self.title = [RARecipes titleAtIndex:self.recipeIndex];

    self.topMargin = 350;
    
    CGFloat heightForDescription = [self heightForDescriptions:[RARecipes descriptionAtIndex:self.recipeIndex]];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    
   
    //
    UILabel *descriptionLabel = [[UILabel alloc]initWithFrame:CGRectMake(margin, self.topMargin, self.view.frame.size.width-2*margin, heightForDescription)];
    descriptionLabel.font = [UIFont boldSystemFontOfSize:14];
    descriptionLabel.text = [RARecipes descriptionAtIndex:self.recipeIndex];
    
    //by setting the numberOfLines = 0 it will let us have as many lines as we need.
    descriptionLabel.numberOfLines =0;
    
    [scrollView addSubview:descriptionLabel];
    
    
    //Adds an image of the food to the top of the description view.
    UIImage *image = [UIImage imageNamed:[RARecipes imageAtIndex:self.recipeIndex]];
    UIImageView *recipeImage = [[UIImageView alloc]initWithImage:image];
    [scrollView addSubview:recipeImage];
    
    CGFloat top = self.topMargin+heightForDescription +margin*2;
    
    UILabel *ingredientsTitle = [[UILabel alloc]initWithFrame:CGRectMake(margin, top, self.view.frame.size.width-2*margin, 44)];
    ingredientsTitle.text = @"The Ingredients";
    ingredientsTitle.font = [UIFont boldSystemFontOfSize:15];
    [scrollView addSubview:ingredientsTitle];
    
    top += (20+margin);
    
    for (int i =0; i<[RARecipes ingredientCountAtIndex:self.recipeIndex]; i++) {
        
        
        UILabel *volume = [[UILabel alloc]initWithFrame:CGRectMake(margin, top, (self.view.frame.size.width-2*margin)/4, 44)];
        volume.font = [UIFont italicSystemFontOfSize:15];
        volume.text = [RARecipes ingredientVolumeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        [scrollView addSubview:volume];
        
        UILabel *type =[[UILabel alloc]initWithFrame:CGRectMake(margin+(self.view.frame.size.width-2*margin)/4, top, (self.view.frame.size.width -2*margin) *3/4, 44)];
        type.numberOfLines = 0;
        type.font = [UIFont boldSystemFontOfSize:15];
        type.text = [RARecipes ingredientTypeAtIndex:i inRecipeAtIndex:self.recipeIndex];
        [scrollView addSubview:type];
    
        top += (20+margin);
    }
    
    top+=margin;
    
    UILabel *directionsLabel = [[UILabel alloc]initWithFrame:CGRectMake(margin, top, self.view.frame.size.width-2*margin, 44)];
    directionsLabel.text = @"Directions";
    directionsLabel.font =[UIFont boldSystemFontOfSize:15];
    [scrollView addSubview:directionsLabel];
    
    top+=(20+margin);
    
    for (int i=0; i < [[RARecipes directionsAtIndex:self.recipeIndex] count]; i++) {
        
        CGFloat height = [self heightForDirections:[RARecipes directionsAtIndex:self.recipeIndex][i]];
        
        UILabel *count=[[UILabel alloc]initWithFrame:CGRectMake(margin, top, 30, 20)];
        count.font =[UIFont boldSystemFontOfSize:15];
        count.text =[NSString stringWithFormat:@"%d", i+1];
        [scrollView addSubview:count];
        
        UILabel *direction = [[UILabel alloc]initWithFrame:CGRectMake(margin+30, top, (self.view.frame.size.width-2 *margin -40), height)];
        direction.numberOfLines = 0;
        direction.text =[RARecipes directionsAtIndex:self.recipeIndex][i];
        
        [scrollView addSubview:direction];
        
        top+= (height+margin);
    }
    scrollView.contentSize =CGSizeMake(self.view.frame.size.width, top+margin);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//returns the height of a box that will hold the description text. Also sets the font size. The text will fill the size of the box.
-(CGFloat) heightForDescriptions:(NSString*)description{
    CGRect bounding =[description boundingRectWithSize:CGSizeMake(self.view.frame.size.width-2*margin, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    
    return bounding.size.height;
    
}
//same as above but for directions
-(CGFloat) heightForDirections:(NSString*)description{
    CGRect bounding =[description boundingRectWithSize:CGSizeMake(self.view.frame.size.width-2*margin-40, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    
    return bounding.size.height;
    
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
