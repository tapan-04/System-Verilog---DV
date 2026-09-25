# Number Systems & Codes

Notes and practice from my Digital Electronics preparation.

## Topics Covered

* Number systems and radix/base
* Decimal number system
* Binary number system
* Octal number system
* Hexadecimal number system
* Signed and unsigned numbers
* Sign-magnitude representation
* 1's complement
* 2's complement
* Advantages of 2's complement
* Complement number systems
* Decimal ↔ Binary conversion
* Decimal ↔ Octal conversion
* Decimal ↔ Hexadecimal conversion
* Binary ↔ Octal conversion
* Binary ↔ Hexadecimal conversion
* Octal ↔ Hexadecimal conversion
* Fractional number conversions
* Binary arithmetic

## Important Rules

| Conversion            | Method                  |
| --------------------- | ----------------------- |
| Decimal → Binary      | Repeated division by 2  |
| Decimal → Octal       | Repeated division by 8  |
| Decimal → Hexadecimal | Repeated division by 16 |
| Binary → Decimal      | Positional weights      |
| Octal → Decimal       | Positional weights      |
| Hexadecimal → Decimal | Positional weights      |
| Binary ↔ Octal        | Groups of 3 bits        |
| Binary ↔ Hexadecimal  | Groups of 4 bits        |
| Octal ↔ Hexadecimal   | Convert through Binary  |

## Signed Number Representations

Three common representations:

1. Sign-Magnitude
2. 1's Complement
3. 2's Complement

For 2's complement:

```text
2's complement = 1's complement + 1
```

For an N-bit 2's complement number:

```text
Range = -2^(N-1) to 2^(N-1)-1
```

## Key Learning

2's complement is widely used for signed binary arithmetic because subtraction can be implemented using addition hardware and there is only one representation of zero.


------------------

# Number System Conversions

## 1. Decimal → Binary

For an integer, repeatedly divide by 2 and read the remainders from bottom to top.

Example:

```text
25 ÷ 2 = 12 remainder 1
12 ÷ 2 =  6 remainder 0
 6 ÷ 2 =  3 remainder 0
 3 ÷ 2 =  1 remainder 1
 1 ÷ 2 =  0 remainder 1
```

Therefore:

```text
25₁₀ = 11001₂
```

---

## 2. Decimal → Octal

Repeatedly divide by 8.

Example:

```text
83 ÷ 8 = 10 remainder 3
10 ÷ 8 =  1 remainder 2
 1 ÷ 8 =  0 remainder 1
```

Therefore:

```text
83₁₀ = 123₈
```

---

## 3. Decimal → Hexadecimal

Repeatedly divide by 16.

Example:

```text
254 ÷ 16 = 15 remainder 14
 15 ÷ 16 =  0 remainder 15
```

Since:

```text
14 = E
15 = F
```

Therefore:

```text
254₁₀ = FE₁₆
```

---

## 4. Binary → Decimal

Use powers of 2.

Example:

```text
101101₂
```

```text
1×2⁵ + 0×2⁴ + 1×2³ + 1×2² + 0×2¹ + 1×2⁰

= 32 + 8 + 4 + 1
= 45
```

Therefore:

```text
101101₂ = 45₁₀
```

---

## 5. Octal → Decimal

Use powers of 8.

Example:

```text
347₈
```

```text
3×8² + 4×8¹ + 7×8⁰

= 192 + 32 + 7
= 231
```

Therefore:

```text
347₈ = 231₁₀
```

---

## 6. Hexadecimal → Decimal

Use powers of 16.

Example:

```text
2A3₁₆
```

Since A = 10:

```text
2×16² + 10×16¹ + 3×16⁰

= 512 + 160 + 3
= 675
```

Therefore:

```text
2A3₁₆ = 675₁₀
```

---

## 7. Binary → Octal

Group binary digits into groups of 3 from the right.

Example:

```text
10110110₂
```

Pad with zeros if required:

```text
010 110 110
```

```text
010 = 2
110 = 6
110 = 6
```

