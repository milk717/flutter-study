# ThemeData

## BottomNavigationBarThemeData

```dart
bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      )
```

여기에서 라벨설정 적용했을 때는 반영 안됨.

```dart
bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: '홈'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag),
            label: '쇼핑'
          ),
        ],
      ),
```

여기서 직접 설정했을 때만 됨.
이유는 아직 모름 ㅎㅎ
