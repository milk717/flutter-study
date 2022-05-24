# 비동기 처리

## 키워드

1. async : 비동기 키워드, 함수이름 뒤. {} 앞에 붙임.
2. await : 언제 끝날지 모르는 작업 앞에 붙임.
   - await가 속한 함수를 호출한 똑의 프로세스가 끝날 때 까지 기다림.
3. Future : await로 작업을 마친 결과를 받기 위해 비동기 함수 앞에 붙임.

## 예제 코드

```dart
void main() {
checkVersion();
print('end process');
}

Future checkVersion() async{
var version = await lookUpVersion();
print(version);
}

int lookUpVersion(){
return 12;
}
```

## 실행결과

```
end process
12
```

---

## 비동기 함수가 반환하는 값 활용

- then() : 비동기 함수가 반환하는 값 처리하기
- error : 예외처리

## 예제 코드

```dart
void main() async{  //메인함수를 비동기로 만든다.
  await getVersionName().then((value)=>{
    print(value)
  });
  print('end process');
}

Future<String> getVersionName() async{
  var versionName = await lookUpVersionName();
  return versionName;
}

String lookUpVersionName(){
  return 'Android Q';
}
```

##실행결과

```
Android Q
end process
```