Therefore:

```text
10110110₂ = 266₈
```

---

## 8. Octal → Binary

Convert each octal digit into 3 binary bits.

Example:

```text
572₈
```

```text
5 → 101
7 → 111
2 → 010
```

Therefore:

```text
572₈ = 101111010₂
```

---

## 9. Binary → Hexadecimal

Group binary digits into groups of 4 from the right.

Example:

```text
101101101111₂
```

```text
1011 0110 1111
```

```text
1011 = B
0110 = 6
1111 = F
```

Therefore:

```text
101101101111₂ = B6F₁₆
```

---

## 10. Hexadecimal → Binary

Convert each hexadecimal digit into 4 binary bits.

Example:

```text
A7C₁₆
```

```text
A → 1010
7 → 0111
C → 1100
```

Therefore:

```text
A7C₁₆ = 101001111100₂
```

---

## 11. Octal → Hexadecimal

There is no direct grouping shortcut.

Use:

```text
Octal → Binary → Hexadecimal
```

Example:

```text
725₈
```

```text
7 → 111
2 → 010
5 → 101
```

```text
111010101₂
```

Group into 4:

```text
0001 1101 0101
```

```text
1 D 5
```

Therefore:

```text
725₈ = 1D5₁₆
```

---

## 12. Hexadecimal → Octal

Use:

```text
Hexadecimal → Binary → Octal
```

Example:

```text
2F7₁₆
```

```text
2 → 0010
F → 1111
7 → 0111
```

```text
001011110111₂
```

Group into 3:

```text
001 011 110 111
```

```text
1 3 6 7
```

Therefore:

```text
2F7₁₆ = 1367₈
```

---

# Fractional Conversions

## Decimal Fraction → Binary

For the integer part, divide by 2.

For the fractional part, repeatedly multiply by 2.

Example:

```text
10.625₁₀
```

Integer:

```text
10₁₀ = 1010₂
```

Fraction:

```text
0.625 × 2 = 1.250 → 1
0.250 × 2 = 0.500 → 0
0.500 × 2 = 1.000 → 1
```

Therefore:

```text
10.625₁₀ = 1010.101₂
```

## Key Rule

```text
Integer part  → DIVIDE by base
Fraction part → MULTIPLY by base
```

---

# Signed Number Representation

## Sign-Magnitude

MSB represents the sign:

```text
0 → positive
1 → negative
```

Example:

```text
+3 = 0011
-3 = 1011
```

Problem:

```text
+0 = 0000
-0 = 1000
```

There are two representations of zero.

---

## 1's Complement

Invert every bit.

```text
0 → 1
1 → 0
```

Example:

```text
+5 = 0101

-5 = 1010
```

Again, there are two zeros.

---

## 2's Complement

Steps:

```text
1. Find 1's complement
2. Add 1
```

Example: -4 using 4 bits.

```text
+4       = 0100
1's comp = 1011
+1       = 0001
----------------
2's comp = 1100
```

Therefore:

```text
-4 = 1100
```

### Advantages

* Only one representation of zero
* Simplifies signed arithmetic
* Addition hardware can also perform subtraction

---

# N's Complement

For a number system with base N:

```text
(N-1)'s complement
N's complement
```

Relationship:

```text
N's complement
= (N-1)'s complement + 1
```

Examples:

| Base | (N−1)'s Complement | N's Complement |
| ---: | -----------------: | -------------: |
|    2 |                1's |            2's |
|    8 |                7's |            8's |
|   10 |                9's |           10's |
|   16 |               15's |           16's |

---

# Quick Reference

```text
Binary ↔ Octal       → 3 bits/digit
Binary ↔ Hex         → 4 bits/digit

Decimal → base       → divide for integer
Decimal fraction     → multiply by base

Octal ↔ Hex          → go through Binary

2's complement       → invert + 1

N-bit unsigned       → 0 to 2^N - 1

N-bit 2's complement → -2^(N-1) to 2^(N-1)-1
```
