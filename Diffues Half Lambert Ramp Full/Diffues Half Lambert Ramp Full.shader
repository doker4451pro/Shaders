Shader "Custom/Diffues Half Lambert Ramp Full"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Color ("Color",Color)=(1,1,1,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        
        #pragma surface surf Diffuse

        sampler2D _MainTex;
        fixed4 _Color;

        struct Input
        {
            float2 uv_MainTex;
        };
        
        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color.rgb;
            o.Alpha=_Color.a;
        }
        
        inline float4 LightingDiffuse (SurfaceOutput s, fixed3 lightDir,fixed3 viewDir, fixed atten)
        {
            float difLight = dot(s.Normal, lightDir);
            float rimLight=dot(s.Normal,viewDir);
            float hLambert = difLight * 0.5 + 0.5;

            float3 ramp=tex2D(_MainTex,float2(hLambert,rimLight)).rgb;

            float4 col;

            col.rgb=s.Albedo+_LightColor0.rgb*ramp;
            col.a=s.Alpha;
            return col;
        }
        
        ENDCG
    }
    FallBack "Diffuse"
}
