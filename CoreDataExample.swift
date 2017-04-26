

//
//  Get Context
//
//  Function for get the context from the AppDelegate
//
func getContext () -> NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.persistentContainer.viewContext
}


//
//  Store User Info
//
//  Function for create an user item in the User Entity
//  Params email : String
//
func storeUser(email : String){
    
    //Get Context
    let context = getContext()
    
    //Retrieve the entity that we just created
    let entity =  NSEntityDescription.entity(forEntityName: "User", in: context)
    
    //Set the entity values
    let transc = NSManagedObject(entity: entity!, insertInto: context)
    
   
    //Save the object
    do {
        transc.setValue(email, forKey: "email")
        try context.save()
        print("saved!")
    } catch let error as NSError  {
        print("Could not save \(error), \(error.userInfo)")
    } catch {
        
    }
}

//
//  Get User Data
//
//  Function for get all the users in the User Entity
//
func getDataUser(){
    
    // Get Context
    let context = getContext()
    
    // Initialize Fetch Request
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
    
    // Create Entity Description
    let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: context)
    
    // Configure Fetch Request
    fetchRequest.entity = entityDescription
    
    do {
        
        //Fetch the results
        let result = try context.fetch(fetchRequest)
        
        //Print the number of items from the result
        print(result.count)
        
        //Print each user info
        for user in result{
            print((user as AnyObject).email)
        }
    } catch {
        let fetchError = error as NSError
        print(fetchError)
    }
}

