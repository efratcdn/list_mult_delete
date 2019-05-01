   
File name     : e_util_delete_multiple_items.e
Title         : Delete multiple items from a list
Project       : Utilities examples
Created       : 2019
Description   : Delete multiple items in a list in one action
  
  Syntax:
  
     <list>.mult_delete(exp)
   
     Will delete all items that match the expression
  
  
     Examples:
  
         my_list.mult_delete(it < 7);
  
         other_list.mult_delete(it.address > max_address);
  
  
    Running the example:
  
     specman -c 'load delete_items_usage_example.e;test'
   
  
 

<'
define <e_util_mult_delete'action> "<list'exp>.mult_delete\(<exp>\)" as {
    var l<?>: = <list'exp>;
    var index: = 0;
    var last_index<?>: = 0;
    
    while index < l<?>.size() {
        var it: = l<?>[index];
        if not (<exp>) {
            l<?>[last_index<?>]= it;
            last_index<?> += 1;
        };
        index += 1;
    };
    l<?>.resize(last_index<?>, TRUE, 0.unsafe(), TRUE);
};


'>

