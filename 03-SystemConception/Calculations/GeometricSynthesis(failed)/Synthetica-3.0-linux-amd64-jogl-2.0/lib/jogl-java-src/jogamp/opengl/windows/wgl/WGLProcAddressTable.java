/* !---- DO NOT EDIT: This file autogenerated by com/jogamp/gluegen/opengl/GLEmitter.java on Thu Oct 15 14:38:12 CEST 2015 ----! */

package jogamp.opengl.windows.wgl;

import java.util.*;
import com.jogamp.opengl.*;
import com.jogamp.opengl.fixedfunc.*;
import jogamp.opengl.*;
import jogamp.nativewindow.windows.PIXELFORMATDESCRIPTOR;
import com.jogamp.gluegen.runtime.opengl.GLProcAddressResolver;
import com.jogamp.gluegen.runtime.ProcAddressTable;
import com.jogamp.common.util.SecurityUtil;

/**
 * This table is a cache of pointers to the dynamically-linkable C library.
 * @see ProcAddressTable
 */
public final class WGLProcAddressTable extends ProcAddressTable {


  public WGLProcAddressTable(){ super(); }

  public WGLProcAddressTable(com.jogamp.gluegen.runtime.FunctionAddressResolver resolver){ super(resolver); }

  /* pp */ long _addressof_wglCopyContext;
  /* pp */ long _addressof_wglCreateContext;
  /* pp */ long _addressof_wglDeleteContext;
  /* pp */ long _addressof_wglGetCurrentContext;
  /* pp */ long _addressof_wglGetCurrentDC;
  /* pp */ long _addressof_wglMakeCurrent;
  /* pp */ long _addressof_wglShareLists;
  /* pp */ long _addressof_wglGetProcAddress;
  /* pp */ long _addressof_wglSwapLayerBuffers;
  /* pp */ long _addressof_wglChoosePixelFormat;
  /* pp */ long _addressof_wglDescribePixelFormat;
  /* pp */ long _addressof_wglGetPixelFormat;
  /* pp */ long _addressof_wglSetPixelFormat;
  /* pp */ long _addressof_wglSwapBuffers;
  @Override
  protected boolean isFunctionAvailableImpl(String functionNameUsr) throws IllegalArgumentException  {
    final String functionNameBase = com.jogamp.gluegen.runtime.opengl.GLNameResolver.normalizeVEN(com.jogamp.gluegen.runtime.opengl.GLNameResolver.normalizeARB(functionNameUsr, true), true);
    final String addressFieldNameBase = "_addressof_" + functionNameBase;
    final int funcNamePermNum = com.jogamp.gluegen.runtime.opengl.GLNameResolver.getFuncNamePermutationNumber(functionNameBase);
    final java.lang.reflect.Field addressField = java.security.AccessController.doPrivileged(new java.security.PrivilegedAction<java.lang.reflect.Field>() {
        public final java.lang.reflect.Field run() {
            java.lang.reflect.Field addressField = null;
            for(int i = 0; i < funcNamePermNum; i++) {
                final String addressFieldName = com.jogamp.gluegen.runtime.opengl.GLNameResolver.getFuncNamePermutation(addressFieldNameBase, i);
                try {
                    addressField = WGLProcAddressTable.class.getDeclaredField( addressFieldName );
                    addressField.setAccessible(true); // we need to read the protected value!
                    return addressField;
                } catch (NoSuchFieldException ex) { }
            }
            return null;
        } } );

    if(null==addressField) {
      // The user is calling a bogus function or one which is not
      // runtime linked
      throw new RuntimeException(
          "WARNING: Address field query failed for \"" + functionNameBase + "\"/\"" + functionNameUsr +
          "\"; it's either statically linked or address field is not a known " +
          "function");
    } 
    try {
      return 0 != addressField.getLong(this);
    } catch (Exception e) {
      throw new RuntimeException(
          "WARNING: Address query failed for \"" + functionNameBase + "\"/\"" + functionNameUsr +
          "\"; it's either statically linked or is not a known " +
          "function", e);
    }
  }
  @Override
  public long getAddressFor(String functionNameUsr) throws SecurityException, IllegalArgumentException {
    SecurityUtil.checkAllLinkPermission();
    final String functionNameBase = com.jogamp.gluegen.runtime.opengl.GLNameResolver.normalizeVEN(com.jogamp.gluegen.runtime.opengl.GLNameResolver.normalizeARB(functionNameUsr, true), true);
    final String addressFieldNameBase = "_addressof_" + functionNameBase;
    final int  funcNamePermNum = com.jogamp.gluegen.runtime.opengl.GLNameResolver.getFuncNamePermutationNumber(functionNameBase);
    final java.lang.reflect.Field addressField = java.security.AccessController.doPrivileged(new java.security.PrivilegedAction<java.lang.reflect.Field>() {
        public final java.lang.reflect.Field run() {
            java.lang.reflect.Field addressField = null;
            for(int i = 0; i < funcNamePermNum; i++) {
                final String addressFieldName = com.jogamp.gluegen.runtime.opengl.GLNameResolver.getFuncNamePermutation(addressFieldNameBase, i);
                try {
                    addressField = WGLProcAddressTable.class.getDeclaredField( addressFieldName );
                    addressField.setAccessible(true); // we need to read the protected value!
                    return addressField;
                } catch (NoSuchFieldException ex) { }
            }
            return null;
        } } );

    if(null==addressField) {
      // The user is calling a bogus function or one which is not
      // runtime linked
      throw new RuntimeException(
          "WARNING: Address field query failed for \"" + functionNameBase + "\"/\"" + functionNameUsr +
          "\"; it's either statically linked or address field is not a known " +
          "function");
    } 
    try {
      return addressField.getLong(this);
    } catch (Exception e) {
      throw new RuntimeException(
          "WARNING: Address query failed for \"" + functionNameBase + "\"/\"" + functionNameUsr +
          "\"; it's either statically linked or is not a known " +
          "function", e);
    }
  }
} // end of class WGLProcAddressTable