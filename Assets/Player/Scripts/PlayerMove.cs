using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Unity.Physics;

public class PlayerMove : MonoBehaviour
{

    private Rigidbody RB;
    public float JumpHeight;

    // Start is called before the first frame update
    void Start()
    {

        RB = this.gameObject.GetComponent<Rigidbody>();    

        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            RB.AddForce(Vector3.up * JumpHeight);
        }
        
    }

    
}
