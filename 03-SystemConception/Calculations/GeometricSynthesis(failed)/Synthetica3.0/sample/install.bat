echo on
set mysourcepath="."
set mygoalpath="..\classes"
set myclasspath=".;..\Synthetica2.jar;..\lib\vecmath.jar;..\lib\gl4java.jar;..\lib\VisualNumerics.jar"

javac -classpath %myclasspath% -d %mygoalpath% -sourcepath %mysourcepath% *.java
