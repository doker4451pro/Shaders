# Прозрачность (transparency)
Написание шейдоров с использованием прозрачности
***
Чтобы создать прозрачный шейдер нужно
*** 
Теги
 - Queue это очередь отрисовки чем больше значение тем позднее рисуется чтобы указать очережнотсь можно написать Queue+{число}
 - IgnoreProjector нужно выключать чтобы не отражался в компоненте projection 
 - RenderType это для того чтобы на лету переключать SubShader они меняются по этому тегу
***
#pragma нужно указать в конце типа освещения слово alpha чтобы рабоать с прозрачностью если еще дописать :fade то можно убрать еще и контур объекта чтобы была полная невидимость.
***
o.Alpha задать значение.
# Подсказки(Ключевые слова)
 - https://docs.unity3d.com/ru/530/Manual/SL-CullAndDepth.html
 - https://docs.unity3d.com/ru/2018.4/Manual/SL-ShaderLOD.html
 - https://docs.unity3d.com/Manual/SL-SurfaceShaders.html
***
![image](https://user-images.githubusercontent.com/38101615/204515373-1651006e-f464-4fae-927a-681a5411e3d5.png)

