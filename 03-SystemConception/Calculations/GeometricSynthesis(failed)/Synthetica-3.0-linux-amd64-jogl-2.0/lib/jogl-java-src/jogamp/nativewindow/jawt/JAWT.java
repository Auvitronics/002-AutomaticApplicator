/* !---- DO NOT EDIT: This file autogenerated by com/jogamp/gluegen/JavaEmitter.java on Thu Oct 15 14:28:51 CEST 2015 ----! */


package jogamp.nativewindow.jawt;

import java.nio.*;

import com.jogamp.gluegen.runtime.*;
import com.jogamp.common.os.*;
import com.jogamp.common.nio.*;
import jogamp.common.os.MachineDataInfoRuntime;

import java.security.*;
import jogamp.nativewindow.jawt.*;
import com.jogamp.common.os.Platform;
import com.jogamp.common.util.VersionNumber;

public class JAWT {

  StructAccessor accessor;

  private static final int mdIdx = MachineDataInfoRuntime.getStatic().ordinal();
  private final MachineDataInfo md;

  private static final int[] JAWT_size = new int[] { 24 /* ARM_MIPS_32 */, 24 /* X86_32_UNIX */, 24 /* X86_32_MACOS */, 24 /* PPC_32_UNIX */, 24 /* SPARC_32_SUNOS */, 24 /* X86_32_WINDOWS */, 48 /* LP64_UNIX */, 48 /* X86_64_WINDOWS */  };
  private static final int[] version_offset = new int[] { 0 /* ARM_MIPS_32 */, 0 /* X86_32_UNIX */, 0 /* X86_32_MACOS */, 0 /* PPC_32_UNIX */, 0 /* SPARC_32_SUNOS */, 0 /* X86_32_WINDOWS */, 0 /* LP64_UNIX */, 0 /* X86_64_WINDOWS */ };
//private static final int[] version_size = new int[] { 4 /* ARM_MIPS_32 */, 4 /* X86_32_UNIX */, 4 /* X86_32_MACOS */, 4 /* PPC_32_UNIX */, 4 /* SPARC_32_SUNOS */, 4 /* X86_32_WINDOWS */, 4 /* LP64_UNIX */, 4 /* X86_64_WINDOWS */  };

  public static int size() {
    return JAWT_size[mdIdx];
  }

  public static JAWT create() {
    return create(Buffers.newDirectByteBuffer(size()));
  }

  public static JAWT create(java.nio.ByteBuffer buf) {
      return new JAWT(buf);
  }

  JAWT(java.nio.ByteBuffer buf) {
    md = MachineDataInfo.StaticConfig.values()[mdIdx].md;
    accessor = new StructAccessor(buf);
  }

  public java.nio.ByteBuffer getBuffer() {
    return accessor.getBuffer();
  }

  /** Setter for native field <code>version</code>: CType[(IntType) typedef 'jint', size [fixed true, lnx64 4], [const[false], int]] */
  public JAWT setVersion(int val) {
    accessor.setIntAt(version_offset[mdIdx], val);
    return this;
  }

  /** Getter for native field <code>version</code>: CType[(IntType) typedef 'jint', size [fixed true, lnx64 4], [const[false], int]] */
  public int getVersion() {
    return accessor.getIntAt(version_offset[mdIdx]);
  }

  /** Interface to C language function: <br> <code>JAWT_DrawingSurface *  GetDrawingSurface(JNIEnv *  env, jobject target)</code><br>   */
  public JAWT_DrawingSurface GetDrawingSurface(Object target)  {

    final ByteBuffer _res;
    _res = GetDrawingSurface0(getBuffer(), target);
    if (_res == null) return null;
    return JAWT_DrawingSurface.create(Buffers.nativeOrder(_res));
  }
  /** Entry point to C language function: <code>JAWT_DrawingSurface *  GetDrawingSurface(JNIEnv *  env, jobject target)</code><br>   */
  private native ByteBuffer GetDrawingSurface0(ByteBuffer jthis0, Object target);

  /** Interface to C language function: <br> <code>void FreeDrawingSurface(JAWT_DrawingSurface *  ds)</code><br>   */
  public void FreeDrawingSurface(JAWT_DrawingSurface ds)  {

        FreeDrawingSurface0(getBuffer(), ((ds == null) ? null : ds.getBuffer()));
  }
  /** Entry point to C language function: <code>void FreeDrawingSurface(JAWT_DrawingSurface *  ds)</code><br>   */
  private native void FreeDrawingSurface0(ByteBuffer jthis0, ByteBuffer ds);

  /** Interface to C language function: <br> <code>void Lock(JNIEnv *  env)</code><br>   */
  public void Lock()  {

        Lock0(getBuffer());
  }
  /** Entry point to C language function: <code>void Lock(JNIEnv *  env)</code><br>   */
  private native void Lock0(ByteBuffer jthis0);

  /** Interface to C language function: <br> <code>void Unlock(JNIEnv *  env)</code><br>   */
  public void Unlock()  {

        Unlock0(getBuffer());
  }
  /** Entry point to C language function: <code>void Unlock(JNIEnv *  env)</code><br>   */
  private native void Unlock0(ByteBuffer jthis0);

  // --- Begin CustomJavaCode .cfg declarations
  private int jawt_version_cached = 0;
  
  public final int getCachedVersion() {
      return jawt_version_cached;
  }
  
  protected static boolean getJAWT(final JAWT jawt, final int jawt_version_flags) {
      JAWTUtil.initSingleton();
      // Workaround for 4845371.
      // Make sure the first reference to the JNI GetDirectBufferAddress is done
      // from a privileged context so the VM's internal class lookups will succeed.
      return AccessController.doPrivileged(new PrivilegedAction<Boolean>() {
          public Boolean run() {
            jawt.setVersion(jawt_version_flags);
            if (JAWTFactory.JAWT_GetAWT(jawt)) {
              jawt.jawt_version_cached = jawt.getVersion();
              return new Boolean(true);
            }
            jawt.jawt_version_cached = 0;
            return new Boolean(false);
          }
        }).booleanValue();
  }
  // ---- End CustomJavaCode .cfg declarations


}