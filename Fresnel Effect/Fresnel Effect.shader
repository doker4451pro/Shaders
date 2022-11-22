Shader "Custom/Fresnel Effect"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Emission ("Emission", color)=(1,1,1,1)
        _FresnelPower ("FresnelPower",Range(0,1))=0.5
        _Bias ("Bias",range(-1,1))=0.5
        _Scale ("Scale",range(-2,2))=0.5
        
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        
        #pragma surface surf Standard fullforwardshadows

        
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
            float3 viewDir;
        };
        
        fixed4 _Color;
        half3 _Emission;
        half _FresnelPower;
        half _Bias;
        half _Scale;
        

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            half4 c=tex2D(_MainTex,IN.uv_MainTex)* _Color;

            float fresnelCoef =1.0-saturate(dot(o.Normal,normalize(IN.viewDir)));
            fresnelCoef=saturate(_Bias+_Scale*pow(fresnelCoef,_FresnelPower));

            o.Albedo = c.rgb;
            o.Emission=_Emission*fresnelCoef;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
