# PLAN
# Inputs: product name (text), price per unit (decimal),
#         units sold (whole number), daily sales target (decimal)
# Check:  if price <= 0 or target <= 0 or units < 0 -> invalid input, stop
# Maths:  revenue = price x units
#         progress = revenue as a whole-number % of target (int chops decimals)
#         gap = target - revenue
# Rules:  100% or more -> TARGET MET
#         75% to 99%   -> CLOSE, plus gap
#         below 75%    -> BELOW TARGET, plus gap
#         target met and 50+ units -> star product line
# Output: heading with product name, units, revenue, target, progress, status

# The input from the user
product_name = input("Product name: ").capitalize()

price_per_unit = float(input("Price per unit: "))

units_sold = int(input("Units sold: "))

daily_sales_target = float(input("Daily sales target: "))  # money target for the day

# Check the input first, before any maths
if price_per_unit <= 0 or daily_sales_target <= 0 or units_sold < 0:
    print("Invalid input: price and target must be above 0, and units sold cannot be negative.")

else:
    # Calculation of the program
    revenue = price_per_unit * units_sold

    progress = int((revenue / daily_sales_target) * 100)

    gap = daily_sales_target - revenue

    # The logic about the target
    if progress >= 100:
        status = "TARGET MET"

    elif progress >= 75:
        status = "CLOSE"

    else:
        status = "BELOW TARGET"

    # The output of the program
    print(f"\n-----------Daily Sales Report: {product_name}-------------")
    print(f"Units sold: {units_sold}")
    print(f"Revenue: ${revenue:,.2f}")
    print(f"Target: ${daily_sales_target:,.2f}")
    print(f"Progress: {progress}% of target")

    if progress >= 100:
        print(f"Status: {status}")
    else:
        print(f"Status: {status}, ${gap:,.2f} short of target")

    if progress >= 100 and units_sold >= 50:
        print("Star product: high volume and target met!")
