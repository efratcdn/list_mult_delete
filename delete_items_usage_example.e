
  Usage exmaple of deleting multiple items from a list

  specman -c 'load delete_items_usage_example.e;test'

<'
import e_util_delete_multiple_items.e;

struct transfer {
    legal : bool;
    data  : byte;
};


unit env_u {
    monitor : monitor_u is instance;
    
    handle_transfers(transfers : list of transfer) is {
        out("I am removing all illegal items");
        transfers.mult_delete(.legal == FALSE);
    };
};

unit monitor_u {
    transfers[12] : list of transfer;
    !another_list : list of transfer;
    
   
    post_generate() is also {
        another_list = transfers;
        print transfers.data;
        print another_list.data;

        // this method will do multiple things to the list, 
        // and one of them is to delete all items that are not legal
        get_enclosing_unit(env_u).handle_transfers(transfers);
        
        print transfers.data;
        print another_list.data;        
    };
};

extend sys {
    env : env_u is instance;
    
    post_generate() is also {
        var num_list : list of int = {1; 8; 2; 7; 3; 6; 4; 5};
        print num_list;
        num_list.mult_delete(it < 4);
        print num_list;
    };
};
'>
