vrep=remApi('remoteApi');
vrep.simxFinish(-1);
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);
 
noDetectionDist = 0.9;
maxDetectionDist = 0.1;
 
if (clientID>-1)
    disp('Connection successful')
    [returnCode,left_motor]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_leftMotor',vrep.simx_opmode_blocking);
    [returnCode,right_motor]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_rightMotor',vrep.simx_opmode_blocking);
    
    [returnCode,US_sensor_1]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor1',vrep.simx_opmode_blocking);
    [returnCode,US_sensor_5]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor5',vrep.simx_opmode_blocking);
    [returnCode,US_sensor_8]=vrep.simxGetObjectHandle(clientID,'Pioneer_p3dx_ultrasonicSensor8',vrep.simx_opmode_blocking);
    
   
    [returnCode,detectionState1,detectedPoint1,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_1,vrep.simx_opmode_streaming);
    [returnCode,detectionState2,detectedPoint5,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_5,vrep.simx_opmode_streaming);
    [returnCode,detectionState3,detectedPoint8,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_8,vrep.simx_opmode_streaming);
  
    fis_file=readfis('fuzzy_7.fis');
    
    while(1)
        [returnCode,detectionState1,detectedPoint1,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_1,vrep.simx_opmode_buffer);
        [returnCode,detectionState2,detectedPoint5,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_5,vrep.simx_opmode_buffer);
        [returnCode,detectionState3,detectedPoint8,~,~]=vrep.simxReadProximitySensor(clientID,US_sensor_8,vrep.simx_opmode_buffer);
        
        us1 = double(norm(detectedPoint1)); 
        us5=double(norm(detectedPoint5));
        us8=double(norm(detectedPoint8));
        
        if (us1<0.01)
            us1=noDetectionDist;
        elseif (us1>noDetectionDist)
            us1=noDetectionDist;
        end
        
        if (us5<0.01)
            us5=noDetectionDist;
        elseif (us5>noDetectionDist)
            us5=noDetectionDist;
        end
        
        
        if (us8<0.01)
            us8=noDetectionDist;
        elseif (us8>noDetectionDist)
            us8=noDetectionDist;
            
           
        end
        disp("left")
        disp(us1)
        disp("front")
        disp(us5)
        disp("right")
        disp(us8)
        velocity= evalfis(fis_file,[us1 us5 us8]);
        disp("Velocity")
        disp(velocity)
        
        [returnCode]=vrep.simxSetJointTargetVelocity(clientID,left_motor,velocity(1),vrep.simx_opmode_blocking);
        [returnCode]=vrep.simxSetJointTargetVelocity(clientID,right_motor,velocity(2),vrep.simx_opmode_blocking);    
        
        pause(1)
     
    end
end
    
disp('connection unsuccessful')    
vrep.simxFinish(-1);
vrep.delete();

