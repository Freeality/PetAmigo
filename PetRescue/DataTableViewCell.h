//
//  DataTableViewCell.h
//  PetRescue
//
//  Created by Pedro Brandão on 22/02/17.
//  Copyright © 2017 Pedro Brandão. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imagem;
@property (weak, nonatomic) IBOutlet UILabel *entidade;
@property (weak, nonatomic) IBOutlet UILabel *cidade;
@property (weak, nonatomic) IBOutlet UITextView *descricao;

@end
