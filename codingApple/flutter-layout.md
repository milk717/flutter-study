# 기본 위젯4개

## 메인페이지 작성

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());  //앱 시작해주세요~
}
//메인페이지 만들기
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*
				이 부분에 위젯 작성하면됨
			*/
    );
  }
}
```

## 위젯 4개

### 1. Text 위젯

```dart
home: Text('안녕')
```

### 2. Icon 위젯

```dart
home: Icon(Icons.star) //star 같은 아이콘 이름은 플러터 홈페이지에 있음
```

### 3. Image 위젯

1. 이미지 보관용 assets 폴더 만들기
2. assets에 이미지 넣기
3. **[pubspec.yaml](https://www.notion.so/3c658724fd994e42849b7b48d3a26b77)** 파일에 이미지 등록하기

   ```yaml
   flutter:
     assets:
       - assets/
   ```

4. main.dart 파일에서 이미지 경로 등록

   ```dart
   home: Image.asset('assets/conan.png')
   //브라우저로 미리보기 할 땐 아래처럼 해도됨.
   home: Image.asset('conan.png')
   ```

### 4. Box 위젯

```dart
//둘이 용도 같음. 아무것도 안쓰면 투명한 박스
home: Container()
home: SizedBox()
//박스 보이게하려면 아래처럼
home: Container(width: 50, height: 50, color: Colors.blue)
```

- 50의 단위는 [**LP**](https://www.notion.so/3c658724fd994e42849b7b48d3a26b77)임. 근데 위 코드 쳐도 화면 꽉차게 칠해짐. 그 이유는 좌표지정 안해주면 어디서부터 50씩 그릴지 모르기 때문. 그래서 좌표를 지정해주면 50만큼 그려짐. 50LP == 1.2cm정도

```dart
//가운데 위치부터 50씩 그려줘라
home: Center(
	child: Container(width: 50, height: 50, color: Colors.blue),
)
```

- Center 위젯 안에 Container 위젯 넣은거
- child는 항상 쓸 수 있는게 아니라 사용할 수 있는 위젯이 정해져있음.

# 가로세로 배치하는 법과 Scaffold

### 1. 커스텀 레이아웃

```dart
MaterialApp() //구글 스타일 위젯. 커스텀할 때도 이거 베이스로 시작
Cupertino()  //IOS 스타일 위젯
```

### 2. Scaffold

- 레이아웃을 상, 중, 하로 나누어주는 위젯
- 디폴트 기준점 == 왼쪽 위
- Ctrl + Space 누르면 자동완성 뜸

```dart
return MaterialApp(
      home: Scaffold( //레이아웃을 상 중 하로 나누어줌
        appBar: AppBar(), //상단
        body: Center(
          child: Container(
            color: Colors.blueGrey,
            height: 300,
            child: Row(  //body == 중단, Row == 레이아웃을 가로로 배치 (Column == 세로로 배치)
              mainAxisAlignment: MainAxisAlignment.center,  //가로축 정렬
              crossAxisAlignment: CrossAxisAlignment.center,  //세로축 정렬
              /*
                현재 Row 여서 정축이 가로니까 mainAxisAlignment 가 가로축이 되고,
                crossAxisAlignment 가 세로축이 된다. Column 으로 설정 시 반대
              */
              children: const [
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
              ],
            ),
          ),
        ),
          bottomNavigationBar: Text("Bottom"),  //하단
      )
    );
```

- 바텀바 만들기
  - SizeedBox가 Container보다 가벼움. 높이랑 너비정도 설정할거면 SizedBox 쓰는게 좋음.

```dart
return MaterialApp(
      home: Scaffold( //레이아웃을 상 중 하로 나누어줌
        appBar: AppBar(
          title: Text('앱 이름'),
        ), //상단
        body: Text('안녕'),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.phone),
                Icon(Icons.message),
                Icon(Icons.contact_page),
              ],
            ),
          ),
        ),
      )
    );
```

# Box 그리기

## Container

### mragin과 padding

컨테이너 안에서 설정 가능.

- `width: double.*infinity,*`
  - 화면에 꽉채워서 (안드로이드 match-parent 같은거)
- `margin: EdgeInsets.all(20),`
  - 그냥 숫자만 입력 x 위에처럼 해야됨.
- `padding: EdgeInsets.fromLTRB(50, 70, 50, 0),`
  - 4방향 각각 지정할 땐 위에처럼

## BoxDecoraion

### decoraion

세부적인 디자인할 때 씀.

- BoxDecoration 지정하면 Container에서는 색상 지정하면 안됨.

## 전체 코드

```dart
return MaterialApp(
      home: Scaffold( //레이아웃을 상 중 하로 나누어줌
        appBar: AppBar(
          title: Text('앱 이름'),
        ), //상단
        body: Align(  //박스 위치 정렬
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,height: 150, //color: Colors.blue, -> BoxDecoration 을 키면 box 안에서만 색상지정해야함
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.fromLTRB(50, 70, 50, 0),
            child: Text('hello'),
            decoration: BoxDecoration(  //세부적인 디자인할때
              border: Border.all(color: Colors.blueAccent)
            ),
          ),
        ),
      )
    );
