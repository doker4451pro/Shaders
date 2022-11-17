# BlinnPhong
Это использование стандартной модели освещения. Для ее использования нужно вызвать #pragma surface surf BlinnPhong
***
Это более простая реализация чем Phong потому что используется полуверктор для вычислений (loat3 halfVector=normalize(lightDir+ viewDir);), что дает там прирост производительности. 
***
![image](https://user-images.githubusercontent.com/38101615/202419683-61f84b0c-42b8-42af-a7ab-554ccf897581.png)

***
подсказки
 - _SpecColor ("Specular Color", Color) = (1,1,1,1) не нужно объявлять в типах переменных, потому что она там уже есть
 - в файл Lighting.cginc, который находится в каталоге, куда вы установили Unity, в подпапке Data, то вы увидите, что в Unity уже есть модели освещения Lambert и BlinnPhong
 - реализация находится в файле CustomBlinnPhong