# SIMD Support Across Architectures

This document provides an overview of SIMD (Single Instruction, Multiple Data) support across Intel, AMD, ARM, and RISC-V architectures, highlighting the vector extensions, supported vector sizes, and notable features.

---

## Intel and AMD: AVX Support

### **AVX2**
- **Intel**: Introduced with Haswell (2013) and supported on most processors.  
  - **Exceptions**: Older Pentium and Celeron CPUs until Tiger Lake (2020).  
- **AMD**: Introduced with Excavator processors (2015) and supported in newer architectures.

### **AVX512f**
- **Intel**: Supported on Skylake-X (2017) and later platforms, including:
  - **Skylake, Cannon Lake, Cascade Lake-SP, Ice Lake, Tiger Lake, Rocket Lake, Alder Lake, Sapphire Rapids**.
- **AMD**: Introduced with Zen 4 (2022) and continued on Zen 5 (2024).

### **AVXVBMI2**
- **Intel**: Supported starting with Ice Lake (2019), and subsequent platforms:
  - **Tiger Lake, Rocket Lake, Sapphire Rapids**.
- **AMD**: Introduced with Zen 4 (2022), continued on Zen 5 (2024).

### **New AVX10**
- **Intel**: Planned support for Granite Rapids (2024) and Diamond Rapids (future).

**References**:
- [Wikipedia - Advanced Vector Extensions](https://en.wikipedia.org/wiki/Advanced_Vector_Extensions#CPUs_with_AVX2)

---

## ARM: NEON and SVE Support

### **NEON**
- **Vector Size**: Fixed 128-bit vectors with lanes for various data types.
- **Supported On**:  
  - **Cortex-A** and **Cortex-R** processors.
- **Operations**:
  - Integer: 16x8-bit, 8x16-bit, 4x32-bit, 2x64-bit.
  - Floating-Point: 8x16-bit*, 4x32-bit, 2x64-bit**.

### **SVE (Scalable Vector Extension)**
- **Vector Size**: Scalable from **128-bit to 2048-bit** in increments of 128 bits.
- **Supported On**: **ARMv8-A** and newer processors.

### **SVE2**
- Evolution of SVE with NEON compatibility.
- **Vector Size**: Same as SVE (**128-bit to 2048-bit**).
- **Introduced With**: **ARMv9**.

**References**:
- [ARM Neon Technology](https://www.arm.com/technologies/neon)
- [ARM Scalable Vector Extensions](https://developer.arm.com/Architectures/Scalable%20Vector%20Extensions)
- [ARM Intrinsics Documentation](https://developer.arm.com/architectures/instruction-sets/intrinsics/)

---

## RISC-V: Vector Extension (RVV)

### **RVV**
- **Registers**: 32 vector registers.
- **Vector Size**: Implementation-defined (`VLEN`), ranging from **128-bit to thousands of bits**.
- **Key Features**:
  - Scalable hardware-defined vector width.
  - Dynamic operations based on `VLEN`, unlike fixed-width SIMD (e.g., x86, ARM).

**References**:
- [RVV Vector Extension Overview - fprox Substack](https://fprox.substack.com/p/risc-v-vector-extension-in-a-nutshell-part-1?utm_source=substack&utm_campaign=post_embed&utm_medium=web)
- [RISC-V Intrinsics Documentation](https://github.com/riscv-non-isa/rvv-intrinsic-doc/tree/main)

---

## Summary Table

| Architecture | Extension | Vector Size | Notes |
|--------------|-----------|-------------|-------|
| **Intel**    | AVX2      | 256 bits    | From Haswell (2013). |
|              | AVX512f   | 512 bits    | From Skylake-X (2017). |
|              | AVX10     | 512 bits+   | Planned for 2024+. |
| **AMD**      | AVX2      | 256 bits    | From Excavator (2015). |
|              | AVX512f   | 512 bits    | From Zen 4 (2022). |
| **ARM**      | NEON      | 128 bits    | Fixed-length SIMD. |
|              | SVE/SVE2  | 128–2048 bits | Scalable vector length. |
| **RISC-V**   | RVV       | Implementation-defined | Scalable (`VLEN`). |

---

## References
- [Intel Intrinsics Guide](https://www.intel.com/content/www/us/en/docs/intrinsics-guide/index.html)
- [AMD Developer Resources](https://developer.amd.com/resources/)
- [ARM Neon Technology](https://www.arm.com/technologies/neon)
- [ARM Scalable Vector Extensions](https://developer.arm.com/Architectures/Scalable%20Vector%20Extensions)
- [ARM Intrinsics Documentation](https://developer.arm.com/architectures/instruction-sets/intrinsics/)
- [RVV Vector Extension Overview - fprox Substack](https://fprox.substack.com/p/risc-v-vector-extension-in-a-nutshell-part-1?utm_source=substack&utm_campaign=post_embed&utm_medium=web)
- [RISC-V Intrinsics Documentation](https://github.com/riscv-non-isa/rvv-intrinsic-doc/tree/main)
- [Wikipedia - Advanced Vector Extensions](https://en.wikipedia.org/wiki/Advanced_Vector_Extensions#CPUs_with_AVX2)

---
