//
//  main.m
//  EjercicioLineaComandos
//
//  Created by CCDM02 on 15/08/14.
//  Copyright (c) 2014 CCDM02. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        //NSLog(@"Hello, World!");
        NSString *mensaje = @"Hola a la calculadora";
        NSLog(@"%@",mensaje);
        
        float primerValor;
        scanf("%f", &primerValor);
        
        int opcion;
        scanf("%d",&opcion);
        
        float segundoValor;
        scanf("%f", &segundoValor);
        
        /*
         0 : Suma
         1 : Resta
         2 : Multiplica
         3 : Divide
         
         */
        float operacion = 0;
        
        switch (opcion) {
            case 0:
                operacion = primerValor + segundoValor;
                break;
            case 1:
                operacion = primerValor - segundoValor;
                break;
            case 2:
                operacion = primerValor * segundoValor;
                break;
            case 3:
                if(segundoValor != 0 )
                {
                    operacion = primerValor / segundoValor;
                }
                else
                    NSLog(@"No se puede dividir entre 0");
                
                break;
            default:
                NSLog(@"Opción inválida.");
           
        }
        
        
        
    }
    return 0;
}

