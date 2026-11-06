# Daily Sales Report

A small command-line tool that checks how one product performed against its daily sales target.

## What it does

1. Asks for the product name, price per unit, units sold and the daily sales target.
2. Validates the input before any calculation (price and target must be above 0, units sold cannot be negative).
3. Calculates revenue, progress as a whole-number percentage of the target, and the gap to the target.
4. Prints a report with a status:
   - **TARGET MET** at 100% or more
   - **CLOSE** at 75% to 99%, with the amount short
   - **BELOW TARGET** under 75%, with the amount short
5. Flags a **star product** when the target is met and 50 or more units were sold.

## Example run

```text
Product name: milk
Price per unit: 8
Units sold: 30
Daily sales target: 300

-----------Daily Sales Report: Milk-------------
Units sold: 30
Revenue: $240.00
Target: $300.00
Progress: 80% of target
Status: CLOSE, $60.00 short of target
```

## How to run

```bash
python daily_sales_report.py
```

## Concepts used

Variables, `input()`, type conversion with `int()` and `float()`, arithmetic, f-string number formatting, comparison operators, `if / elif / else` and logical operators (`and`, `or`).
