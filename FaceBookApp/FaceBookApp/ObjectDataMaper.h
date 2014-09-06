//
//  ObjectDataMaper.h
//  FaceBookApp
//
//  Created by CCDM24 on 06/09/14.
//  Copyright (c) 2014 CCDM24. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface ObjectDataMaper : NSObject

@property(strong, nonatomic) AppDelegate *appDelegate;
@property(strong, nonatomic) NSManagedObjectContext *context;
@property(strong, nonatomic) NSEntityDescription *entity;
@property(strong, nonatomic) NSFetchRequest *request;

-(BOOL) guardarPublicacion: (NSDictionary *) publicacion;

@end
