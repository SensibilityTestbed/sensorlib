# This file should be located at /data/local/tmp/

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/data/data/com.sensibility_testbed/files/python/lib
export PYTHONPATH=/mnt/sdcard/Android/data/com.sensibility_testbed/files/extras/python:/data/data/com.sensibility_testbed/files/python/lib/python2.7:/data/data/com.sensibility_testbed/files/python/lib/python2.7/lib-dynload
export PYTHONHOME=/data/data/com.sensibility_testbed/files/python
export TEMP=$TEMP:/mnt/sdcard/Android/data/com.sensibility_testbed/files/extras/tmp/
export PATH=$PATH:/data/data/com.sensibility_testbed/files/python/bin

#export AP_PORT=45678
#am start -a com.googlecode.android_scripting.action.LAUNCH_SERVER -n com.googlecode.android_scripting/.activity.ScriptingLayerServiceLauncher --ei com.googlecode.android_scripting.extra.USE_SERVICE_PORT $AP_PORT
