# Machine-Test_1
Machine Test from Aeth Analytica

Image Viewer Application

This is an Application which fetches datas from an api and displays the name and image in a table view upon loggin in.

SIGN UP PAGE :

First of all, if a user is new to this application, they have to sign up to create an account in the Image Viewer Application. There are two fields a user need to fill in order to create an account. The two fields are username and password. These are mandatory and must be filled. If not a validation is used to check whether it is filled or not and a snackbar will get popped up if it is not filled. Also the password must be atleast 5 characters. Also, both password and username are saved in the userdefaults after the user signs up 


LOGIN PAGE :

Secondly, if a user already have an account in the application, they may not need to sign up again. Instead they have a login page, in which they need to give their authentication given during signing up to get directly into their account. Here the username and password is checked. Validation is also applied here, if any of the authentication is not correct, a snackbar message will appear which says the user to give the correct authentication. After giving the correct authentication, the user will be redirected to the home page.

HOME PAGE :

Finally, After logging, the user will be redirected to home page in which the home page displays a collection of images and author name in a table view. The data obtained here is a network call of an api which is done using a pod Alamofire. Kingfisher pod is also used to display the image. A table view cell is used to reuse the given collection of data in a table format. The cell is designed using a table view xib file. If the user presses the logout button the user gets redirected to the login page, where the username text field is prepopulated with the last user logged in. 

External Libraries Used :

Pods such as Alamofire, KingFisher and TTGSnackbar is used in this project

> Alamofire : This pod is used to make network call, that is to get the response and data from the api.

> Kingfisher : This pod is used to display images that is obtained from the response in the application.

> TTGSnackbar : This pod is used to show a alert or error box, if the user gives a wrong authentication or if the validation of a text field doesn't meet.

