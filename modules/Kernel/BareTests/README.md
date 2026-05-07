# Kernel.BareTests

Lightweight kernel tests that run without SUnit. Each test method returns `true`
on success.

## Running

```bash
cd runtime/cpp/build/Darwin-arm64-Debug   # on MacOS
./egg Kernel.BareTests
```

## Expected output

```
Running Kernel.BareTests...
  PASS: test001SendYourself
  ...
  PASS: test232BitShiftAndRotate
X run, X passed, 0 failed
```

