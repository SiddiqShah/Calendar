import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 87         ,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    Transform.translate(
                      offset: const Offset(15, 0), 
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset("images/f.jpg", fit: BoxFit.cover), 
                              Container(
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF8E83F8), width: 3),
                      ),
                      child: ClipOval(
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset("images/f.jpg", fit: BoxFit.cover),
                            Container(
                              color: Colors.black.withOpacity(0.25),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                Icon(Icons.keyboard_arrow_down, color: Colors.black),
              ],
            )
          ),
          const Text(
            "History",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Row(
            children: const [
              IconWidget(icon: Icons.search),
              SizedBox(width: 12),
              IconWidget(icon: Icons.notifications_none),
            ],
          ),
        ],
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  final IconData icon;
  const IconWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
      child: Icon(icon, color: Colors.black),
    );
  }
}
