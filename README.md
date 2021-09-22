# BeautyRecommendationSystem
세안법, 세안제품 추천시스템
## 프로젝트 소개
![프로젝트소개](https://user-images.githubusercontent.com/45116112/83704389-f23c8800-a64c-11ea-9280-a173ab4bf1a9.JPG)

## 개발 환경
![개발환경](https://user-images.githubusercontent.com/45116112/83704397-f36db500-a64c-11ea-865c-3bf76d37e497.JPG)

## 프로젝트 일정
![프로젝트일정](https://user-images.githubusercontent.com/45116112/83704391-f23c8800-a64c-11ea-9e3d-b82a74f5b3d6.JPG)

## ERD
![ERD](https://user-images.githubusercontent.com/45116112/83704392-f2d51e80-a64c-11ea-89a6-f1c9544f17e1.JPG)

## 구현 화면
#### 관리자 로그인 / 로그아웃
![관리자 로그인로그아웃](https://user-images.githubusercontent.com/45116112/83704380-f072c480-a64c-11ea-980d-400869c66904.JPG)

#### 관리자 CRUD
![관리자 crud](https://user-images.githubusercontent.com/45116112/83704400-f36db500-a64c-11ea-912a-c0984a3eeda9.JPG)

#### 세안법, 세안제품 추천
![세안법, 세안제품 추천](https://user-images.githubusercontent.com/45116112/83704383-f10b5b00-a64c-11ea-916b-8f2c731b8a10.JPG)

#### 세안제품 리스트
![세안제품 리스트](https://user-images.githubusercontent.com/45116112/83704385-f1a3f180-a64c-11ea-8446-18b7df1eadad.JPG)

#### 제품 리뷰
![제품 리뷰](https://user-images.githubusercontent.com/45116112/83704387-f1a3f180-a64c-11ea-83c1-1070edf496b0.JPG)


## 세안 제품 추천 모델

##### 추천 진행 과정 

1. 연령대 피부타입 등 같은 사용자 특성과 피부고민을 가진 사용자그룹을 형성하여 사용자그룹-아이템 선호행렬을 생성

2. 아이템에 대한 선호패턴을 기준으로 사용자그룹 간 유사도 행렬을 생성

3. 사용자그룹 i가 뷰티제품 k를 얼마나 좋아할지를 예측

##### 추천 모델 구현 Import list

- Keras
- Scikit-learn
- Matplotlib
- Flask

##### 추천 모델 구조

- <a href="https://arxiv.org/pdf/1708.05031.pdf">Neural collaborative filtering (He et al., 2017)</a> 구조를 활용

   <img width="383" alt="ncf" src="https://user-images.githubusercontent.com/44460142/134361090-e075961f-0da9-43b0-8669-d8e51f528f7b.png">


  - Input Layer : One-hot 형태의 사용자 그룹, 뷰티제품번호  

  - Embedding Layer : `keras.layers.Embedding` 사용

  - MLP Layer : 

    - 각 Layer의 구성 : Fully Connected :arrow_right: Batch Normalization :arrow_right: ReLU :arrow_right: Dropout

      :small_red_triangle: 참고 : <a href="https://stackoverflow.com/questions/39691902/ordering-of-batch-normalization-and-dropout#answer-40295999">Ordering of Batch normalization and Dropout</a>

  - Output Layer : Sigmoid를 통해 나온 0(부적합)~1(적합) 사이의 값 

##### 추천 모델 Hyperparameters

- Epoch : 20
- Optimizer : Adam
- Learning rate : Default (0.001)
- Loss function : mean_absolute_error
- 사용자 latent factors : 1
- 뷰티제품 latent factors : 1
- Matrix Factorization latent factors : 2

##### 훈련 데이터셋 정보

- <a href="https://www.hwahae.co.kr/">화해</a> 화장품 플랫폼으로 부터 스킨케어 4종 (클렌저, 토너, 모이스춰라이저, 썬스크린)에 대한 총 59개 뷰티제품을 대상으로 각 카테고리 당 250개씩 총 1000개의 사용자리뷰 데이터를 수집하여 추천성능을 실험 진행함

- Data 형식

  ```python
  # User Group Attribute | Beauty item no. | Rating
  U120CO,56,4
  U120DR,56,5
  U130NE,56,4
  U120SE,56,5
  U120NE,56,4
  U120DR,56,4
  U120CO,56,4
  U130CO,57,3
  U130NE,57,4
  U130CO,57,3
  ```

  - Attributes of dataset and code
     
     <img width="378" alt="attribute" src="https://user-images.githubusercontent.com/44460142/134361103-0d2c3262-0731-4b01-95da-c32c00a4686a.png">

  - 5점 척도의 사용자후기 평점으로 이를 이진 변환하여 3점 초과이면 1(만족), 3점 미만이면 0(불만족)으로 표현하여 학습에 사용

- 전체 데이터셋의 70%는 훈련용으로 30%는 시험용으로 구분

- 검증용 데이터는 훈련데이터의 33%로 설정



#### 서버 정보

##### Web URL format

`http://203.247.53.215/topNRec?num={추천제품개수}&user={사용자 속성}`

##### Response Status

| Status Code |                          |
| ----------- | ------------------------ |
| 100         | Successfully recommended |
| 101         | Input Parameters error   |
| 102         | Invalid user code        |

