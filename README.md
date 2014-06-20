sensorlib
=========

To use the sensor code:

1. import necessary library:

  dy_import_module_symbols("sensorlib")

2. get a connection to communicate with sensors
  
  port = get_connectionport()
  
  sensor_socket = getconnection(port)

3. use the above socket to get sensor values:

  request_data(sensor_socket, 'startSensingTimed', [1, 30])
  
  request_data(sensor_socket, 'stopSensing', [])

4. upload your code

  albert@%1 !> upload dylink.repy
  
  albert@%1 !> upload sensorlib.repy 
  
  albert@%1 !> upload sensortest.r2py
  
  albert@%1 !> show files
  
  Files on '131.130.125.5:1224:v1': 'dylink.repy sensorlib.repy sensortest.r2py'
  
  albert@%1 !>

5. run your code

   albert@%1 !> startv2 dylink.repy sensortest.r2py 
   
   albert@%1 !> startv2 dylink.repy sensortest.r2py BatteryFacade batteryGetLevel
