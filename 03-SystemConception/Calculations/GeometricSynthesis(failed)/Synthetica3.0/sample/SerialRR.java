package client;

import java.lang.Math.*;
import javax.vecmath.*;
import synthetica.mechanism.*;
import synthetica.kinemath.*;

public class SerialRR
    extends SerialMechanism
    implements JointVarChangeEventListener {
  public SerialRR() { //Default constructor.
    super("RR"); //RR is the architecture symbol of this synthetica.mechanism.
    double[][] links = {{0.0, 0.0}, {1.0, 0.0}};
    super.setAllLinks(links);
    for (int i = 0; i < getDOF(); i++) {
      JointVar aJointVar = getChainRef().getJointVarRefWithInternal(i);
      aJointVar.addJointVarChangeEventListener(this);
    }
  }

  public void jointVarChange(JointVarChangeEvent evt) {
    JointVar thisJointVar = (JointVar) (evt.getSource());
    for (int i = 0; i < getDOF(); i++) {
      JointVar aJointVar = getChainRef().getJointVarRefWithInternal(i);
      if (aJointVar == thisJointVar) {
        printMessage("C" + (i + 1) + " = " + thisJointVar.getValue() + "\n");
      }
    }
  }
}