```

# Typography와 Layout

## Text

### style 속성

- 사이즈, 굵기, 색상 등 설정함

```dart
return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('앱 이름'),
        ), //상단
        body: SizedBox(
          child: Text('hello',
          style: TextStyle(fontWeight: FontWeight.w700,
              color: Color(0xff161616), fontSize: 100),
          ),
        )
      )
    );
```

## Button

### TextButton

글자만 있는 버튼

```dart
					child: TextButton(
            child: Text('글자'),
            onPressed: (){},
          )
```

### ElevatedButton

색상 있고 공중에 띄워진 버튼

```dart
					child: ElevatedButton(
            child: Text('글자'),
            onPressed: (){},
          )
```

### IconButton

아이콘으로 된 버튼

```dart
				child: IconButton(
            icon: Icon(Icons.star),
            onPressed: (){},
          )
```

### floatingActionButton

공중에 떠있는 버튼

```dart
			floatingActionButton: FloatingActionButton(
          child: Text('button'),
          onPressed: (){
            print(a.toString());
            a++;
          },
        ),
```

## AppBar

- leading == 왼쪽 아이콘
- actions== 오른쪽 아이콘

```dart
				appBar: AppBar(
          title: Text('앱 이름'),
          leading: Icon(Icons.add_box_outlined),
          actions: const [Icon(Icons.star), Icon(Icons.airplanemode_active)],
        ),
```

# Expanded, Flexible

## Flexible

높이나 폭을 비율로 설정할 수 있음

```dart
				body: Row(
          children: [
            Flexible(child: Container(color: Colors.red,), flex: 3),
            Flexible(child: Container(color: Colors.amberAccent), flex: 7),
          ],
        )
```

## Expanded

flex를 1가진 것과 같음. 0dp느낌

```dart
				body: Row(
          children: [
            Expanded(child: Container(color: Colors.blue,)),
            Container(width: 100,color: Colors.green,)
          ],
        )
```

# 커스텀 위젯 만들기

## class로 만들기

1. stless 치고 tab 키 누르기
2. build 함수의 return에 축약할 코드 넣기

## 변수로 만들기

- 내용이 변하지 않는 레이아웃만 만드는게 좋음.

```dart
var a = SizedBox(
  child: Text('안녕'),
);
```

### 주의사항

아무거나 다 커스텀 위젯으로 만들면 state 관리가 힘들어짐.

페이지 하나를 커스텀 위젯으로 만들거나 재사용이 많은 위젯을 커스텀화 하는게 좋음.

# ListView

## ListTile

- 아이콘, 텍스트 형식으로 만들 수 있음

## ListView.builder

- 파라미터 2개 필요함
  - itemCount: 리스트 갯수
  - itemBuilder: () {return 반복할 위젯}

```dart
				body: ListView.builder(
              itemCount: 17,
              itemBuilder: (c,i){
                return ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black
                    ),
                    child: Icon(Icons.person_rounded,color: Colors.white,),
                  ),
                  title: Text('김수민',style: TextStyle(fontSize: 24),),
                );
              }
          ),
```

# StatefulWidget

위젯은 재렌더링해야 변경사항이 반영된다.

state를 쓰면 이걸 사용하는 위젯이 자동으로 재렌더링됨.

- stateful widget 만들려면 stful + 탭키 입력
- 메인페이지나 지금까지 만들었던 위젯은 StatelessWidget
- state변수 사용해서 상태변화하려면 setState 사용해야함

# Dialog와 Context

## Dialog

- context 있어야지 만들 수 있음.
- MaterialApp 부분 runApp쪽으로 빼야지 다이얼로그 뜸
- context 중에 MaterialApp이 들어있어야지 제대로 작동하기때문임.

```dart
build (context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(
              context: context,
              builder: (context){ return Dialog( child: Text('안녕'), ); },
            );
          },
        ),
```

- 위 코드처럼 짜면 동작 안함. 왜? showDialog 안에 있는 context는 MaterialApp 위에서 만들어짐. 근데 MaterialApp의 부모 위젯이 없음. 그래서 동작 안함.

### Dialog 뜨게 하는 법 1

- MaterialApp 부분 runApp쪽으로 뺸다

### Dialog 뜨게 하는 법 2

- Dialog를 bulider로 감싼다.
