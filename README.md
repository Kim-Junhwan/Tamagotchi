# 다마고치 프로젝트 (새싹-Recap Assignment)

## 프로젝트 간단 소개

다마고치를 선택해서 키우는 앱

# 기능

## 먹이주기
- 다마고치에게 먹이를 주어 키울 수 있음
- 일정량 이상 먹이를 먹을 경우 레벨 업 및 레벨업 메세지 출력, 다마고치 이미지 변경
- 먹이는 한번에 먹을 수 있는 한계가 있음. 한계이상 먹이를 먹을 경우 먹이를 더이상 먹지 못한다고 메세지 출력
- UserDefaults를 이용하여 레벨및 먹이 먹은양을 저장

|먹이 주기|한계이상 먹이 줄 경우| 
| --- | --- | 
|![Simulator Screen Recording - iPhone 14 Pro - 2023-08-16 at 23 36 57](https://github.com/Kim-Junhwan/Tamagotchi/assets/58679737/aab2262c-f66b-4a0d-86cb-48a183adfd09)|![Simulator Screen Recording - iPhone 14 Pro - 2023-08-16 at 23 42 43](https://github.com/Kim-Junhwan/Tamagotchi/assets/58679737/df785d91-60f9-4195-8315-d39fecef9b7a)|


## 다마고치 변경
- 현재 선택한 다마고치 외 다른 다마고치로 변경
- 다마고치는 레벨과 먹은 먹이를 모두 공유함

![Simulator Screen Recording - iPhone 14 Pro - 2023-08-16 at 23 50 36](https://github.com/Kim-Junhwan/Tamagotchi/assets/58679737/6b94fbaf-01cb-48f4-b582-5362d532b33f)

## 유저 이름 변경
- 기본으로 설정되어있는 유저 이름은 "대장"
- UserDefaults를 이용하여 유저 이름 저장
- 유저이름은 2글자~6글자 사이

![Simulator Screen Recording - iPhone 14 Pro - 2023-08-16 at 23 55 42 (1)](https://github.com/Kim-Junhwan/Tamagotchi/assets/58679737/11a06da0-7a84-4915-bb20-f4ef7543bbc6)

## 초기화
- 초기화 시 유저 이름, 다마고치 데이터를 모두 초기값으로 변경

![Simulator Screen Recording - iPhone 14 Pro - 2023-08-16 at 23 58 29](https://github.com/Kim-Junhwan/Tamagotchi/assets/58679737/4b96588a-e0c4-498b-b219-3c4a6902145e)

# TIMELINE

## 2023년 8월 4일 

다마고치 프로젝트 생성 및 각 기능 구현

### 프로젝트 구조

![image](https://github.com/Kim-Junhwan/Tamagotchi/assets/58679737/c60493ed-912e-4117-9477-02c769b0c6b4)

- 다마고치 컨트롤러: 다마고치에게 먹이를 주는 기능 및 레벨업, 경험치 등 핵심 로직 구현 및 제어를 담당하는 객체
- UserDefaultsRepository: @propertyWrapper를 이용한 유저 정보나 먹은 먹이양을 UserDefaults에 저장하는 프로퍼티를 제공하는 객체

설정 화면의 경우 UserDefaultsRepository에 의존하지 않도록 하고 싶었지만, 시간 제약에 의해 주 기능인 다마고치를 제어하는 기능에만 각 책임을 분리하도록 구현.<br><br>
&nbsp;&nbsp;&nbsp;레벨업이나 각 먹이별 경험치같은 로직 및 원시값은 각 객체 (Level, Exp, Rice, WaterDrop)이 가지고 있음. 원시값을 감싸는 과정을 통해 책임을 분리하여, 다마고치 컨트롤러는 먹이를 먹으면 경험치를 더하고, 최대 먹이량 이상을 먹였을 경우 어떤 이벤트를 발생시킬 것인지 같은 제어 로직만 가지게 됨으로써 좀 더 유지보수하기 원할할 수 있도록 구현함.

## 2023년 8월 17일

다마고치 한꺼번에 먹을 수 있는 먹이 로직과 유저 이름 설정 로직 throws를 이용하여 리팩토링

### 기존
  
ViewController에서 먹이를 주는 이벤트를 TamagotchiController에 전달
TamagotchiController는 내부에서 먹을 수 있는 양인지 체크 및 체크 결과에 따라 표시할 다마고치 말 업데이트

```swift
 @IBAction func feedRiceButton(_ sender: UIButton) {
        let num = textFieldLogic(textField: feedRiceTextField)
        tamagotchiController.feed(Rice(), num: num)
        updateStatus()
        feed(food: Rice(), eatCount: num)
    }
```

```swift
func feed(_ food: Eatable, num: Int) {
        if !food.checkCanEat(num: num) {
            currentSpeech = "한꺼번에 이렇게 많이 먹을 수 없어요! 적당한 양을 주세요 \(userName)님!"
            return
        }
        currentSpeech = speechList.currentSpeech
        food.eaten(num: num)
}
```
### 리팩토링 후 

throws를 이용해 먹는양이 한계 이상일 경우 에러를 방출.
에러가 방출되면 ViewController에서 다마고치가 어떤 말을 할지를 결정 하도록 변경
```swift
func feed(food: Eatable, eatCount: Int) {
        do {
            try tamagotchiController.feed(food, num: eatCount)
            updateStatus()
        } catch FeedingError.toomuchFeed {
            speechLabel.text = "한꺼번에 이렇게 많은 밥을 먹을 수 없어요."
        } catch {
            print("unknownError: \(error)")
        }
}
```

```swift
enum FeedingError: Error {
    case toomuchFeed
}

func feed(_ food: Eatable, num: Int) throws {
        if !food.checkCanEat(num: num) {
            throw FeedingError.toomuchFeed
        }
        currentSpeech = speechList.currentSpeech
        food.eaten(num: num)
}
```
### 깨달은 점
- 여태까지 error handling은 (optional unwrapping, DB 저장 실패 등등)같은 치명적인 에러를 제어하는데만 사용하는 줄 알았으나, 지금 리팩토링 한것처럼 비즈니스 로직을 구현 하는데 있어서도 유용하게 사용 할 수 있음을 알았음. 
