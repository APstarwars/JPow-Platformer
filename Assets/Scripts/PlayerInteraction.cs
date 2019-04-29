using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerInteraction : MonoBehaviour
{
    public BoxCollider2D body;
    public CircleCollider2D feet;
    public BoxCollider2D NPC;
    public AudioSource select;

    // Update is called once per frame
    void Update()
    {
        if ((body.IsTouching(NPC) || feet.IsTouching(NPC)) && Input.GetButtonDown("Interact"))
        {
            select.Play();
        }
    }
}
