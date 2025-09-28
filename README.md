
# 🧩 Smart Ahwa Manager – SOLID Principles

In this project, I divided the structure into main folders:

* **controllers/**
* **repositories/**
* **models/**

This organization helped me apply the most important **SOLID Principles** in a clean and structured way.

---

## 1️⃣ Interface Segregation Principle (ISP)

In the **repository** for `Order`, I placed all functions related only to orders.
The `OrderRepository` (Concrete) class implements all methods defined in `IOrderRepository` (Abstract),
so it does not have to implement any unnecessary methods.
This follows the **Interface Segregation Principle**, ensuring each interface is small and specific to its purpose.

---

## 2️⃣ Dependency Inversion Principle (DIP)

In the **abstract order service**, I wrote functions like `calculateTopSellingDrinks`.
Then, I created `OrderServiceImp` to implement these functions.

Instead of creating an object from `OrderRepository` directly inside the service,
I passed the abstraction (`IOrderRepository`) from the outside.

This way:

* The higher-level layer (Service) and the lower-level layer (Repository) **both depend on an abstraction, not on each other directly**.
* This achieves the **Dependency Inversion Principle** with the use of **Dependency Injection**.

---

## 3️⃣ Single Responsibility Principle (SRP)

Inside **models**, I designed each class to perform **only one responsibility**.
Each class contains its own attributes with `getters` and `setters` to control them,
and does not include any unrelated tasks.
This follows the **Single Responsibility Principle**.

---

## 4️⃣ Practical Example: calculateTopSellingDrinks

In `OrderServiceImp`, I implemented a function to calculate the top-selling drink as follows:

1. Fetched all completed orders from `OrderRepository`.
2. Created a `Map<String, int>` to store each drink name and the number of times it was ordered.
3. Iterated through all orders:

   * If the drink already exists in the map, I added its quantity to the existing count.
   * If it doesn’t exist, I added it for the first time with its quantity.
4. Converted the map into a list using `.entries.toList()`.
5. Sorted the list in descending order based on order count:

   ```dart
   drinks.sort((a, b) => b.value.compareTo(a.value));
   ```
6. Took the first element in the list as the top-selling drink.

---

## ✅ Result

* The code became clean, structured, and easy to maintain.
* All **SOLID principles** were respected.
* The project is now easily scalable without breaking existing code.

---



