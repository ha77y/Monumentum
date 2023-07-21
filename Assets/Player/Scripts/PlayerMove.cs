using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMove : MonoBehaviour
{

    private CharacterController controller;

    // Start is called before the first frame update
    void Start()
    {

         controller = this.gameObject.GetComponent<CharacterController>(); 
        if (controller != null)
        {
            print("Got one");
        }
        else
        {
            this.gameObject.AddComponent<CharacterController>();
            print("Made one");
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
