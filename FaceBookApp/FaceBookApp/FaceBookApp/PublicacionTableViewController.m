//
//  PublicacionTableViewController.m
//  FaceBookApp
//
//  Created by CCDM02 on 23/08/14.
//  Copyright (c) 2014 CCDM02. All rights reserved.
//

#import "PublicacionTableViewController.h"
#define CARACTERES 10

@interface PublicacionTableViewController ()

@end

@implementation PublicacionTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Se crea un gesto.
    UITapGestureRecognizer  *tap;
    tap = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(cerrarTeclado)];
    
    //Se agrega a la vista.
    [self.view addGestureRecognizer:tap];
    
    //Con esta linea de codigo nuestro componente grafico ya esta siendo reconocido por una clase.
    self.txtEstado.delegate = self;
    
    self.txtCaracteres.text = [NSString stringWithFormat:@"%d", CARACTERES];
}

- (IBAction) publicar:(UIButton *)sender{
    NSUserDefaults *ud;
    ud = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *obj = @{
        @"autor" : @"Flavio Cortez",
        @"mensaje" : self.txtEstado.text
        };
    
    NSMutableArray *publicaciones = [[NSMutableArray alloc]init];
    
    [publicaciones addObject:obj];
    
    if( [ud objectForKey:@"publicaciones"] != nil )
    {
        [publicaciones addObjectsFromArray:[ud objectForKey:@"publicaciones"]];
    }
    
    [ud setObject:publicaciones forKey:@"publicaciones"];
    
    
    
    //[ud setValue:publicaciones forKeyPath:@"publicaciones"];
    
    [ud synchronize];
    
    self.txtEstado.text = @"";
    
    self.txtCaracteres.text = [NSString stringWithFormat:@"%d", CARACTERES];
    
}

- (void) cerrarTeclado
{
    [self.txtEstado resignFirstResponder];
    //NSLog(@"gesto");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    //NSLog(@"%@", string);
    //return true;
    
    
    NSString *text = [textField.text stringByReplacingCharactersInRange: range withString:string];
    
    

    
    if( [text length] > CARACTERES )
    {
        self.txtCaracteres.textColor = [UIColor redColor];
        return NO;
    }
    
    else
    {
        self.txtCaracteres.text = [NSString stringWithFormat:@"%d",CARACTERES - [text length]];
        self.txtCaracteres.textColor = [UIColor blackColor];
        
    }
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if ( section == 0)
    {
        return 1;
    }
    else if ( section == 1)
    {
        return 2;
    }
    return 0;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    return [ textField resignFirstResponder ];
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
