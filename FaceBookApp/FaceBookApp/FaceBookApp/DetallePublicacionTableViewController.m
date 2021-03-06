//
//  DetallePublicacionTableViewController.m
//  FaceBookApp
//
//  Created by CCDM02 on 16/08/14.
//  Copyright (c) 2014 CCDM02. All rights reserved.
//

#import "DetallePublicacionTableViewController.h"
#import "ObjectDataMaper.h"

@interface DetallePublicacionTableViewController ()

@end

@implementation DetallePublicacionTableViewController{
    BOOL editando;
    ObjectDataMaper *odm;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    editando = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    odm = [[ObjectDataMaper alloc]init];
    
    self.lblAutor.text = [self.publicacion objectForKey:@"autor"];
    self.textMensaje.text = [self.publicacion objectForKey:@"mensaje"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if ( section == 0){
        return 1;
    }
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

#pragma mark - Actions

- (IBAction)cerrar:(UIBarButtonItem *)sender{
    [self dismissViewControllerAnimated: YES completion:nil];
}

- (IBAction)editarPublicacion:(id)sender{

    if(editando)
    {
        editando = NO;
        self.navigationItem.rightBarButtonItem.title = @"Editar";
        
        if( ![odm editarPublicacion:self.publicacion]){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"No se pudo actualizar la publicacio." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    else
    {
        editando = YES;
        self.navigationItem.rightBarButtonItem.title = @"Guardar";
    }
    
    [self.textMensaje setEditable:editando];
}

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
    
    if ( [[segue identifier] isEqualToString:@"detallePublicacionSegue"]  )
    {
        DetallePublicacionTableViewController *dpvc = [segue destinationViewController];
        dpvc.publicacion;
    }
    
}

*/
@end
