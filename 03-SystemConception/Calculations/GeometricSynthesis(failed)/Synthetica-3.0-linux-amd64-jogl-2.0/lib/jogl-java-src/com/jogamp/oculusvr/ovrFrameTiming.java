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

public class ovrFrameTiming {

  StructAccessor accessor;

  private static final int mdIdx = MachineDataInfoRuntime.getStatic().ordinal();
  private final MachineDataInfo md;

  private static final int[] ovrFrameTiming_size = new int[] { 56 /* ARM_MIPS_32 */, 56 /* X86_32_UNIX */, 56 /* X86_32_MACOS */, 56 /* PPC_32_UNIX */, 56 /* SPARC_32_SUNOS */, 56 /* X86_32_WINDOWS */, 56 /* LP64_UNIX */, 56 /* X86_64_WINDOWS */  };
  private static final int[] DeltaSeconds_offset = new int[] { 0 /* ARM_MIPS_32 */, 0 /* X86_32_UNIX */, 0 /* X86_32_MACOS */, 0 /* PPC_32_UNIX */, 0 /* SPARC_32_SUNOS */, 0 /* X86_32_WINDOWS */, 0 /* LP64_UNIX */, 0 /* X86_64_WINDOWS */ };
//private static final int[] DeltaSeconds_size = new int[] { 4 /* ARM_MIPS_32 */, 4 /* X86_32_UNIX */, 4 /* X86_32_MACOS */, 4 /* PPC_32_UNIX */, 4 /* SPARC_32_SUNOS */, 4 /* X86_32_WINDOWS */, 4 /* LP64_UNIX */, 4 /* X86_64_WINDOWS */  };
  private static final int[] Pad_offset = new int[] { 4 /* ARM_MIPS_32 */, 4 /* X86_32_UNIX */, 4 /* X86_32_MACOS */, 4 /* PPC_32_UNIX */, 4 /* SPARC_32_SUNOS */, 4 /* X86_32_WINDOWS */, 4 /* LP64_UNIX */, 4 /* X86_64_WINDOWS */ };
//private static final int[] Pad_size = new int[] { 4 /* ARM_MIPS_32 */, 4 /* X86_32_UNIX */, 4 /* X86_32_MACOS */, 4 /* PPC_32_UNIX */, 4 /* SPARC_32_SUNOS */, 4 /* X86_32_WINDOWS */, 4 /* LP64_UNIX */, 4 /* X86_64_WINDOWS */  };
  private static final int[] ThisFrameSeconds_offset = new int[] { 8 /* ARM_MIPS_32 */, 8 /* X86_32_UNIX */, 8 /* X86_32_MACOS */, 8 /* PPC_32_UNIX */, 8 /* SPARC_32_SUNOS */, 8 /* X86_32_WINDOWS */, 8 /* LP64_UNIX */, 8 /* X86_64_WINDOWS */ };
//private static final int[] ThisFrameSeconds_size = new int[] { 8 /* ARM_MIPS_32 */, 8 /* X86_32_UNIX */, 8 /* X86_32_MACOS */, 8 /* PPC_32_UNIX */, 8 /* SPARC_32_SUNOS */, 8 /* X86_32_WINDOWS */, 8 /* LP64_UNIX */, 8 /* X86_64_WINDOWS */  };
  private static final int[] TimewarpPointSeconds_offset = new int[] { 16 /* ARM_MIPS_32 */, 16 /* X86_32_UNIX */, 16 /* X86_32_MACOS */, 16 /* PPC_32_UNIX */, 16 /* SPARC_32_SUNOS */, 16 /* X86_32_WINDOWS */, 16 /* LP64_UNIX */, 16 /* X86_64_WINDOWS */ };
//private static final int[] TimewarpPointSeconds_size = new int[] { 8 /* ARM_MIPS_32 */, 8 /* X86_32_UNIX */, 8 /* X86_32_MACOS */, 8 /* PPC_32_UNIX */, 8 /* SPARC_32_SUNOS */, 8 /* X86_32_WINDOWS */, 8 /* LP64_UNIX */, 8 /* X86_64_WINDOWS */  };
  private static final int[] NextFrameSeconds_offset = new int[] { 24 /* ARM_MIPS_32 */, 24 /* X86_32_UNIX */, 24 /* X86_32_MACOS */, 24 /* PPC_32_UNIX */, 24 /* SPARC_32_SUNOS */, 24 /* X86_32_WINDOWS */, 24 /* LP64_UNIX */, 24 /* X86_64_WINDOWS */ };
//private static final int[] NextFrameSeconds_size = new int[] { 8 /* ARM_MIPS_32 */, 8 /* X86_32_UNIX */, 8 /* X86_32_MACOS */, 8 /* PPC_32_UNIX */, 8 /* SPARC_32_SUNOS */, 8 /* X86_32_WINDOWS */, 8 /* LP64_UNIX */, 8 /* X86_64_WINDOWS */  };
  private static final int[] ScanoutMidpointSeconds_offset = new int[] { 32 /* ARM_MIPS_32 */, 32 /* X86_32_UNIX */, 32 /* X86_32_MACOS */, 32 /* PPC_32_UNIX */, 32 /* SPARC_32_SUNOS */, 32 /* X86_32_WINDOWS */, 32 /* LP64_UNIX */, 32 /* X86_64_WINDOWS */ };
//private static final int[] ScanoutMidpointSeconds_size = new int[] { 8 /* ARM_MIPS_32 */, 8 /* X86_32_UNIX */, 8 /* X86_32_MACOS */, 8 /* PPC_32_UNIX */, 8 /* SPARC_32_SUNOS */, 8 /* X86_32_WINDOWS */, 8 /* LP64_UNIX */, 8 /* X86_64_WINDOWS */  };
  private static final int[] EyeScanoutSeconds_offset = new int[] { 40 /* ARM_MIPS_32 */, 40 /* X86_32_UNIX */, 40 /* X86_32_MACOS */, 40 /* PPC_32_UNIX */, 40 /* SPARC_32_SUNOS */, 40 /* X86_32_WINDOWS */, 40 /* LP64_UNIX */, 40 /* X86_64_WINDOWS */ };
  private static final int[] EyeScanoutSeconds_size = new int[] { 16 /* ARM_MIPS_32 */, 16 /* X86_32_UNIX */, 16 /* X86_32_MACOS */, 16 /* PPC_32_UNIX */, 16 /* SPARC_32_SUNOS */, 16 /* X86_32_WINDOWS */, 16 /* LP64_UNIX */, 16 /* X86_64_WINDOWS */  };

