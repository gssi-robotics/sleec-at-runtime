# SLEEC ruleset

## SLEEC 1

> Start training time

<code style="color:green">Start training time</code>


**IF** It's time for an exercise session **THEN** (Greet in the user language *AND* Start session

**UNLESS** The user cares about privacy **IN WHICH CASE** (Greet in the user language _AND_

Close the door _AND_ Start session

**UNLESS** The room is too warm **IN WHICH CASE** (Ask for permission to keep the door

open

**UNLESS** Permission asked **IN WHICH CASE** (Do nothing))))

## SLEEC 1a

> Start training time

<code style="color:green">Start training time</code>

**IF** Permission asked _AND_ The user agrees to keep the door open **THEN** (Greet in the user's

language *AND* Start the session)

## SLEEC 1b

> Start training time

<code style="color:green">Start training time</code>

**IF** The room is too warm _AND_ Permission asked _AND_ The user does not agree to keep the

door open **THEN** (Alert the nurse _AND_ Close the door)

## SLEEC 2

> During training time

<code style="color:lightskyblue">During training time</code>

**IF** The user is not exercising **THEN** (Show the next exercise AFTER 1 minute,

**UNLESS** The user did fewer exercise repetitions than expected **IN WHICH CASE**

(Encourage the user

**UNLESS** The user has already been encouraged **IN WHICH CASE** (Get input from the user

through a graphical interface

**UNLESS** The user has physical issues resulting from the exercises **IN WHICH CASE** (Notify

the user that the session is suspended _AND_ Alert the nurse))))

## SLEEC 2a

> During training time

<code style="color:lightskyblue">During training time</code>

**IF** The user is exercising _AND_ complains about being tired **THEN** (Encourage the user

**UNLESS** The user expressed the preference to exercise in silence **IN WHICH CASE** (Do

nothing))

## SLEEC 3

> Anytime

<code style="color:orange">Anytime</code>

**IF** A person asks for user training and medical data **THEN** (Share data

**UNLESS** The user did not grant the consent *OR* the person is not authorized to access that

data **IN WHICH CASE** (Do not share data _AND_ Explain why))

## SLEEC 4

> Mealtime

<code style="color:purple">Mealtime</code>


**IF** It's meal time _AND_ The user is not yet ready **THEN** (Remember the user to eat

**UNLESS** The user is sleeping **IN WHICH CASE** (Gently wake up the user WITHIN 5 minutes

OTHERWISE Alert the nurse

**UNLESS** The user is in the REM stage of sleep **IN WHICH CASE** (Do not wake up the user

_AND_ Inform the nurse

**UNLESS** The user is at risk of hypoglycemia **IN WHICH CASE** (Alert the nurse))))

## SLEEC 5

> Anytime

<code style="color:orange">Anytime</code>


**IF** The user asks for food _AND_ it is not meal time **THEN** (Remind meal time _AND_ Explain

why the user cannot eat at the moment

**UNLESS** The user has a low glucose level **IN WHICH CASE** (Give a dietary-approved snack

_AND_ Inform the nurse))

## SLEEC 6

> Mealtime

<code style="color:purple">Mealtime</code>

**IF** It's meal time _AND_ The user is ready **THEN** (Deliver meal portions

**UNLESS** The user wants to eat something outside the dietary plan **IN WHICH CASE**

(Explain why the user should adhere to the diet _AND_ Deliver meal portions

**UNLESS** The results of the training exercise allow for a different food **IN WHICH CASE**

(Deliver dietary-approved different food)))