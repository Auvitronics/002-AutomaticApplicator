Synthetica 3.0 for Win32, MacOSX, Linux, Solaris

Introduction
=========================
Synthetica is a Java program that is used to synthesize, analyze and simulate spatial linkages. Its' open architecture allows advanced users to add Java code to the system. Currently it runs on Windows, MacOSX and Linux and Solaris. The 3D graphics i based on JOGL, a java binding of OpenGL library provided by Sun Microsystem and SGI. 


Organization 
=========================
Synthetica
   README.txt                                    (this file)

   Run.bat                                       (execute to launch Synthetica)

   *.dll, *.so, *.jnlib                          (native libraries necessary by JOGL)

   Synthetica3.0.jar                             (platform independent jar file)

   +lib                                          (dependent libraries)
    jogl.jar vecmath.jar VisualNumerics.jar

   +example                                      (synthetica data files)
    *.syn 

   +sample                                       (sample source code for developers)
    compile.bat *.java

   +classes                                      (the sample *.class files will be found here)
  

Instructions for End Users
=========================
1. execute "RunWin32.bat" or "RunLinux" or "RunMacOSX" command file depending on your operation system
2. in Synthetica, you can open the *.syn files that are located in the folder "example"

Or you can use the folloing command to launch Synthetica

java -jar SyntheticaX.Y.jar 

where X.Y is the version number.

Intruction for Developers
=========================
   Please find sample codes in the folder "sample" 
   1. execute compile.bat to compile all *.java into *.class
   2. please find *.class in the folder "classes"
   3. execute 
      java -classpath ".;Synthetica3.0.jar;.\lib\vecmath.jar;.\lib\jogl.jar;.\lib\VisualNumerics.jar" test



Additional Information
======================
Please visit the official website for more information
http://synthetica.eng.uci.edu/~software/
(c) Robotics Lab, UCI, All Rights Reserved.


Contact Information
======================
Dr. Hai-Jun Su
Department of Mechanical Engineering
University of Marland, Baltimore County
1000 Hilltop Circle
Baltimore, Maryland 21250
Tel: 410-455-3314
Fax: 410-455-1052
Email: haijun@umbc.edu
Web: http://www.umbc.edu/engineering/me/vrml/index.html

         
         