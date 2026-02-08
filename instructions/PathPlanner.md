How to: Install and Set Up PathPlanner (Beginner → Advanced)
============================================================

Purpose
-------

Set up **PathPlanner** so your robot can run reliable autonomous routines using real path following, correct odometry resets, rotation control, and event markers. This guide takes you from first install to advanced autonomous behavior.

Prerequisites
-------------

Before starting, you should have:

*   WPILib installed and working
    
*   A robot project that drives correctly in teleop
    
*   A functional swerve drive with:
    
    *   Working gyro (field-relative works correctly)
        
    *   Module encoders zeroed correctly
        
    *   Odometry or pose estimation working
        
*   Basic Java knowledge (constants, methods, lambdas)
    

⚠️ If teleop swerve isn’t stable, stop and fix it first.

Steps
-----

### 1\. Install PathPlanner GUI (Beginner)

1.  Download the PathPlanner desktop application for your OS
    
2.  Install and launch it
    
3.  Confirm the GUI opens successfully
    

This GUI is where you draw autos visually.

### 2\. Add PathPlannerLib to your robot code (Beginner)

1.  Open your robot project in WPILib VS Code
    
2.  Open the command palette (Ctrl + Shift + P)
    
3.  Select **Manage Vendor Libraries**
    
4.  Choose **Install new libraries (online)**
    
5.  Search for and install **PathPlannerLib**
    
6.  Build the project to confirm it compiles
    

This adds the trajectory and auto tools to your codebase.

### 3\. Verify your swerve code is PathPlanner-ready (Beginner → Intermediate)

Before touching autos, confirm these **5 things** exist in your swerve subsystem:

*   SwerveDriveKinematics
    
*   SwerveDriveOdometry or a pose estimator
    
*   A method that accepts ChassisSpeeds
    
*   Gyro heading works correctly (field-relative)
    
*   Module encoders are zeroed correctly
    

If you cannot answer **yes** to all five, stop here and fix swerve first.

### 4\. Define robot constants (CRITICAL) (Intermediate)

PathPlanner uses real physics values. Create constants like:

*   MAX\_LINEAR\_SPEED — real maximum drive speed in meters per second
    
*   MAX\_ANGULAR\_SPEED — real maximum rotation speed in radians per second
    

Guidelines:

*   Use **measured** values, not theoretical specs
    
*   Overestimating these causes unstable tracking and failed paths
    

### 5\. Configure AutoBuilder (core PathPlanner hook) (Intermediate)

This is the **single most important setup step**.

You must configure AutoBuilder to:

*   Supply the robot’s current pose
    
*   Reset odometry to a given pose
    
*   Provide robot-relative chassis speeds
    
*   Accept chassis speed commands
    
*   Define PID behavior for translation and rotation
    
*   Enable alliance mirroring
    

What this accomplishes:

*   Tells PathPlanner where the robot is
    
*   Tells it how to command your swerve drive
    
*   Controls how aggressively the robot follows paths
    

Start with **P-only PID values**. Tune later.

### 6\. Create your first path in the GUI (Intermediate)

1.  Open the PathPlanner GUI
    
2.  Select the current FRC field
    
3.  Enter accurate robot dimensions
    

Draw a simple test path:

*   Straight line
    
*   No rotation changes
    
*   No event markers
    

Name the path clearly:

*   TestStraight
    

Save the path.

### 7\. Load the path in code (Intermediate)

1.  Load the path using AutoBuilder
    
2.  Add the resulting command to a SendableChooser
    
3.  Display the chooser on Shuffleboard
    
4.  Deploy the code to the robot
    

This allows you to select the auto at runtime.

### 8\. First test (do this safely) (Intermediate)

Test checklist:

*   Robot on carpet
    
*   Wheels straight
    
*   Plenty of open space
    

Expected behavior:

*   Odometry resets automatically
    
*   Robot drives the path smoothly
    
*   Robot ends facing the correct direction
    

If the robot spins:

*   Gyro may be inverted
    
*   Rotation PID may be too aggressive
    
*   Field-relative math may be incorrect
    

### 9\. Rotation control (common struggle) (Advanced)

PathPlanner controls **translation and rotation separately**.

In the GUI:

*   Each waypoint has a heading arrow
    
*   The arrow defines robot facing direction
    

Rules:

*   If heading arrows fight your gyro → spinning
    
*   If headings jump suddenly → rotation jerk
    

Recommended approach:

*   Use a constant heading for the entire path
    
*   Add gradual rotations later
    
*   Avoid sudden heading changes between waypoints
    

### 10\. Event Markers (actions during autos) (Advanced)

Event markers allow mechanisms to run during autonomous motion.

Steps:

1.  Add Event Markers in the PathPlanner GUI
    
2.  Name them clearly (e.g. Shoot, Intake, RaiseArm)
    
3.  Map marker names to commands in code
    
4.  Build autos that include those events
    

Result:

*   Motion and mechanisms execute in sync
    
*   Complex autos become predictable and repeatable
    

Tips
----

*   Start with straight paths before anything complex
    
*   Always use real-world speed limits
    
*   Keep rotation simple until translation is stable
    
*   Test autos incrementally
    
*   Calm, methodical testing beats rushed tuning
    

Common pitfalls:

*   Forgetting alliance mirroring
    
*   Not resetting gyro before auto
    
*   Jumping straight to multi-piece autos
    
*   Blaming PathPlanner instead of bad odometry or swerve math
    

Troubleshooting
---------------

**Problem:** Robot spins uncontrollably**Solution:** Check gyro direction, waypoint headings, and reduce rotation PID

**Problem:** Robot starts offset from the path**Solution:** Verify starting pose, gyro zero, and module offsets

**Problem:** Robot lags behind the path**Solution:** Increase translation P slightly and verify max speed constants

**Problem:** Robot oscillates or hunts around the path**Solution:** Reduce translation P and confirm odometry accuracy
