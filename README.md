# Router Setting

A simple application to make it easier to:

- Save accounts locally: where each router has its own accounts
- Choose one account from the saved account when logging in again
- Reboot any router easily
- Period data pulling of some router data such as signal and battery levels
- Check all the SMS messages
- Check some important config of the router
- As this type of routers accept only one logged in user (authenticated connection), the app will log out immediately when put in background

## Built using

- GetIt and Injectable: for IoC
- Dio, Retrofit: make requests to the router API
- Json Serializable: to serialize the requests and responses of the router API
- Hive: to save accounts
- Url Launcher: just in case you want to open the web page of the router quickly
- CountDown: to periodically pull data from the router
- Shimmer: for some loading screens
- Infinite Scroll Pagination: for SMS messages list
- SharePlus: for sharing the SMS messages
- Slidable: if you want to share an SMS message with others, slide the message to the right!
- and more packages...


### IMPORTANT NOTE

This app only works with a specific type of routers.