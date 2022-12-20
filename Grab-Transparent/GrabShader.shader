Shader "Unlit/GrabShader"
{
    Properties
    {
        _Color ("Color", Color) = (0.5,0,0,0)
    }
    SubShader
    {
        Tags { "Queue" = "Transparent" }
        GrabPass{  }
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"
            sampler2D _GrabTexture;
            
            half4 _Color;

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float4 uvgrab : TEXCOORD0;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
				o.uvgrab = ComputeGrabScreenPos(o.vertex);
                return o;
            }

            fixed4 frag (v2f i) : COLOR 
            {
                fixed4 col = tex2Dproj(_GrabTexture, i.uvgrab);
                return col*_Color;
            }
            ENDCG
        }
    }
}
