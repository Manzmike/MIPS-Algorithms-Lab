# Lab 2 Assembly Programming Tasks

## Overview

This repository contains MIPS assembly language programs for Lab 2, each designed to introduce and practice specific algorithmic concepts. The programs include palindrome checking, factorial calculation, and array sorting using the MIPS assembly language.

## Programs

### Palindrome Checker (`palindrome_checker.asm`)
- **Objective**: Determines if a user-inputted string is a palindrome.
- **Method**: Compares characters from the beginning and end of the string moving towards the center.
- **Output**: A message indicating whether the string is a palindrome.

### Factorial Calculator (`factorial_calculator.asm`)
- **Objective**: Calculates the factorial of a given number using a recursive approach.
- **Method**: Uses the `jal` instruction for procedure calls and recursion.
- **Output**: The factorial result or an error message for negative inputs.

### Bubble Sort Implementation (`bubble_sort.asm`)
- **Objective**: Sorts a user-defined array of integers in ascending order.
- **Method**: Implements the bubble sort algorithm.
- **Output**: A sorted array of integers.

## Usage

To run these programs:

1. Load the corresponding `.asm` file into the MARS MIPS simulator.
2. Assemble the program using the "assemble" feature.
3. Execute the program and follow the console prompts for inputs.

## Testing

Each program includes test cases to verify correctness. Users should test with their own inputs to ensure robustness.

## Contributions

Feedback and contributions to improve the programs or fix issues are welcome. These programs serve as educational tools for understanding basic concepts in assembly language.

