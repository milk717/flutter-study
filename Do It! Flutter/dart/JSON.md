# JSON

## JSON Decoding

### 코드

```dart
import 'dart:convert';

void main(){
  var jsonString = '''
    [
      {"score": 40},
      {"score": 80}
    ]
  ''';

  var scores = jsonDecode(jsonString); //List
  print(scores);
  var firstScores = scores[0];  //Map
  print(firstScores);
  print(firstScores['score']);
}
```

### 실행결과

```
[{score: 40}, {score: 80}]
{score: 40}
40
```

## JSON Encoding

### 코드

```dart
import 'dart:convert';

void main(){
  var scores = [
      {'score': 40},
      {'score': 80}
];

  var jsonText = jsonEncode(scores);
  print(jsonText);
}
```

### 실행결과

```
[{"score":40},{"score":80}]
```

# 📌메모

- '작은따옴표' : 변수임을 표시.
- "큰따옴표" : JSON데이터임을 표시.