  public static int size() {
    return ovrFrameTiming_size[mdIdx];
  }

  public static ovrFrameTiming create() {
    return create(Buffers.newDirectByteBuffer(size()));
  }

  public static ovrFrameTiming create(java.nio.ByteBuffer buf) {
      return new ovrFrameTiming(buf);
  }

  ovrFrameTiming(java.nio.ByteBuffer buf) {
    md = MachineDataInfo.StaticConfig.values()[mdIdx].md;
    accessor = new StructAccessor(buf);
  }

  public java.nio.ByteBuffer getBuffer() {
    return accessor.getBuffer();
  }

  /** Setter for native field <code>DeltaSeconds</code>: CType[(FloatType) 'float', size [fixed true, lnx64 4], [const[false], float]] */
  public ovrFrameTiming setDeltaSeconds(float val) {
    accessor.setFloatAt(DeltaSeconds_offset[mdIdx], val);
    return this;
  }

  /** Getter for native field <code>DeltaSeconds</code>: CType[(FloatType) 'float', size [fixed true, lnx64 4], [const[false], float]] */
  public float getDeltaSeconds() {
    return accessor.getFloatAt(DeltaSeconds_offset[mdIdx]);
  }

  /** Setter for native field <code>Pad</code>: CType[(FloatType) 'float', size [fixed true, lnx64 4], [const[false], float]] */
  public ovrFrameTiming setPad(float val) {
    accessor.setFloatAt(Pad_offset[mdIdx], val);
    return this;
  }

  /** Getter for native field <code>Pad</code>: CType[(FloatType) 'float', size [fixed true, lnx64 4], [const[false], float]] */
  public float getPad() {
    return accessor.getFloatAt(Pad_offset[mdIdx]);
  }

  /** Setter for native field <code>ThisFrameSeconds</code>: CType[(DoubleType) 'double', size [fixed true, lnx64 8], [const[false], double]] */
  public ovrFrameTiming setThisFrameSeconds(double val) {
    accessor.setDoubleAt(ThisFrameSeconds_offset[mdIdx], val);
    return this;
  }

  /** Getter for native field <code>ThisFrameSeconds</code>: CType[(DoubleType) 'double', size [fixed true, lnx64 8], [const[false], double]] */
  public double getThisFrameSeconds() {
    return accessor.getDoubleAt(ThisFrameSeconds_offset[mdIdx]);
  }

