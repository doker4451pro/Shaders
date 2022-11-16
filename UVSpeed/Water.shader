Shader "Custom/Water"
{
    Properties
    {
        _MainTint("Diffuse Tint",Color)=(1,1,1,1)
        _MainTex ("Base (RGB)", 2D) = "white" {}
        _ScrollXSpeed ("X Scroll Speed", Range(0, 10)) = 2
        _ScrollYSpeed ("Y Scroll Speed", Range(0, 10)) = 2

    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        
        #pragma surface surf Standard fullforwardshadows

        fixed4 _MainTint;
        fixed _ScrollXSpeed;
        fixed _ScrollYSpeed;
        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        
        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed2 scrolledUV=IN.uv_MainTex;
            
            fixed xScrollValue=_ScrollXSpeed*_Time.x;
            fixed yScrollValue=_ScrollYSpeed*_Time.x;

            scrolledUV+=fixed2(xScrollValue,yScrollValue);

            fixed4 c = tex2D(_MainTex,scrolledUV);
            o.Albedo=c.rgb * _MainTint;
            o.Alpha=c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
