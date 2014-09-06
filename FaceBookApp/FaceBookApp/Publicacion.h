//
//  Publicacion.h
//  FaceBookApp
//
//  Created by CCDM24 on 06/09/14.
//  Copyright (c) 2014 CCDM24. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Publicacion : NSManagedObject

@property (strong, nonatomic) NSString *mensaje;
@property (strong, nonatomic) NSString *autor;
@property (assign, nonatomic) double latitud;
@property (assign, nonatomic) double longitud;



@end
