/*
 * @(#)Serial_RR_3Pos_0Con.java	10/01/01
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
 * Souce code can be downloaded here <a HREF="Serial_RR_3Pos_0Con.java">Serial_RR_3Pos_0Con.java</a>.
 * <p> <a HREF="..\src-html\client\Serial_RR_3Pos_0Con.html"> HTML Source code</a>
 * @since 1.0
 * @author Hai-Jun Su, Alba Perez, Curtis Collins, J. Michael McCarthy
 * source: Alba Perez's Paper
 */

public class Serial_RR_3Pos_0Con extends SerialMechanism implements InverseKinematics, Synthesizable
{
	//Constructors
	/**
	 * A default constrcutor is a must for implementing a new mechanism.
	 * New a spatial RR linkage with unit length and twist angle 0.0;
	 */
	public Serial_RR_3Pos_0Con() //Default constructor.
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
	public Serial_RR_3Pos_0Con(Matrix4d G, Matrix4d H, double link_length, double link_twist)
	{
		super(G, H, "RR");
		double[][] links = {{0.0, 0.0}, {link_length, link_twist}};
		super.setAllLinks( links );
	}
	/**
	 * Inverse kinematics of the spatial RR open chain. This interface is not necessary to implement.
	 * <p> [T] = [G] [Z(th1)][X(a, alpha)] [Z(th2)] [H]
	 * <p> [D] = [G^-1][T][H^-1] = [Z(th1)][X(a, alpha)] [Z(th2)]. [D] has the following form.
	 * <p> {{c1*c2 - ca*s1*s2, -ca*c2*s1 - c1*s2,  sa*s1, a*c1},
	 * <p>  {s1*c2 - ca*c1*s2,  ca*c1*c2 - s1*s2, -sa*c1, a*s1},
	 * <p>  {           sa*s2,             sa*c2,     ca,    0},
	 * <p>  {               0,                 0,      0,    1}}
	 * @return all inverse solutions.
	 */
	public double[][] inverseK(Matrix4d T)
	{
		//compute [D] = [G^-1][T][H^-1]
		Matrix4d G = new Matrix4d();
		Matrix4d H = new Matrix4d();
		getBaseGripper( G, H );

		Matrix4d invG = new Matrix4d(); invG.invert( G ); //[G]^-1
		Matrix4d invH = new Matrix4d(); invH.invert( H ); //[H]^-1

		Matrix4d D = new Matrix4d(); //[D] = [G^-1][T][H^-1] = [Z(th1)][X(a, alpha)] [Z(th2)]
		D.mul( invG, T );
		D.mul( invH );

		//now compute th1, th2 from [D] = [Z(th1)][X(a, alpha)] [Z(th2)]
		double[][] linkParams = {{0.0, 0.0}, {0.0, 0.0}};
		getAllLinks( linkParams ); //get the link parameters.
		double a     = linkParams[ 1 ][ 0 ];
		double alpha = linkParams[ 1 ][ 1 ];
		double ca = Math.cos( alpha ), sa = Math.sin( alpha );

		double th1, th2;
		th1 = Math.atan2( D.m13/a, D.m03/a );
		if(Math.abs( sa ) > 1e-10 )
		{
			th2 = Math.atan2( D.m20/sa, D.m21/sa );
		}
		else
		{
			th2 = Math.atan2( D.m10, D.m11 ) - th1;
		}
		double[][] th12 = {{th1, th2}};
		return th12;
	}
	/**
	 *@return 3. This algorithm accepts three finite design positions.
	 */
	public int getNumPositions()
	{
		return 3;
	}
	/**
	 *@return 0. No constraints.
	 */
	public int getNumConstraints()
	{
		return 0;
	}
	/**
	 *@return {"Pos1", "Pos2", "Pos3"};
	 */
	public String[] getNamesPositions()
	{
		return new String[] {"Pos1", "Pos2", "Pos3"};
	}
	/**
	 *@return String[0]; No constraints.
	 */
	public String[] getNamesConstraints()
	{
		return new String[0];
	}
	/**
	 *@return "RR".
	 */
	public String getTopology()
	{
		return "RR";
	}
	/**
	 *@return 2. Two solutions will be otained from this algorithm.
	 */
	public int getNumSolutions()
	{
		return 2;
	}
	/**
	 *the synthesize a spatial RR dyad with three finite positions.
	 */
	public Mechanism[] synthesize(DesignTask task)
	{
		if(task.getNumberPositions()>=3)
		{
			Serial_RR_3Pos_0Con[] solutions = new Serial_RR_3Pos_0Con[2];
			Line4d ginitial = new Line4d();
			Line4d winitial = new Line4d();
			Line4d hinitial = new Line4d();
			Line4d uinitial = new Line4d();
			Matrix4d[] poses = task.getAllPositionValues();
			designRR3Pos( poses, ginitial, winitial, hinitial, uinitial );
			solutions[ 0 ] = buildRRdyad( poses, ginitial, winitial );
			solutions[ 1 ] = buildRRdyad( poses, hinitial, uinitial );
			return solutions;
		}
		return null;
	}
	/**
	 *multiple synthesis method test
	public Mechanism[] synthesize2(DesignTask task)
	{
		return synthesize( task );
	}
	*/
	private static void designRR3Pos(Matrix4d[] pos, Line4d ginitial, Line4d winitial, Line4d hinitial, Line4d uinitial)
	{
		int i;

		Matrix3d[] Rotations = new Matrix3d[3];
		Vector3d[] Positions = new Vector3d[3];

		for(i=0; i<3; i++)
		{
			Rotations[ i ] = new Matrix3d();
			Positions[ i ] = new Vector3d();
			pos[ i ].get(Rotations[ i ], Positions[ i ]);
		}

	    Matrix3d rotmat12 = new Matrix3d();
	    rotmat12.mulTransposeRight(Rotations[1], Rotations[0]);  //R12 = R2.R1';

	    Matrix3d rotmat13 = new Matrix3d();
	    rotmat13.mulTransposeRight(Rotations[2], Rotations[0]);  //R13 = R3.R1';

	    Vector3d trans1 = new Vector3d(Positions[0]);
	    Vector3d trans2 = new Vector3d(Positions[1]);
	    Vector3d trans3 = new Vector3d(Positions[2]);

		//trans12 = trans2 - rotmat12*trans1;
		Vector3d trans12 = new Vector3d(trans1);
		rotmat12.transform(trans12);
		trans12.sub(trans2, trans12);


		//trans13 = trans3 - rotmat13*trans1;
		Vector3d trans13 = new Vector3d(trans1);
		rotmat13.transform(trans13);
		trans13.sub(trans3, trans13);

        Line4d usc12 = new Line4d();
	    Line4d usc13 = new Line4d();

	    //set the screw axis of the displaecment to usc12 and usc13.
	    //And the magnitude of a screw displacement is (rotation angle, translation)
	    DualNumber2d mag12 = usc12.setScrewAxis(rotmat12, trans12);
	    DualNumber2d mag13 = usc13.setScrewAxis(rotmat13, trans13);

		DualNumber2d delta_d = Line4d.dualAngle(usc12, usc13, false); //Real part is "delta", Image part is "d". d is not forced positive.


    	//calculating z0 and sigma
    	double p12 = mag12.y / (2.0 * Math.tan(mag12.x/2.0) );
    	double p13 = mag13.y / (2.0 * Math.tan(mag13.x/2.0) );

    	double sindelta = Math.sin(delta_d.x);
    	double cosdelta = Math.cos(delta_d.x);
    	double z0 = (0.5)*(delta_d.y - (p13 - p12)*cosdelta/sindelta);

    	double sigma = (0.5)*Math.atan2(delta_d.y*sindelta - (p13 - p12)*cosdelta,  (p13 - p12)*sindelta + delta_d.y*cosdelta);

	    double delta1 = -sigma, delta2 = delta_d.x - sigma;
	    double Ks, Kd, K12, K13;
	    double t12 = mag12.y, t13 = mag13.y;
	    Ks = (t12*Math.cos(delta2) - t13*Math.cos(delta1)) / (2.0*Math.sin(delta1-delta2));
	    Kd = (t13*Math.sin(delta1) - t12*Math.sin(delta2)) / (2.0*Math.sin(delta1-delta2));

		double tmp = Math.sin(delta1)*Math.sin(delta1) - Math.sin(delta2)*Math.sin(delta2);
		double TAN12 = Math.tan(mag12.x/2.0), TAN13 = Math.tan(mag13.x/2.0);
	    K12 = (t12/2.0)/TAN12/tmp;
	    K13 = (t13/2.0)/TAN13/tmp;

	    //calculate C0, C1, C2, C3
	    double C0, C1, C2, C3;
	    C0 = Ks*Ks;
	    C1 = 2.0*Ks*Ks - Kd*Kd - 4.0*(K12 - K13)*(K13*Math.cos(delta1)*Math.cos(delta1) - K12*Math.cos(delta2)*Math.cos(delta2));
	    C2 = Ks*Ks - 2.0*Kd*Kd + 4.0*(K12 - K13)*(K13*Math.sin(delta1)*Math.sin(delta1) - K12*Math.sin(delta2)*Math.sin(delta2));
		C3 = -Kd*Kd;

		double zsol=0.0, kappa=0.0;
		//Solve the equation: C3*z^3 + C2*z^2 + C1*z + C0 = 0;
		try {
			double[] coef = new double[4];
			coef[0] = C3;
			coef[1] = C2;
			coef[2] = C1;
			coef[3] = C0;
			Polynomial poly = new Polynomial(coef);

			Complex[] zeros = poly.zeros();
			for (i=0; i < zeros.length; ++i) {
				if(Math.abs(zeros[i].im()) < 0.000001 && zeros[i].re() > 0.0) //Return the only positive real root.
				{
				zsol = zeros[i].re();
				break;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();	}


		kappa = 2.0*Math.atan( Math.sqrt(zsol) );
		double sin_kappa_2 = Math.sin(kappa/2.0), cos_kappa_2 = Math.cos(kappa/2.0);

		//Calculate a, b, c;
		double a, b, c, tmp1, tmp2;
		tmp1 = Ks/(2.0*sin_kappa_2); tmp2 = Kd/(2.0*cos_kappa_2);
		a = tmp1 + tmp2;
		b = tmp1 - tmp2;
		c = (K13 - K12)*Math.sin(kappa);

		//G  W, written in the Bennett linkage coordinate frame.
		Vector3d G_Re = new Vector3d(2.0*b*c*sin_kappa_2,
								 2.0*b*c*cos_kappa_2,
								 4.0*a*b*cos_kappa_2*sin_kappa_2);

		Vector3d G_Im = new Vector3d(b*cos_kappa_2*(4.0*a*a*sin_kappa_2*sin_kappa_2 + c*c),
								-b*sin_kappa_2*(4.0*a*a*cos_kappa_2*cos_kappa_2 + c*c),
							         2.0*a*b*c*(cos_kappa_2*cos_kappa_2 - sin_kappa_2*sin_kappa_2));
		tmp1 = 1.0/G_Re.length();
		G_Re.scale(tmp1); G_Im.scale(tmp1);

		Vector3d W_Re = new Vector3d(-2.0*a*c*sin_kappa_2,
								   2.0*a*c*cos_kappa_2,
								   4.0*a*b*cos_kappa_2*sin_kappa_2);

		Vector3d W_Im = new Vector3d(-a*cos_kappa_2*(4.0*b*b*sin_kappa_2*sin_kappa_2 + c*c),
								  -a*sin_kappa_2*(4.0*b*b*cos_kappa_2*cos_kappa_2 + c*c),
							           2.0*a*b*c*(cos_kappa_2*cos_kappa_2 - sin_kappa_2*sin_kappa_2));
		tmp1 = 1.0/W_Re.length();
		W_Re.scale(tmp1); W_Im.scale(tmp1);

		//H U, written in the Bennett linkage coordinate frame.
		Vector3d H_Re = new Vector3d(  W_Re.x, W_Re.y, -W_Re.z );
		Vector3d H_Im = new Vector3d(  W_Im.x, W_Im.y, -W_Im.z );
		tmp1 = 1.0/H_Re.length();
		H_Re.scale(tmp1); H_Im.scale(tmp1);

		Vector3d U_Re = new Vector3d(  G_Re.x, G_Re.y, -G_Re.z );
		Vector3d U_Im = new Vector3d(  G_Im.x, G_Im.y, -G_Im.z );
		tmp1 = 1.0/U_Re.length();
		U_Re.scale(tmp1); U_Im.scale(tmp1);

		// Coordinate Transformation to the Base Frame. And set it dispBP.
		Matrix4d dispBP = new Matrix4d ();
		{
			//Construct the coordinate lines
			Line4d XAxis = new Line4d(usc12);
			Line4d ZAxis = new Line4d(), YAxis = new Line4d();

			ZAxis.dualCross(usc12, usc13);  ZAxis.normalize(); //Z axis is along the common normal of usc12 and usc13.
			YAxis.dualCross(ZAxis, XAxis);  YAxis.normalize(); //Y axis is the dual cross product of Z, X

			//Assemble the rotation matrix Amat and the dual part DAmat
			Matrix3d Amat = new Matrix3d();

		    Amat.setRow(0, XAxis.w);
		    Amat.setRow(1, YAxis.w);
		    Amat.setRow(2, ZAxis.w);

		    Matrix3d Dmat = new Matrix3d();
		    Matrix3d Dmat2 = new Matrix3d();
		    Dmat.setColumn(0, ZAxis.v);
		    Dmat.setColumn(1, XAxis.v);
		    	Vector3d tempvec = new Vector3d();
		    	tempvec.negate(XAxis.v);
		    	Dmat.setColumn(2, tempvec);
		    Dmat2.mul(Amat,Dmat);

		    Vector3d transBI= new
				Vector3d(Dmat2.getElement(1,0),Dmat2.getElement(2,1),Dmat2.getElement(1,2));

		    Amat.transpose(); //A = A'

		    GVector transBI2=new GVector(transBI);
		    GMatrix Abis=new GMatrix(3,3);
		    //Abis.set(-Amat);
		    	GMatrix tempmat = new GMatrix(3,3);
		    	tempmat.set(Amat);
		    	tempmat.negate();
		    	Abis.set(tempmat);
		    transBI2.mul(Abis,transBI2);

		    //Assemble the 4x4 displacement matrix
		    Matrix4d dispBI = new Matrix4d();
		    dispBI.setIdentity();
		    dispBI.setRotation(Amat);

		    dispBI.setElement(0,3, transBI2.getElement(0));
		    dispBI.setElement(1,3, transBI2.getElement(1));
		    dispBI.setElement(2,3, transBI2.getElement(2));

			Matrix4d dispIP = new Matrix4d (Math.cos(sigma), Math.sin(-sigma), 0, 0, Math.sin(sigma), Math.cos(sigma), 0, 0, 0, 0, 1, z0, 0, 0, 0, 1);
			dispBP.mul(dispBI, dispIP);
		}

		{	//Evaluate ginitial, winitial, hinitial, uinitial in the Base Frame.
			ginitial.set(G_Re,G_Im);
			ginitial.transform(dispBP);

			winitial.set(W_Re,W_Im);
			winitial.transform(dispBP);

			hinitial.set(H_Re,H_Im);
			hinitial.transform(dispBP);

			uinitial.set(U_Re,U_Im);
			uinitial.transform(dispBP);
		}
	}
	private static Serial_RR_3Pos_0Con buildRRdyad(Matrix4d[] pos, Line4d G, Line4d W)
	{

		Line4d sG = new Line4d(), sW = new Line4d();
		sG.normalize(G);
		sW.normalize(W);

		//Matrix [G] from the base frame to the fixed axis: the origin of theta is in the common normal line.

		//Compute common normal to G, W1 and intersection points
		Line4d norGW = new Line4d();
		GScrew6d normalPoints = norGW.commonNormal( sG, sW );
		Vector3d yaxis = new Vector3d();
		yaxis.cross(sG.w, norGW.w);

	    Matrix3d rotG = new Matrix3d();
	    rotG.setColumn(0, norGW.w); //x axis
	    rotG.setColumn(1, yaxis);   //y axis
	    rotG.setColumn(2, sG.w);    //z axis

         //Assemble the 4x4 displacement matrix
        Matrix4d transG = new Matrix4d();
        transG.setIdentity();
        transG.setRotation(rotG);
		transG.setTranslation( normalPoints.w );


		//Create kinematics equations with a, alpha, theta1, theta2.
		//Find a, alpha.
		DualNumber2d alphaa = new DualNumber2d(sG.dualAngle(sW));

		//construct kinematics homogeneous transforms. rotZ is same for both joints, angle zero.
		Matrix4d KE1 = new Matrix4d(); //KE1= Z[0,0]X[alpha,a][Z[0,0]
		{
			Matrix4d m1 = new Matrix4d();
			KE1.rotX(alphaa.x); //X[alpha,0]
			m1.set(1, new Vector3d(alphaa.y, 0, 0)); //X[0,a]
			KE1.mul(m1);
		}

		//find [H]=([G][Keqs])^-1.[M1]
		Matrix4d transH = new Matrix4d();
		transH.mul(transG,KE1);
		transH.invert();
		transH.mul(pos[ 0 ]);

		//check the whole thing: [M1]=[G][Keqs][H]
		Matrix4d position1 = new Matrix4d();
		position1.mul(transG,KE1);
		position1.mul(transH);

		Serial_RR_3Pos_0Con solution = new Serial_RR_3Pos_0Con(transG, transH, alphaa.y, alphaa.x);
		return solution;
	}

/*	public static void main(String args[]) {

		Matrix4d G = new Matrix4d(); G.rotZ( PI/7 ); G.setTranslation( new Vector3d(0.3, 0.2, 0.3) );
		Matrix4d H = new Matrix4d(); H.rotY( PI/9 ); H.setTranslation( new Vector3d(-0.43, 0.25, 0.66) );
		Serial_RR_3Pos_0Con testRR = new Serial_RR_3Pos_0Con(G, H, 1.0, PI/5 );
		testRR.setJointValues(PI/5, PI/2);

		Matrix4d T = new Matrix4d();
		testRR.forwardK( T );
		testRR.setJointValues(0.1 , 1.0);

		System.out.println( testRR.toString() );
		boolean check = testRR.gotoMatrix( T );
		System.out.println( testRR.toString() );
		System.out.println( T.toString() );
		int i;
		double degToRad = Math.PI/180.0;
		Matrix4d[] pos123 = new Matrix4d[3];
		double[][] posAngles = {{0, 0, 0, 0, 0, 0}, {0, 0, 40, 0, 0, 0.8}, {18.8298, -28.0243, 67.2041, 1.1138, 0.65798, 0.049769}};

		for(i=0; i<3; i++)
		{
			SquareMatrix4d homeMtx = new SquareMatrix4d();
			homeMtx.set_YxZ_XYZ( posAngles[i][0]*degToRad, posAngles[i][1]*degToRad, posAngles[i][2]*degToRad, posAngles[i][3], posAngles[i][4], posAngles[i][5] );
			pos123[i] = homeMtx;
			System.out.println(pos123[i].toString());
		}
		DesignTask testTask = new DesignTask(pos123);
		Serial_RR_3Pos_0Con aSerialRR = new Serial_RR_3Pos_0Con();
		Mechanism[] solutions = aSerialRR.synthesize( testTask );
		for(i=0; i<solutions.length; i++)
		{
			System.out.println(solutions[i].toString());
			System.out.println( ((Serial_RR_3Pos_0Con)(solutions[i])).gotoMatrix(pos123[1]));
			System.out.println( ((Serial_RR_3Pos_0Con)(solutions[i])).gotoMatrix(pos123[2]));
		}

	}*/

}



