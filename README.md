# ZiffiApp
Test app for Ziffi

App work flow
1. When app launches for first time it makes REST call and load first page data.

2. When user is about to rach the end of loaded data using scroll, we are getting the new data from server.

3. Images are loaded asynchronously and cached using SDWebImage library

4. I have used third party library JSONModel which is acts as ORM

5.  I am storing loaded data when application resigns active state or when application is getting terminated, this is done inorder to avoid unnecessary database save operations.

6. I am using coredata for data persistance but since there is no requirement for selective data loading i am just dumping the data into database as transformable object.

7. Serialization and De serialization of data loaded from database is done by implementing NSCopying protocol.


8.Talking about architecture:

a. ZiffiSaloonManager is a main heart of project which is singleton object and available in all parts of project.
Responsiblities :
i. Load data from server and parse it using service manager and jsonmodel library
ii. Act as data source for all the views
iii. Tell the datamanger to update data into db whenever required.

b. ViewController : It's our main view controller which has table view and search bar which acts as pure view.
c. ZiffiSaloonDataSource : It's job is to act as datasource for saloon resultstableview and load new data whenever required.Which actually does job of controller

d. DatabaseManager: It is used as storing and retiving data from dB.

e. Utlit Section: It has various categories of UICOLOR and Label

f. Constants file has all the constants

9. I have used ttf fonts instead of images.
