# Reflection- отражение.
Для задания отражения через шейдер нужно использовать cubemap это тестуры, которые состоят из шести плоских частей в виде куба, что позволяет сымитировать цвет по направлению только в 3d, а не в 2D как в UV. 
 - раньше нужно было эти кубмапы генерить самому, но потом появился инстуремент, который делает это за нас это Reflection Probe
# Reflection Probe 
 - Для начала работы с этим компонентом нужно создать стандартынй материал и выкрутить у него на максимум Metallic(отвечает насколько сильно отражает) и Smoothess((гладкость) отвечает за размытие отражения) ![image](https://user-images.githubusercontent.com/38101615/202692453-be0b5c0c-ea72-4f2b-9ee7-fbf683725578.png)

 - Далее нужно создать компонент Reflection Probe и указать ему объем, при попадании в который будут включаться отражения.![image](https://user-images.githubusercontent.com/38101615/202692520-5821f11e-1f91-446e-87d9-3393442c6beb.png)

# Подсказки
 - чтобы не было проблем сам объект который отражает нужно добавить в игнор через слои (Culling mask в Reflection Probe) ![image](https://user-images.githubusercontent.com/38101615/202692573-d1fb6408-7040-4fe9-aa81-129edd1fd008.png)

 - по дефолту происходит запекание кубмапы и поэтому там ничего не будет, чтобы это исправить нужно сделать предметы, которые мы хотим чтобы отражались, static.
 - если хотим чтобы отражение было в реальном времени нужно изменить тип отражения в Reflection Probe c baked на RealTime, после этого поставить Refresh Mode в Every Frame и чтобы не было запаздований поставить Time Slicing в No time slicing.![image](https://user-images.githubusercontent.com/38101615/202692606-24a8b86f-c1d4-4f04-8906-da77a8ecbec0.png)
 - Это все еще будут отражение через кубмапы и у них не самое правдоподобное отражение, чтобы было честное отражение нужно добавить post prossesing и в нем включить эфект screen space reflection. https://docs.unity3d.com/560/Documentation/Manual/PostProcessing-ScreenSpaceReflection.html
 - чтобы отражение совпадало с полом в комнате нужно поставить box projection тогда будет более точное отражение и если правильно выставить размеры этого куба, то будет впечатляющее изображение.![image](https://user-images.githubusercontent.com/38101615/206199659-5f48b70f-2605-4d32-b149-e3828d30236b.png)

