Shader "Custom/Cutoff"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Metallic ("Metallic", Range(0,1)) = 0.0
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _CutoffTex ("Cut off Tex (RGB)", 2D) = "white" {}
        _ColorEmission ("Color Emission", Color) = (1,1,1,1)
        _CutoffCustom("Cutoff", Range(0, 1)) = 0.5
        _EmissionCoef ("Emission Coef", Range(0, 1)) = 0.5
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200
        Cull Off

        CGPROGRAM
        
        #pragma surface surf Standard fullforwardshadows
        
        #pragma target 3.0
        
        sampler2D _MainTex;
        sampler2D _CutoffTex;
        fixed4 _Color;
        float _CutoffCustom;
        float _EmissionCoef;
        half _Glossiness;
        half _Metallic;
        fixed4 _ColorEmission;

        struct Input
        {
            float2 uv_MainTex;
            float2 uv_CutoffTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            half dissolve_value = tex2D(_CutoffTex,IN.uv_CutoffTex).r-_CutoffCustom;
            clip(dissolve_value);

            if (dissolve_value < _EmissionCoef)
                o.Emission = _ColorEmission;
            
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex)*_Color;
            o.Metallic = _Metallic;
            o.Smoothness = _Glossiness;
            o.Albedo = c.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
