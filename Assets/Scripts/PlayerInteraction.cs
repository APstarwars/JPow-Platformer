using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerInteraction : MonoBehaviour
{
    public BoxCollider2D body;
    public CircleCollider2D feet;
    public BoxCollider2D Dean;
    public DialogueTrigger Deanspeak;
    public AudioSource select;

    // Update is called once per frame
    void Update()
    {
        if ((body.IsTouching(Dean) || feet.IsTouching(Dean)) && Input.GetButtonDown("Interact") && FindObjectOfType<DialogueManager>().speaking == false)
        {
            select.Play();
            Deanspeak.TriggerDialogue();
        }
        else if (Input.GetButtonDown("Interact"))
        {
            FindObjectOfType<DialogueManager>().DisplayNextSentence();
        }

        // [dev] switch between fullscreen and windowed
        if (Input.GetButtonDown("GWSwitch"))
        {
            if (Screen.fullScreen)
            {
                Screen.fullScreen = false;
            }
            else
            {
                Screen.fullScreen = true;
            }
        }
    }
}
