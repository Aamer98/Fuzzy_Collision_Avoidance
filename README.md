# Fuzzy_Collision_Avoidance

Matlab Code for Collision Avoidance

Fuzzy logic performs computations by taking into account the impreciseness of communication in the real world. As opposed to Boolean logic, that is 1’s and 0’s, values are taken based on a ‘degree of truth’. lnspired by the biological processes of human congition and perception, fuzzy logic was theorized on the idea of relative graded membership functions membership functions that relate to the extent and degree of belongingness.

# Fuzzy Logic Controller

Fuzzy logic controIIer is a control system based on fuzzy logic or fuzzy sets which analyses analog input values in terms of logical variables that take on continuous values between 0 and 1. Therefore, the vagueness and imprecise nature of the boundaries makes them useful for approximation models.
The conventional controller consists of four steps namely fuzzification, knowledge base, fuzzy reasoning and defuzzification. The first step in the fuzzy controller is to define the input and output variables of the fuzzy controller. Fuzzy logic controllers use a very flexible set of if-then rules and the controller rules are usually formulated in linguistic terms. Thus, the use of linguistic variables and fuzzy sets implies the fuzzification procedure, that is, the mapping of the input variabIes into suitable linguistics values. The final step is defuzzification which converts fuzzy based linguistic terms to scalar output values.

# Methodology

An environment for the navigation of the robot is created in the VREP software for the simulation and performance of the robot in an object filled environment. The robot used for this purpose is Pioneer 3dx, a small lightweight two-wheel two motor differential drive robot ideal for indoor laboratory or classroom use. Further, three ultrasonic sensors are attached at the left, right and front parts of the robot to detect objects.

![vrep](https://user-images.githubusercontent.com/60957986/74592543-d2e90300-503b-11ea-9921-f67a8458c821.PNG)

The various fuzzy stages Iike suitable identification of input and output parameters aIong with linking them to the fuzzy based variables is carried out in the fuzzy logic controller and is implemented in Matlab using the fuzzy logic tooIbox. A Mamdani based controller with three inputs and two outputs is obtained with the inputs being the left, right and the front ultrasonic sensor and the outputs correspond to the velocity of the left and right motor. The membership function and the ranges for the input and output variables were assigned after various trials to get the accurate result. Further the rulebase for the reIation between the input, output and fuzzy variabIes is framed by using fuzzy ruIes and is created in the controller. The matlab file is linked with VREP scene by code and is thus executed and the result is noted.

![fis](https://user-images.githubusercontent.com/60957986/74592570-0035b100-503c-11ea-9b92-35a51c479c97.PNG)


# Result

The created VREP scene with the robot was executed and it is observed that the robot could successfully avoid objects in its vicinity. Thus, the aim was achieved and the collision avoiding robot was simulated on software. This design allows the robot to navigate in an unknown environment by avoiding collisions, which is a primary requirement for any autonomous mobile robot.
