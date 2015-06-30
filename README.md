This is a sensor library for the Sensibility Testbed https://sensibilitytestbed.com/
=========

To use the sensors on the Sensibility Testbed is straight forward. You will need the following files: dylink.r2py, encasementlib.r2py, getsensor.r2py, sensor_layer.r2py, sensorlib.r2py, unicode_scrubber.r2py, wrapper.r2py, and your test file. 

1. Write your sensor code.

   Using location as an example. Since location depends on external services (GPS, WiFi or cellular networks), we highly recommend that you include some error handling in your code, such as
   
`MAX_TIME = 5
starttime = getruntime()

while(getruntime() - starttime < MAX_TIME):
  try:
    location = get_location()
    if location:
      break
  except Exception: 
    sleep(0.02)`
   
   The call `get_location()` returns real-time location data from the device. However, when this call cannot get any location data from those external services (`location == None`), we can try to get the previously cached location on the device:
   
`if not location:
  try:
    location = get_lastknown_location()
  except Exception: # Not able to use LocationNotFoundException here
    log("can't locate using get_lastknown_location().. exit!\n")
    exitall()`   

   The coordinates of the device can then be extracted from the data returned:
   
`latitude = location["latitude"]
longitude = location["longitude"]`
      
   Location sensor is more complex to handle than other sensors. A less complex one is the accelerometer. Using accelerometer as another (less complex) example, we first need to start sensing on your phone by calling
   
   `start_sensing(sensor_number, delay_time)`
   
   Such that your phone will start recording sensor data. sensor_number is any of the following integer: 1 = All, 2 = Accelerometer, 3 = Magnetometer and 4 = Light; delay_time: minimum time between readings in ms, also in integer. Then call
   
   `get_acceleration()`
   
   This will return the most recently received accelerometer value in a list, e.g., [0.3830723, -0.8036005, 10.036493] as the acceleration on the X, Y, and Z axis. To stop recording sensor data, call
   
   `stop_sensing()`
   
   Save your sensor code as accelerometer.r2py.

2. upload your code to a remote phone.

  albert@%1 !> upload dylink.repy
  
  albert@%1 !> upload sensorlib.repy 
  
  albert@%1 !> upload encasementlib.r2py
  
  ......
  
  albert@%1 !> show files
  
  Files on '131.130.125.5:1224:v1': 'accelerometer.r2py dylink.r2py encasementlib.r2py getsensor.r2py sensor_layer.r2py sensorlib.r2py unicode_scrubber.r2py wrapper.r2py'
  
3. run your code

   albert@%1 !> start dylink.r2py encasementlib.r2py sensor_layer.r2py [any blur layers] accelerometer.r2py
   
4. How to write your blur layers?

