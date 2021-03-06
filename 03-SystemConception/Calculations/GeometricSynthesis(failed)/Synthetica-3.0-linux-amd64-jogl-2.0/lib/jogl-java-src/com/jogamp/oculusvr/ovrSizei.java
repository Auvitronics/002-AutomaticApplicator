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

public class ovrSizei {

  StructAccessor accessor;

  private static final int mdIdx = MachineDataInfoRuntime.getStatic().ordinal();
  private final MachineDataInfo md;

  private static final int[] ovrSizei_size = new int[] { 8 /* ARM_MIPS_32 */, 8 /* X86_32_UNIX */, 8 /* X86_32_MACOS */, 8 /* PPC_32_UNIX */, 8 /* SPARC_32_SUNOS */, 8 /* X86_32_WINDOWS */, 8 /* LP64_UNIX */, 8 /* X86_64_WINDOWS */  };
  private static final int[] w_offset = new int[] { 0 /* ARM_MIPS_32 */, 0 /* X86_32_UNIX */, 0 /* X86_32_MACOS */, 0 /* PPC_32_UNIX */, 0 /* SPARC_32_SUNOS */, 0 /* X86_32_WINDOWS */, 0 /* LP64_UNIX */, 0 /* X86_64_WINDOWS */ };
//private static final int[] w_size = new int[] { 4 /* ARM_MIPS_32 */, 4 /* X86_32_UNIX */, 4 /* X86_32_MACOS */, 4 /* PPC_32_UNIX */, 4 /* SPARC_32_SUNOS */, 4 /* X86_32_WINDOWS */, 4 /* LP64_UNIX */, 4 /* X86_64_WINDOWS */  };
  private static final int[] h_offset = new int[] { 4 /* ARM_MIPS_32 */, 4 /* X86_32_UNIX */, 4 /* X86_32_MACOS */, 4 /* PPC_32_UNIX */, 4 /* SPARC_32_SUNOS */, 4 /* X86_32_WINDOWS */, 4 /* LP64_UNIX */, 4 /* X86_64_WINDOWS */ };
//private static final int[] h_size = new int[] { 4 /* ARM_MIPS_32 */, 4 /* X86_32_UNIX */, 4 /* X86_32_MACOS */, 4 /* PPC_32_UNIX */, 4 /* SPARC_32_SUNOS */, 4 /* X86_32_WINDOWS */, 4 /* LP64_UNIX */, 4 /* X86_64_WINDOWS */  };

  public static int size() {
    return ovrSizei_size[mdIdx];
  }

  public static ovrSizei create() {
    return create(Buffers.newDirectByteBuffer(size()));
  }

  public static ovrSizei create(java.nio.ByteBuffer buf) {
      return new ovrSizei(buf);
  }

  ovrSizei(java.nio.ByteBuffer buf) {
    md = MachineDataInfo.StaticConfig.values()[mdIdx].md;
    accessor = new StructAccessor(buf);
  }

  public java.nio.ByteBuffer getBuffer() {
    return accessor.getBuffer();
  }

  /** Setter for native field <code>w</code>: CType[(IntType) 'int', size [fixed false, lnx64 4], [const[false], int]] */
  public ovrSizei setW(int val) {
    accessor.setIntAt(w_offset[mdIdx], val, md.intSizeInBytes());
    return this;
  }

  /** Getter for native field <code>w</code>: CType[(IntType) 'int', size [fixed false, lnx64 4], [const[false], int]] */
  public int getW() {
    return accessor.getIntAt(w_offset[mdIdx], md.intSizeInBytes());
  }

  /** Setter for native field <code>h</code>: CType[(IntType) 'int', size [fixed false, lnx64 4], [const[false], int]] */
  public ovrSizei setH(int val) {
    accessor.setIntAt(h_offset[mdIdx], val, md.intSizeInBytes());
    return this;
  }

  /** Getter for native field <code>h</code>: CType[(IntType) 'int', size [fixed false, lnx64 4], [const[false], int]] */
  public int getH() {
    return accessor.getIntAt(h_offset[mdIdx], md.intSizeInBytes());
  }
}
