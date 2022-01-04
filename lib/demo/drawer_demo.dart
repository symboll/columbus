
import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // DrawerHeader(
          //   child: Text('Header'.toUpperCase(),),
          //   decoration: BoxDecoration(
          //     color: Colors.grey[400]
          //   ),
          // ),
          UserAccountsDrawerHeader(
            accountName: const Text('李康华', style: TextStyle(fontWeight: FontWeight.bold),),
            accountEmail: const Text('likanghua@163.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage('https://img3.sycdn.imooc.com/5ba4b2e70001230d07410719-140-140.jpg'),
            ),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              image: DecorationImage(
                image: const NetworkImage('https://resources.ninghao.net/images/overkill.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.pink[100]!.withOpacity(0.6),
                  BlendMode.srcOver
                )
              ),
            ),
          ),
          const ListTile(
            // leading: Icon(Icons.message, color: Colors.black12, size: 22.0),
            title: Text('message', textAlign: TextAlign.right,),
            trailing: Icon(Icons.message, color: Colors.black12, size: 22.0),
          ),
          ListTile(
            title: Text('favorite', textAlign: TextAlign.right,),
            trailing: Icon(Icons.favorite, color: Colors.black12, size: 22.0),
            onTap: () => Navigator.pop(context), 
          ),
          const ListTile(
            title: Text('settings', textAlign: TextAlign.right,),
            trailing: const Icon(Icons.settings, color: Colors.black12, size: 22.0),
          ),
        ],
      ),
    );
  }
}

