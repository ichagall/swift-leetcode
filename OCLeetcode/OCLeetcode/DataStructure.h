//
//  DataStructure.h
//  OCLeetcode
//
//  Created by ght on 2019/2/25.
//  Copyright © 2019 youdao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject
@property (nonatomic, strong) TreeNode *right;
@property (nonatomic, strong) TreeNode *left;
@property (nonatomic, strong) NSString *value;
@end

NS_ASSUME_NONNULL_END
