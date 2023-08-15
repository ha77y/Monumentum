Shader "Unlit/WaveShader1"
{
    Properties {
        _Speed("Speed",float)=1
        _Direction("Direction",Range(-1,1)) =1
        _StartColor("StartColor",Color) = (1,1,1,1)
        _EndColor("EndColor",Color) = (1,1,1,1)
        }
    SubShader{
        Tags{
            "RenderType"="Transparent"
            "Queue"="Transparent"
        }


        Pass{
            Zwrite off
            Blend One One
            cull off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag


            #include "UnityCG.cginc"


            #define TAU 6.283185307179586
            
            struct MeshData{
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float4 normals : NORMAL;
            };

            struct Interpolators{
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
                float4 normals : TEXCOORD1;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float _Speed;
            float _Direction;
            float4 _StartColor;
            float4 _EndColor;

            float4 getWave(float2 uv){
                float XOfset = cos(uv.x*TAU*8)*0.01;
                //float wave = abs(frac((uv.x)*5)*2 -1);
                float wave = cos((uv.y+XOfset) *TAU *5 +_Time.y*_Speed*_Direction)/2 +0.5;
                wave *=1-uv.y;
                return wave;
            }
            
            Interpolators vert(MeshData v){
                Interpolators o;
                
                UNITY_INITIALIZE_OUTPUT(Interpolators,o);
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                o.normals =v.normals;
                return o;
            }

            fixed4 frag(Interpolators i) : SV_Target{
                
                float4 Col = lerp(_StartColor,_EndColor,i.uv.y);
                return Col * getWave(i.uv).y * (abs(i.normals.y)<0.999);
            }
            ENDCG
        }
    }
}