/*
 * @(#)RRMech.java	10/01/01
 * @version 1.0
 *
 * Copyright Robotics and Automation Lab, University of California, Irvine. All Rights Reserved.
 *
 * This software is the proprietary information of Robotics and Automation Lab, UCI.
 * Use is subject to license terms.
 *
 */
package client;
import java.lang.Math.*;
import javax.vecmath.*;
import synthetica.mechanism.*;
import synthetica.kinemath.*;
/**
 * Define a Serial RR with a synthesis algorithm which accepts 3 design position and 0 constraints.
 * A Spatial RR linkage is comprised of a base G, a spatial RR chain and an end-effector H.
 * Souce code can be downloaded here <a HREF="RRMech.java">RRMech.java</a>.
 * <p> <a HREF="..\src-html\client\RRMech.html"> HTML Source code</a>
 * @since 1.0
 * @author Hai-Jun Su, Alba Perez, Curtis Collins, J. Michael McCarthy
 * source: Alba Perez's Paper
 */

public class RRMech extends SerialMechanism
{
	//Constructors
	/**
	 * A default constrcutor is a must for implementing a new mechanism.
	 * New a spatial RR linkage with unit length and twist angle 0.0;
	 */
	public RRMech() //Default constructor.
	{
		super("RR"); //RR is the architecture symbol of this synthetica.mechanism.
		double[][] links = {{0.0, 0.0}, {1.0, 0.0}};
		super.setAllLinks( links );
	}
	/**
	 * New a spatial RR linkage with given the G, H, link length, twist angle;
	 * @param G the transform from the base to the first revolute joint.
	 * @param H the transform from the last revolute joint to the end-effector.
	 * @param link_length the link length between the two revolute joints.
	 * @param link_twist the twist angle between the two revolute joints.
	 */
	public RRMech(Matrix4d G, Matrix4d H, double link_length, double link_twist)
	{
		super(G, H, "RR");
		double[][] links = {{0.0, 0.0}, {link_length, link_twist}};
		super.setAllLinks( links );
	}
}



