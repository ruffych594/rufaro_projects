using System;
using System.Net.Http.Headers;

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
            string shopName = Console.ReadLine();

            // the customer's name (string)
            Console.Write("Enter customer name: ");
            string customerName = Console.ReadLine();

            // the item name (string)
            Console.Write("Enter item name: ");
            string itemName = Console.ReadLine();

            // the unit price (double)
            Console.Write("Enter unit price: ");
            double unitPrice = Convert.ToDouble(Console.ReadLine());

            // the quantity (int)
            Console.Write("Enter quantity: ");
            int quantity = Convert.ToInt32(Console.ReadLine());

            // the customer's budget (double)
            Console.Write("Enter customer budget: ");
            double budget = Convert.ToDouble(Console.ReadLine());

            // Calculation

            double subtotal = unitPrice * quantity;
            double vat = subtotal * vatRate;
            double total = subtotal + vat;
            int affordable = (int)(budget / unitPrice);

            Console.WriteLine(); // Add a blank line for better readability

            // Print a receipt with Console.WriteLine(), joining text and variables with +.
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

