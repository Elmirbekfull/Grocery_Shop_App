import 'package:flutter/material.dart';
import 'package:grocery_app/model/cart_model.dart';
import 'package:grocery_app/screens/home_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              )),
        ),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Мои заказы ${value.cartItems.length}",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: value.cartItems.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8)),
                              child: ListTile(
                                leading: Image.asset(
                                  value.cartItems[index][2],
                                  height: 36,
                                ),
                                title: Text(value.cartItems[index][0]),
                                subtitle:
                                    Text("\$" + value.cartItems[index][1]),
                                trailing: IconButton(
                                    onPressed: () {
                                      Provider.of<CartModel>(context,
                                              listen: false)
                                          .removeCarttoItems(index);
                                    },
                                    icon: const Icon(
                                      Icons.cancel,
                                      color: Colors.red,
                                    )),
                              ),
                            ),
                          );
                        })),
                // total + pay now

                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Итоговая цена",
                              style: TextStyle(
                                color: Colors.green[100],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              value.calculateTotal(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ],
                        ),
                        Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.green.shade100),
                                borderRadius: BorderRadius.circular(12)),
                            child: const Row(
                              children: [
                                Text(
                                  "Заплатить сейчас",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
