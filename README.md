# Ubuntu18.04_NvidiaDriver-Cuda10.1_install

## 필요 환경
Ubuntu 18.04

## 설치되는 항목
Nvidia Driver\
CUDA 10.1

## 설치 방법
Ubuntu 터미널을 실행 시키고 아래의 bash파일을 실행한다.
~~~
sudo bash Nvidia_Driver_install.sh
~~~

## 주의사항
 Nvidia Driver 설치 홈페이지에서 자신의 그래픽 카드와 맞는 버전의 그래픽 드라이버를 확인한 후 설치하는 것이 좋습니다. 만약 프로그램에서 추천한 드라이버 버전과 홈페이지의 드라이버 버전이 다르다면 홈페이지 드라이버 버전으로 설치하시기 바랍니다.

## 설치확인
~~~
nvidia-smi
~~~
 그래픽 카드 정보가 출력되면 설치완료.