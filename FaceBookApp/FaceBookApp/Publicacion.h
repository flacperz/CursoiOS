//
//  Publicacion.h
//  FaceBookApp
//
//  Created by CCDM24 on 06/09/14.
//  Copyright (c) 2014 CCDM24. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Publicacion : NSManagedObject

@property (assign, nonatomic) int objectId;
@property (strong, nonatomic) NSString *mensaje;
@property (strong, nonatomic) NSString *autor;
@property (assign, nonatomic) NSString *latitud;
@property (assign, nonatomic) NSString *longitud;



@end
