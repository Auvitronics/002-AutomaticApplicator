/*
 * @(#)test.java	03/25/2005
 * @version 2.0
 *
 * Copyright Robotics and Automation Lab, University of California, Irvine. All Rights Reserved.
 *
 * This software is the proprietary information of Robotics and Automation Lab, UCI.
 * Use is subject to license terms.
 *
 * Usage notes:
 * 1. copy this file to Synthetica directory
 * 2. compile test.java with Synthetica. You should get test.class
 *    javac -classpath ".;Synthetica2.jar;.\lib\vecmath.jar;.\lib\gl4java.jar;.\lib\VisualNumerics.jar" test.java
 * 3. execute the test program with Synthetica
 *    java -classpath ".;Synthetica2.jar;.\lib\vecmath.jar;.\lib\gl4java.jar;.\lib\VisualNumerics.jar" test
 *
 *  @since 2.0
 *  @author Hai-Jun Su(haijunsu@iastate.edu)
 */

import synthetica.mechanism.*;
public class test
{
	public static void main(String args[])
	{
		System.out.println("Hello from Main");
		SerialMechanism anRR = new SerialMechanism("RR"); //where RR is the
		System.out.println(anRR.toString());
	}
}
