//
//  ViewController.h
//  headerDemo
//
//  Created by Harry on 11/11/16.
//  Copyright © 2016 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) IBOutlet UIView *firstview;

@property (strong, nonatomic) IBOutlet UIView *secoudview;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *firstviewTop;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *secoudviewTop;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *tableviewTop;


@end

