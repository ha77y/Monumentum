Shader "Unlit/Shader1"
{
    Properties
    {
        _Scale("Scale",float) =1
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            float _Scale;

            struct MeshData
            {
                float4 vertex : POSITION;
                //float2 uv : TEXCOORD0;
                float3 normals : NORMAL;
                
            };

            struct Interpolator
            {
                float4 vertex : SV_POSITION;
                //float4 colour : TEXCOORD0;
                float3 norm : TEXCOORD1;
                float scale : TEXCOORD2;
            };
            
            

                // This Runs for every Vertex
            Interpolator vert (MeshData v)
            {
                Interpolator o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                //o.colour = _Color;
                o.norm = UnityObjectToWorldNormal(v.normals);
                o.scale = _Scale;
                return o;
            }
                // This Runs for every "Pixel" or Fragment
            fixed4 frag (Interpolator i) : SV_Target
            {
                
                return float4((i.norm.xyz)*i.scale,1);
            }
            ENDCG
        }
    }
}
