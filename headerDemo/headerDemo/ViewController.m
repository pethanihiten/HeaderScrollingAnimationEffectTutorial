//
//  ViewController.m
//  headerDemo
//
//  Created by Harry on 11/11/16.
//  Copyright © 2016 Harry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
  NSArray *tableData;
  CGPoint _lastContentOffset;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
      tableData = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini",@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
    
      _tableview.delegate = self;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _lastContentOffset = scrollView.contentOffset;
    CGPoint translation = [scrollView.panGestureRecognizer translationInView:scrollView.superview];
    
    if(translation.y > 0)
    {
        
        // react to dragging up
        NSLog(@"Scrolled Up");
        
        [self.view layoutIfNeeded];
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn  animations:^{
            
            
            _tableviewTop.constant = 64;
            CGRect newFrame = self.firstview.frame;
            newFrame.size.height = 64;
            [self.firstview setFrame:newFrame];
            CGRect newFrame1 = self.secoudview.frame;
            newFrame1.size.height = 64;
            [self.secoudview setFrame:newFrame1];
            [self.view layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            //code for completion
        }];
        
    } else
    {
        
        
        // react to dragging down
        NSLog(@"Scrolled dowm");
        
        [self.view layoutIfNeeded];
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn  animations:^{
            
            _tableviewTop.constant = -64;
            CGRect newFrame = self.firstview.frame;
            newFrame.size.height = 0;
            [self.firstview setFrame:newFrame];
            CGRect newFrame1 = self.secoudview.frame;
            newFrame1.size.height = 0;
            [self.secoudview setFrame:newFrame1];
            
            [self.view layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            //code for completion
        }];
        

    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
     if (_lastContentOffset.y < scrollView.contentOffset.y) {
         // react to dragging down
         NSLog(@"Scrolled dowm");
         
         [self.view layoutIfNeeded];
         [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn  animations:^{
             
             _tableviewTop.constant = -64;
             CGRect newFrame = self.firstview.frame;
             newFrame.size.height = 0;
             [self.firstview setFrame:newFrame];
             CGRect newFrame1 = self.secoudview.frame;
             newFrame1.size.height = 0;
             [self.secoudview setFrame:newFrame1];
             
             [self.view layoutIfNeeded];
             
         } completion:^(BOOL finished) {
             //code for completion
         }];
        
       
        
     }
    
    else if (_lastContentOffset.y > scrollView.contentOffset.y) {
        NSLog(@"Scrolled Up");
        
        [self.view layoutIfNeeded];
        [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn  animations:^{
            
            
            _tableviewTop.constant = 64;
            CGRect newFrame = self.firstview.frame;
            newFrame.size.height = 64;
            [self.firstview setFrame:newFrame];
            CGRect newFrame1 = self.secoudview.frame;
            newFrame1.size.height = 64;
            [self.secoudview setFrame:newFrame1];
            [self.view layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            //code for completion
        }];

        
    }
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
//    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
//    recipeImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
//    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}



@end
