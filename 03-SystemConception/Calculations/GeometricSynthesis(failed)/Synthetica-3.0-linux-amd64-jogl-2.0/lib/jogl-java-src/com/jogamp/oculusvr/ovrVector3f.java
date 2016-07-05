/* !---- DO NOT EDIT: This file autogenerated by com/jogamp/gluegen/JavaEmitter.java on Thu Oct 15 14:48:26 CEST 2015 ----! */


package com.jogamp.oculusvr;

import java.nio.*;

import com.jogamp.gluegen.runtime.*;
import com.jogamp.common.os.*;
import com.jogamp.common.nio.*;
import jogamp.common.os.MachineDataInfoRuntime;

import com.jogamp.oculusvr.*;
import java.security.AccessController;
import java.security.PrivilegedAction;

public class ovrVector3f {

  StructAccessor accessor;

  private static final int mdIdx = MachineDataInfoRuntime.getStatic().ordinal();
  private final MachineDataInfo md;

  private static final int[] ovrVector3f_size = new int[] { 12 /* ARM_MIPS_32 */, 12 /* X86_32_UNIX */, 12 /* X86_32_MACOS */, 12 /* PPC_32_UNIX */, 12 /* SPARC_32_SUNOS */, 12 /* X86_32_WINDOWS */, 12 /* LP64_UNIX */, 12 /* X86_64_WINDOWS */  };
  private static final int[] x_offset = new int[] { 0 /* ARM_MIPS_32 */, 0 /* X86_32_UNIX */, 0 /* X86_32_MACOS */, 0 /* PPC_32_UNIX */, 0 /* SPARC_32_SUNOS */, 0 /* X86_32_WINDOWS */, 0 /* LP64_UNIX */, 0 /* X86_64_WINDOWS */ };
//private static final int[] x_size = new int[] { 4 /* ARM_MIPS_32 */, 4 /* X86_32_UNIX */, 4 /* X86_32_MACOS */, 4 /* PPC_32_UNIX */, 4 /* SPARC_32_SUNOS */, 4 /* X86_32_WINDOWS */, 4 /* LP64_UNIX */, 4 /* X86_64_WINDOWS */  };
  private static final int[] y_offset = new int[] { 4 /* ARM_MIPS_32 */, 4 /* X86_32_UNIX */, 4 /* X86_32_MACOS */, 4 /* PPC_32_UNIX */, 4 /* SPARC_32_SUNOS */, 4 /* X86_32_WINDOWS */, 4 /* LP64_UNIX */, 4 /* X86_64_WINDOWS */ };
//private static final int[] y_size = new int[] { 4 /* ARM_MIPS_32 */, 4 /* X86_32_UNIX */, 4 /* X86_32_MACOS */, 4 /* PPC_32_UNIX */, 4 /* SPARC_32_SUNOS */, 4 /* X86_32_WINDOWS */, 4 /* LP64_UNIX */, 4 /* X86_64_WINDOWS */  };
  private static final int[] z_offset = new int[] { 8 /* ARM_MIPS_32 */, 8 /* X86_32_UNIX */, 8 /* X86_32_MACOS */, 8 /* PPC_32_UNIX */, 8 /* SPARC_32_SUNOS */, 8 /* X86_32_WINDOWS */, 8 /* LP64_UNIX */, 8 /* X86_64_WINDOWS */ };
//private static final int[] z_size = new int[] { 4 /* ARM_MIPS_32 */, 4 /* X86_32_UNIX */, 4 /* X86_32_MACOS */, 4 /* PPC_32_UNIX */, 4 /* SPARC_32_SUNOS */, 4 /* X86_32_WINDOWS */, 4 /* LP64_UNIX */, 4 /* X86_64_WINDOWS */  };

  public static int size() {
    return ovrVector3f_size[mdIdx];
  }

  public static ovrVector3f create() {
    return create(Buffers.newDirectByteBuffer(size()));
  }

  public static ovrVector3f create(java.nio.ByteBuffer buf) {
      return new ovrVector3f(buf);
  }

  ovrVector3f(java.nio.ByteBuffer buf) {
    md = MachineDataInfo.StaticConfig.values()[mdIdx].md;
    accessor = new StructAccessor(buf);
  }

  public java.nio.ByteBuffer getBuffer() {
    return accessor.getBuffer();
  }

  /** Setter for native field <code>x</code>: CType[(FloatType) 'float', size [fixed true, lnx64 4], [const[false], float]] */
  public ovrVector3f setX(float val) {
    accessor.setFloatAt(x_offset[mdIdx], val);
    return this;
  }

  /** Getter for native field <code>x</code>: CType[(FloatType) 'float', size [fixed true, lnx64 4], [const[false], float]] */
  public float getX() {
    return accessor.getFloatAt(x_offset[mdIdx]);
  }

  /** Setter for native field <code>y</code>: CType[(FloatType) 'float', size [fixed true, lnx64 4], [const[false], float]] */
  public ovrVector3f setY(float val) {
    accessor.setFloatAt(y_offset[mdIdx], val);
    return this;
  }

  /** Getter for native field <code>y</code>: CType[(FloatType) 'float', size [fixed true, lnx64 4], [const[false], float]] */
  public float getY() {
    return accessor.getFloatAt(y_offset[mdIdx]);
  }

  /** Setter for native field <code>z</code>: CType[(FloatType) 'float', size [fixed true, lnx64 4], [const[false], float]] */
  public ovrVector3f setZ(float val) {
    accessor.setFloatAt(z_offset[mdIdx], val);
    return this;
  }

  /** Getter for native field <code>z</code>: CType[(FloatType) 'float', size [fixed true, lnx64 4], [const[false], float]] */
  public float getZ() {
    return accessor.getFloatAt(z_offset[mdIdx]);
  }
}