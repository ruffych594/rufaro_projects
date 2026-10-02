using System;

namespace Receipt
{
    class Program
    {
        static void Main(string[] args)
        {

            // Store the VAT rate as a constant

            const double vatRate = 0.15;

            // the shop name (string)
            Console.Write("Enter shop name: ");
            string shopName = Console.ReadLine() ?? "";

            // the customer's name (string)
            Console.Write("Enter customer name: ");
            string customerName = Console.ReadLine() ?? "";

            // the item name (string)
            Console.Write("Enter item name: ");
            string itemName = Console.ReadLine() ?? "";

            // the unit price (double) - must be more than 0
            double unitPrice;
            Console.Write("Enter unit price: ");
            while (!double.TryParse(Console.ReadLine(), out unitPrice) || unitPrice <= 0)
            {
                Console.Write("Please enter a price greater than 0: ");
            }

            // the quantity (int) - must be at least 1
            int quantity;
            Console.Write("Enter quantity: ");
            while (!int.TryParse(Console.ReadLine(), out quantity) || quantity < 1)
            {
                Console.Write("Please enter a whole number of 1 or more: ");
            }

            // the customer's budget (double) - cannot be negative
            double budget;
            Console.Write("Enter customer budget: ");
            while (!double.TryParse(Console.ReadLine(), out budget) || budget < 0)
            {
                Console.Write("Please enter a budget of 0 or more: ");
            }

            // Calculation

            double subtotal = unitPrice * quantity;
            double vat = subtotal * vatRate;
            double total = subtotal + vat;

            // How many items the budget covers once VAT is added to each item
            double priceWithVat = unitPrice * (1 + vatRate);
            int affordable = (int)(budget / priceWithVat);

            Console.WriteLine(); // Add a blank line for better readability

            // Print a receipt with Console.WriteLine(), using string interpolation ($"...") to insert the variables.
            Console.WriteLine($"{new string('=', 6)} {shopName}'s Supplies {new string('=', 6)}");
            Console.WriteLine($"Customer: {customerName}");
            Console.WriteLine($"Item: {itemName} * {quantity}");
            Console.WriteLine($"Subtotal: {subtotal:C}");
            Console.WriteLine($"VAT: {vat:C}");
            Console.WriteLine($"Total: {total:C}");
            Console.WriteLine($"With your budget you could buy {affordable} {itemName}(s)");
        }
    }
}
