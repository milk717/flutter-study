# 비동기 처리

## 키워드

1. async : 비동기 키워드, 함수 앞에 붙임.
2. await : 언제 끝날지 모르는 작업 앞에 붙임.
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

위와 같은 코드를 실행하면  
end process  
12  
순서로 실행된다.
