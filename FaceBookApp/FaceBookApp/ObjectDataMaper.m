//
//  ObjectDataMaper.m
//  FaceBookApp
//
//  Created by CCDM24 on 06/09/14.
//  Copyright (c) 2014 CCDM24. All rights reserved.
//

#import "ObjectDataMaper.h"
#import "Publicacion.h"

@implementation ObjectDataMaper

-(BOOL) guardarPublicacion: (NSDictionary *) publicacion{
    NSError *error;
    
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    
    self.context = [self.appDelegate managedObjectContext];
    
    Publicacion *pub;
    
    pub = [NSEntityDescription insertNewObjectForEntityForName:@"Publicaciones" inManagedObjectContext:self.context];
    
    pub.objectId = [self genearId] + 1;
    pub.mensaje = [publicacion objectForKey:@"mensaje"];
    pub.autor = [publicacion objectForKey:@"autor"];
    pub.latitud = [publicacion objectForKey:@"latitud"];
    pub.longitud = [publicacion objectForKey:@"longitud"];
    
    [self.context save: &error];
    
    if( error != nil)
        return NO;
    return YES;
}

-(int) genearId{
    
    NSError *error;
    self.request = [[NSFetchRequest alloc] init];
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    self.context = [self.appDelegate managedObjectContext];
    
    [self.request setEntity : [NSEntityDescription entityForName:@"Publicaciones" inManagedObjectContext:self.context]];
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    NSArray *pubs = [self.context executeFetchRequest:self.request error:&error];
    
    if (error != nil)
        return [pubs count];
    else
        return 0;
    
    
}

-(NSMutableArray *) obtenerPublicaciones{
    NSError *error;
    self.request = [[NSFetchRequest alloc] init];
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    self.context = [self.appDelegate managedObjectContext];
    
    [self.request setEntity : [NSEntityDescription entityForName:@"Publicaciones" inManagedObjectContext:self.context]];
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    NSArray *pubs = [self.context executeFetchRequest:self.request error:&error];
    
    if (error != nil)
    {
        return result;
    }
    
    NSDictionary *obj;
    for(Publicacion *pub in pubs)
    {
        obj = @{
                @"id"       : [NSString stringWithFormat:@"%d", pub.objectId],
                @"mensaje" : pub.mensaje,
                @"autor"    : pub.autor,
                @"latitud" : pub.latitud,
                @"longitud" :  pub.longitud
                
                };
        [result addObject:obj];
    
    }
    return  result;
}

-(BOOL) eliminarPublicacion:(NSManagedObjectID *) objectID{
    
    NSError *error;
    
    self.request = [[NSFetchRequest alloc] init];
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    self.context = [self.appDelegate managedObjectContext];
    
    [self.request setEntity:[NSEntityDescription entityForName:@"Publicaciones" inManagedObjectContext:self.context]];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF == %@", objectID];
    
    [self.request setPredicate:predicate];
    
    [self.context deleteObject: [[self.context executeFetchRequest:self.request error:&error] lastObject]]; //firstObject, lastObject
    
    [self.context save:&error];
    
    if(error != nil)
        return NO;
    
    return YES;
}

-(BOOL) editarPublicacion : (NSDictionary *) publicacion{
    NSError *error;
    
    self.request = [[NSFetchRequest alloc] init];
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    self.context = [self.appDelegate managedObjectContext];
    
    
    [self.request setEntity: [NSEntityDescription entityForName:@"Publicaciones" inManagedObjectContext:self.context]];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF == %@", [publicacion objectForKey:@"id"]];
    
    [self.request setPredicate:predicate];
    
    Publicacion *pub = [[self.context executeFetchRequest:self.request error:&error]firstObject];
    
    pub.autor = [publicacion objectForKey:@"autor"];
    pub.mensaje = [publicacion objectForKey:@"mensaje"];
    pub.latitud = [publicacion objectForKey:@"latitud"];
    pub.longitud = [publicacion objectForKey:@"longitud"];
    
    [self.context save:&error];
    
    if(error != nil)
        return NO;    
    
    return  YES;

}


@end
