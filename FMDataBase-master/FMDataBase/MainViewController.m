//
//  MainViewController.m
//  FMDataBase
//
//  Created by 林梦夕 on 15/6/24.
//  Copyright (c) 2015年 林梦夕. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
#import "CarWashTableCell.h"
#import "AFNetworking.h"
#import "FMDB.h"
#import "FMTools.h"
#import "FMModel.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *carTable;

@property (nonatomic,strong) FMDatabase *data;
@property (nonatomic,strong) NSMutableArray *carArray;

@end

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.carTable reloadData];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UINib *nib = [UINib nibWithNibName:@"CarWashTableCell" bundle:[NSBundle mainBundle]];
    [self.carTable registerNib:nib forCellReuseIdentifier:@"cell"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"http://121.40.54.74:8080/service/find" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSArray *serviceArray = [responseObject objectForKey:@"services"];
        
        for (NSDictionary *carDic in serviceArray) {
        
            FMModel *model = [[FMModel alloc] init];
            model.shopId = [[carDic objectForKey:@"shopId"] integerValue];
            model.content = [carDic objectForKey:@"content"];
            model.discountPic = [carDic objectForKey:@"discountpic"];
            model.id = [[carDic objectForKey:@"id"] integerValue];
            model.price = [[carDic objectForKey:@"price"] integerValue];
            model.workerNum = [[carDic objectForKey:@"workerNum"] integerValue];
            model.sellNum = [[carDic objectForKey:@"sellnum"] integerValue];
            model.type = [[carDic objectForKey:@"type"] integerValue];
            model.name = [carDic objectForKey:@"name"];
            model.state = [[carDic objectForKey:@"state"] integerValue];
            model.selected = 0;
        
//            [FMTools addModel:model];
            
            
        }
        
        self.carArray = [FMTools modelArray];
        [self.carTable reloadData];

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    // Do any additional setup after loading the view.
}

- (NSMutableArray *)carArray {
    
    if (!_carArray) {
        
        _carArray = [NSMutableArray array];
        
    }
    
    return _carArray;
    
}
#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.carArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CarWashTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    FMModel *model = self.carArray[indexPath.row];
    
//    NSString *imgUrl = [infoDic objectForKey:@"discountpic"];
//    if (imgUrl) {
//        [cell.headImgView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"登录界面图标"] options:SDWebImageContinueInBackground];
//        
//    }
    cell.titleLabel.text = model.name;
    cell.scoreLabel.text = model.content;
    cell.scoreImgView.image = [UIImage imageNamed:@"等级1.png"];
    cell.priceLabel.text = [NSString stringWithFormat:@"%ld",(long)model.price];

    if (model.selected == 1) {
    
        cell.backView.backgroundColor = [UIColor yellowColor];
        
    }
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    ViewController *vc = [board instantiateViewControllerWithIdentifier:@"viewController"];
    
    
    [self presentViewController:vc animated:YES completion:^{
        
        [FMTools changeModel:indexPath.row];
        
    }];
    
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