  /** Setter for native field <code>TimewarpPointSeconds</code>: CType[(DoubleType) 'double', size [fixed true, lnx64 8], [const[false], double]] */
  public ovrFrameTiming setTimewarpPointSeconds(double val) {
    accessor.setDoubleAt(TimewarpPointSeconds_offset[mdIdx], val);
    return this;
  }

  /** Getter for native field <code>TimewarpPointSeconds</code>: CType[(DoubleType) 'double', size [fixed true, lnx64 8], [const[false], double]] */
  public double getTimewarpPointSeconds() {
    return accessor.getDoubleAt(TimewarpPointSeconds_offset[mdIdx]);
  }

  /** Setter for native field <code>NextFrameSeconds</code>: CType[(DoubleType) 'double', size [fixed true, lnx64 8], [const[false], double]] */
  public ovrFrameTiming setNextFrameSeconds(double val) {
    accessor.setDoubleAt(NextFrameSeconds_offset[mdIdx], val);
    return this;
  }

  /** Getter for native field <code>NextFrameSeconds</code>: CType[(DoubleType) 'double', size [fixed true, lnx64 8], [const[false], double]] */
  public double getNextFrameSeconds() {
    return accessor.getDoubleAt(NextFrameSeconds_offset[mdIdx]);
  }

  /** Setter for native field <code>ScanoutMidpointSeconds</code>: CType[(DoubleType) 'double', size [fixed true, lnx64 8], [const[false], double]] */
  public ovrFrameTiming setScanoutMidpointSeconds(double val) {
    accessor.setDoubleAt(ScanoutMidpointSeconds_offset[mdIdx], val);
    return this;
  }

  /** Getter for native field <code>ScanoutMidpointSeconds</code>: CType[(DoubleType) 'double', size [fixed true, lnx64 8], [const[false], double]] */
  public double getScanoutMidpointSeconds() {
    return accessor.getDoubleAt(ScanoutMidpointSeconds_offset[mdIdx]);
  }

  /** Getter for native field <code>EyeScanoutSeconds</code>: CType[(ArrayType) 'double *', size [fixed false, lnx64 16], [const[false], array*1]], with array length of <code>2</code> */
  public static final int getEyeScanoutSecondsArrayLength() {
    return 2;
  }

  /** Setter for native field <code>EyeScanoutSeconds</code>: CType[(ArrayType) 'double *', size [fixed false, lnx64 16], [const[false], array*1]], with array length of <code>2</code> */
  public ovrFrameTiming setEyeScanoutSeconds(final int offset, double[] val) {
    final int arrayLength = 2;
    if( offset + val.length > arrayLength ) { throw new IndexOutOfBoundsException("offset "+offset+" + val.length "+val.length+" > array-length "+arrayLength); };
    final int elemSize = Buffers.SIZEOF_DOUBLE;
    final ByteBuffer destB = getBuffer();
    final int bTotal = arrayLength * elemSize;
    if( bTotal > EyeScanoutSeconds_size[mdIdx] ) { throw new IndexOutOfBoundsException("bTotal "+bTotal+" > size "+EyeScanoutSeconds_size[mdIdx]+", elemSize "+elemSize+" * "+arrayLength); };
    int bOffset = EyeScanoutSeconds_offset[mdIdx];
    final int bLimes = bOffset + bTotal;
    if( bLimes > destB.limit() ) { throw new IndexOutOfBoundsException("bLimes "+bLimes+" > buffer.limit "+destB.limit()+", elemOff "+bOffset+", elemSize "+elemSize+" * "+arrayLength); };
    bOffset += elemSize * offset;
    accessor.setDoublesAt(bOffset, val);
    return this;
  }

  /** Getter for native field <code>EyeScanoutSeconds</code>: CType[(ArrayType) 'double *', size [fixed false, lnx64 16], [const[false], array*1]], with array length of <code>2</code> */
  public DoubleBuffer getEyeScanoutSeconds() {
    return accessor.slice(EyeScanoutSeconds_offset[mdIdx],  Buffers.SIZEOF_DOUBLE * 2).asDoubleBuffer();
  }

  /** Getter for native field <code>EyeScanoutSeconds</code>: CType[(ArrayType) 'double *', size [fixed false, lnx64 16], [const[false], array*1]], with array length of <code>2</code> */
  public double[] getEyeScanoutSeconds(final int offset, double result[]) {
    final int arrayLength = 2;
    if( offset + result.length > arrayLength ) { throw new IndexOutOfBoundsException("offset "+offset+" + result.length "+result.length+" > array-length "+arrayLength); };
    return accessor.getDoublesAt(EyeScanoutSeconds_offset[mdIdx] + (Buffers.SIZEOF_DOUBLE * offset), result);
  }

}