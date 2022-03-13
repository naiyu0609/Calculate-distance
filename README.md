# Calculate-distance
NTUST Computer Vision and Applications

In a 3D environment, we setup one camera and took one photo as the below figure. So far, we
know there are two boxes having known sizes (one is 50x50x50, the other is 100x100x100) and
being well aligned to coordinate’s axes. Each white g rid size on the ground is 10 x 10. The camera
is calibrated in advance, so the intrinsic parameter is given. The 3D coordinate of the right eye ball
of Santa Claus is ( 4.5, 2.5, 130.0) comparing to the origin O
![](https://github.com/naiyu0609/Calculate-distance/blob/main/png/1.PNG)

本次是要計算出projection matrix以及利用這個矩陣去計算出相機與目標物的距離，依照課本實作方式，不難做出P矩陣的解法，但解出P矩陣後如後利用它去計算距離才是重點。

在挑選7個點的過程中，我的想法是挑選出由XYZ軸所貫穿的平面，因此我挑選出了第1、2、3點所構成被Y軸貫穿的XZ平面，而第4、5、6點就構成了被X軸貫穿的YZ平面。最後一個點是必須考慮的點，因為我們有3個平面可以選擇，長寬100的上面、長寬50的上面以及藍色平面Z=0的平面，但經過我的挑選後我計算出選擇長寬50的上面我挑選的那個點是比較精準的，因此我最後選擇使用那個點作為7個點之一。
![](https://github.com/naiyu0609/Calculate-distance/blob/main/png/2.PNG)

中間的解法與課本的過程一樣，利用SVD解出P矩陣，然後我再利用K矩陣去解出RT矩陣，因為我們可以利用RT矩陣將3D的世界座標轉換到3D的相機空間座標，依左圖來看的話就是原本右眼的座標是相對於原點O所表示的，但我們可以透過RT矩陣將右眼相對於原點O轉換成相對於相機的座標，再透過這個相對於相機的座標我們可以依照著個向量去計算出兩者之間的距離。
![](https://github.com/naiyu0609/Calculate-distance/blob/main/png/3.PNG)

#### Projection Matrix
![](https://github.com/naiyu0609/Calculate-distance/blob/main/png/4.PNG)

#### Distance Vector
![](https://github.com/naiyu0609/Calculate-distance/blob/main/png/5.PNG)
